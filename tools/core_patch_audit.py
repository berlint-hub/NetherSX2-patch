#!/usr/bin/env python3
"""Audit (and selectively apply) the NetherSX2 core hex patches on a libemucore.so.

Works on any core derived from the AetherSX2/NetherSX2 **4248** build, i.e.

  * the Android core inside xyz.nethersx2.android_adreno.apk
  * the Nintendo Switch port cores from berlint-hub/TEST3
    (libemucore.so, libemucore_tegrax1.so, libemucore_tegrax1_spinrelax.so)

The point is the difference between the three patch classes:

  PATTERN   matched by a unique byte pattern -> safe to apply to a new build,
            keeps working when the core shifts around (`--apply tegra`).
  OFFSET    only valid for the exact 4248 binaries (md5/sha pinned). Reported,
            never applied unless the surrounding signature also matches.
  VENDOR    compiled behind a GPU-vendor test. On the Switch (Tegra X1,
            NVIDIA vendor 0x10DE) these branches are never taken, so they are
            reported as not-applicable instead of silently "passing".

Usage:
    python3 tools/core_patch_audit.py <libemucore.so>
    python3 tools/core_patch_audit.py <core.so> --apply tegra -o patched.so
    python3 tools/core_patch_audit.py <core.so> --apply tegra,ra --in-place
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path

# ---------------------------------------------------------------------------
# PATTERN patches: (stock bytes, patched bytes, description)
# The replacement is always the same length, so file layout never shifts.
# ---------------------------------------------------------------------------
PATTERN_PATCHES: dict[str, tuple[bytes, bytes, str]] = {
    "scale_clamp": (
        # fmin s1,s0,s1 / fmov s2,#0.5 / fcmp s0,s2 / fcsel s0,s2,s1,mi
        bytes.fromhex("0158211e02102c1e0020221e404c211e"),
        #                                          -> fmov s0,s1
        bytes.fromhex("0158211e02102c1e0020221e2040201e"),
        "upscale_multiplier: remove the 0.5x minimum clamp (0.05x/0.1x/0.25x)",
    ),
    "preload_default": (
        # tst w0,#1 / csel w0,w8,wzr,ne / add x23,sp,#8 / add x8,sp,#8 / bl
        # 16 bytes, because "tst w0,#1 ; csel ..." alone occurs 33x in the core
        bytes.fromhex("00119f1af7230091e823009186590c94"),
        #  -> mov w0,#2
        bytes.fromhex("40008052f7230091e823009186590c94"),
        "texture_preloading default = 2 (Full) in setDefaultSettings",
    ),
    "preload_fallback": (
        # strb w0,[x21,#7] / ldrb w3,[x21,#8] / ldr x8,[x20]
        bytes.fromhex("00013fd6a01e0039a3224039880240f9"),
        #                          -> mov w3,#2
        bytes.fromhex("00013fd6a01e003943008052880240f9"),
        "texture_preloading fallback = 2 (Full) in GSSettings::Load",
    ),
    "ra_scarface": (
        # tst w8,#1 / csel x8,x10,x9,eq / cbz x8, .+0x1c (zero-length guard)
        # / adrp x8 / ldrb w8 / cbz w8 / mov w21,wzr - 28 bytes to stay unique
        bytes.fromhex("1f0100724801899ae80000b488f005d008716139e8050034f5031f2a"),
        #             -> b .+0x10
        bytes.fromhex("1f0100724801899a04000014" "88f005d008716139e8050034f5031f2a"),
        "RetroAchievements: Scarface (SLUS-211.11) hash no longer dropped "
        "by the zero-length check (from decomp/Hackify.bat, absent from "
        "every 4248 core so far)",
    ),
}

# ---------------------------------------------------------------------------
# OFFSET checks: pinned to the 4248 layout. `stock`/`patched` are 4-byte words.
# ---------------------------------------------------------------------------
OFFSET_CHECKS: list[tuple[str, int, bytes, bytes, str]] = [
    ("sig_check_1", 0x838560, bytes.fromhex("c00c0034"), bytes.fromhex("66000014"),
     "license signature check #1 bypassed"),
    ("sig_check_2", 0x83B324, bytes.fromhex("400c0034"), bytes.fromhex("62000014"),
     "license signature check #2 bypassed"),
    ("bios_type", 0x829248, bytes.fromhex("f5079f1a"), bytes.fromhex("35008052"),
     "BIOS type check bypassed"),
    ("datadir_a", 0x83A3EC, bytes.fromhex("e0c200b4"), bytes.fromhex("ac000014"),
     "custom data directory: package-name gate #1"),
    ("datadir_b", 0x83A430, bytes.fromhex("06060014"), bytes.fromhex("9b000014"),
     "custom data directory: package-name gate #2"),
    ("datadir_c", 0x83A790, bytes.fromhex("c0a500b4"), bytes.fromhex("51000014"),
     "custom data directory: package-name gate #3"),
    ("datadir_d", 0x83A7D4, bytes.fromhex("1d050014"), bytes.fromhex("40000014"),
     "custom data directory: package-name gate #4"),
]

# ---------------------------------------------------------------------------
# VENDOR patches: only reachable on the GPU vendor they were written for.
# ---------------------------------------------------------------------------
VENDOR_CHECKS: dict[str, tuple[bytes, bytes, str]] = {
    "mali_dualsrc": (
        bytes.fromhex("49010052490000344d008052"),   # branch alive (driver check)
        bytes.fromhex("490100521f2003d54d008052"),   # branch NOPed (forced off)
        "dual-source blending forced off on ARM Mali (vendor 0x13B5)",
    ),
}

# The 6 fatal "Required format %u is missing bits" branches (GSDeviceVK).
FORMAT_TARGETS_4248 = [0x65b2dc, 0x65b2e4, 0x65b2ec, 0x65b2f4, 0x65b2fc, 0x65b304]
FORMAT_WINDOW_4248 = (0x65AF00, 0x65B100)
ARM64_NOP = bytes.fromhex("1f2003d5")

# ---------------------------------------------------------------------------
# Tegra X1 extras: 5 words that TEST3's libemucore_tegrax1.so carries on top of
# the three pattern patches. Purpose is not documented upstream; they zero the
# arguments of, and NOP out, a call that takes the "UI" settings section.
# Offsets are pinned to that build, so they are report-only by default.
# ---------------------------------------------------------------------------
TEGRA_EXTRAS: list[tuple[int, bytes, bytes]] = [
    (0x840F4C, bytes.fromhex("22008052"), bytes.fromhex("e2031f2a")),  # mov w2,#1 -> wzr
    (0x840F50, bytes.fromhex("23008052"), bytes.fromhex("e3031f2a")),  # mov w3,#1 -> wzr
    (0x840F5C, bytes.fromhex("39a6fe97"), bytes.fromhex("1f2003d5")),  # bl      -> nop
    (0x840FD8, bytes.fromhex("22008052"), bytes.fromhex("e2031f2a")),  # mov w2,#1 -> wzr
    (0x840FE8, bytes.fromhex("16a6fe97"), bytes.fromhex("1f2003d5")),  # bl      -> nop
]

KNOWN_CORES = {
    "6f4473845483fa2e": "TEST3 4248 stock (NetherSX2 core, NEW version string)",
    "be64362a525e43e6": "TEST3 libemucore_tegrax1.so (stock + 8-word Tegra patch)",
    "b2dd3b6bf7c7a90f": "TEST3 libemucore_tegrax1_spinrelax.so (Tegra + spin-relax)",
    "4b3bdae4d6b7113d": "NetherSX2 4248 from the xdelta (pre-build-pipeline)",
    "10f659b0d30adea8": "AetherSX2 v1.5-4248 (base APK core)",
}


@dataclass
class Result:
    name: str
    state: str          # PATCHED / STOCK / N/A / UNKNOWN
    detail: str
    offsets: list[int] = field(default_factory=list)


def _fmt(data: bytes) -> str:
    return data.hex()


def check_patterns(data: bytes) -> list[Result]:
    out: list[Result] = []
    for name, (stock, patched, desc) in PATTERN_PATCHES.items():
        n_stock, n_patched = data.count(stock), data.count(patched)
        if n_patched == 1 and n_stock == 0:
            state, detail = "PATCHED", f"1 site ({desc})"
        elif n_stock == 1 and n_patched == 0:
            state, detail = "STOCK", desc
        elif n_stock == 0 and n_patched == 0:
            state, detail = "UNKNOWN", "pattern not found - core is not a 4248 build, or code changed"
        else:
            state, detail = "UNKNOWN", f"ambiguous: stock={n_stock} patched={n_patched} sites"
        out.append(Result(name, state, detail))
    return out


def check_offsets(data: bytes) -> list[Result]:
    out: list[Result] = []
    for name, off, stock, patched, desc in OFFSET_CHECKS:
        if off + 4 > len(data):
            out.append(Result(name, "N/A", "offset beyond EOF"))
            continue
        cur = data[off:off + 4]
        if cur == patched:
            out.append(Result(name, "PATCHED", desc, [off]))
        elif cur == stock:
            out.append(Result(name, "STOCK", desc, [off]))
        else:
            out.append(Result(name, "UNKNOWN",
                              f"0x{off:x} holds {_fmt(cur)}, expected {_fmt(stock)}/{_fmt(patched)}",
                              [off]))
    return out


def check_vendor(data: bytes) -> list[Result]:
    out: list[Result] = []
    for name, (alive, forced, desc) in VENDOR_CHECKS.items():
        if data.count(forced) == 1:
            out.append(Result(name, "PATCHED", f"forced off - {desc}"))
        elif data.count(alive) == 1:
            out.append(Result(name, "STOCK", f"driver check alive - {desc}"))
        else:
            out.append(Result(name, "UNKNOWN", "pattern not found"))
    return out


def count_format_branches(data: bytes) -> list[int]:
    """Return the addresses of b.ne sites that jump to a fatal format check."""
    lo, hi = FORMAT_WINDOW_4248
    if len(data) < hi:
        return []
    sites: list[int] = []
    for i in range(lo, hi, 4):
        w = struct.unpack("<I", data[i:i + 4])[0]
        if (w & 0xFF00001F) != 0x54000001:      # b.ne
            continue
        imm = (w >> 5) & 0x7FFFF
        if imm >= (1 << 18):
            imm -= (1 << 19)
        if i + (imm << 2) in FORMAT_TARGETS_4248:
            sites.append(i)
    return sites


def check_tegra_extras(data: bytes) -> Result:
    states = []
    for off, stock, patched in TEGRA_EXTRAS:
        cur = data[off:off + 4]
        if cur == patched:
            states.append("PATCHED")
        elif cur == stock:
            states.append("STOCK")
        else:
            states.append("UNKNOWN")
    if all(s == "PATCHED" for s in states):
        return Result("tegra_extras", "PATCHED",
                      "5/5 words applied (2 call sites NOPed, args zeroed)",
                      [o for o, _, _ in TEGRA_EXTRAS])
    if all(s == "STOCK" for s in states):
        return Result("tegra_extras", "STOCK",
                      "0/5 words applied - present only in TEST3's tegrax1 builds",
                      [o for o, _, _ in TEGRA_EXTRAS])
    return Result("tegra_extras", "UNKNOWN", f"mix: {states}")


def apply_patterns(data: bytearray, names: list[str]) -> list[str]:
    applied = []
    for name in names:
        if name not in PATTERN_PATCHES:
            raise SystemExit(f"unknown patch '{name}'; choose from {', '.join(PATTERN_PATCHES)}")
        stock, patched, _ = PATTERN_PATCHES[name]
        n_stock, n_patched = data.count(stock), data.count(patched)
        if n_patched == 1 and n_stock == 0:
            applied.append(f"{name}: already patched")
            continue
        if n_stock != 1 or n_patched != 0:
            raise SystemExit(f"{name}: expected exactly 1 stock site, found "
                             f"stock={n_stock} patched={n_patched} - refusing to guess")
        idx = data.index(stock)
        data[idx:idx + len(stock)] = patched
        applied.append(f"{name}: patched at 0x{idx:x}")
    return applied


def report(path: Path, data: bytes) -> int:
    sha = hashlib.sha256(data).hexdigest()
    print(f"file    : {path}")
    print(f"size    : {len(data)} bytes")
    print(f"sha256  : {sha}")
    known = KNOWN_CORES.get(sha[:16])
    print(f"core    : {known or 'unrecognised (not a pinned 4248 build)'}")
    print()

    patterns = check_patterns(bytes(data))
    offsets = check_offsets(bytes(data))
    vendor = check_vendor(bytes(data))
    groups = [
        ("pattern patches (portable)", patterns),
        ("offset checks (pinned to 4248 layout)", offsets),
        ("vendor-gated patches", vendor),
    ]
    unknown = 0
    for title, results in groups:
        print(f"{title}:")
        for r in results:
            mark = {"PATCHED": "ok  ", "STOCK": "STOCK", "N/A": "n/a ",
                    "UNKNOWN": "??  "}[r.state]
            print(f"  [{mark}] {r.name:16s} {r.detail}")
        print()

    sites = count_format_branches(bytes(data))
    live = [s for s in sites if bytes(data)[s:s + 4] != ARM64_NOP]
    print("vulkan format-check branches (4248):")
    if not sites:
        print("  [?] no b.ne sites matched - layout differs from 4248")
    else:
        print(f"  [{ 'ok  ' if len(live) == len(sites) else '?? ' }] {len(sites)} sites, "
              f"{len(live)} still enforcing the driver format check "
              f"({', '.join(f'0x{s:x}' for s in sites)})")
        print("       Keeping them live is correct on NVK as long as the emulator "
              "boots: the workaround only matters for drivers that reject a format bit.")
    print()

    extra = check_tegra_extras(bytes(data))
    mark = {"PATCHED": "ok  ", "STOCK": "STOCK", "UNKNOWN": "??  "}[extra.state]
    print(f"  [{mark}] {extra.name:16s} {extra.detail}")
    print()

    unknown = sum(1 for r in patterns + offsets + vendor + [extra] if r.state == "UNKNOWN")
    return unknown


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("core", type=Path, help="libemucore.so to inspect")
    ap.add_argument("--apply", default="",
                    help="comma-separated pattern patches to apply: "
                         f"{','.join(PATTERN_PATCHES)}, or the aliases 'tegra' "
                         "(the 3 patches TEST3's tegrax1 core carries) and 'ra'")
    ap.add_argument("-o", "--output", type=Path, help="write the patched core here")
    ap.add_argument("--in-place", action="store_true", help="overwrite the input file")
    args = ap.parse_args()

    data = bytearray(args.core.read_bytes())
    if args.apply:
        aliases = {
            "tegra": ["scale_clamp", "preload_default", "preload_fallback"],
            "ra": ["ra_scarface"],
        }
        names = []
        for token in args.apply.split(","):
            token = token.strip()
            if token in aliases:
                names += aliases[token]
            elif token:
                names.append(token)
        for line in apply_patterns(data, names):
            print(line)
        print()
        if not (args.output or args.in_place):
            raise SystemExit("--apply needs -o <file> or --in-place")
        dest = args.core if args.in_place else args.output
        dest.write_bytes(data)
        print(f"written: {dest}\n")

    # Audit is informational: STOCK just means "this patch is not applied".
    # UNKNOWN means the bytes do not match a known 4248 build at all.
    sys.exit(1 if report(args.core, bytes(data)) else 0)


if __name__ == "__main__":
    main()
