# Auditing a 4248 core with `tools/core_patch_audit.py`

All 4248-based cores share one layout: the AetherSX2 APK core, the NetherSX2
xdelta output, and the Switch port cores in `berlint-hub/TEST3`
(`libemucore.so`, `libemucore_tegrax1.so`, `libemucore_tegrax1_spinrelax.so`)
are 12,162,984-byte builds of the same binary.

```
python3 tools/core_patch_audit.py <libemucore.so>                 # report only
python3 tools/core_patch_audit.py <core.so> --apply tegra -o out.so
python3 tools/core_patch_audit.py <core.so> --apply ra -o out.so
```

Patch classes:

| class | example | portable? |
|---|---|---|
| PATTERN | `scale_clamp`, `preload_default`, `preload_fallback`, `ra_scarface` | unique byte pattern, safe on new builds |
| OFFSET | signature bypass, BIOS check, data-dir gates | pinned to the 4248 layout |
| VENDOR | Mali dual-source blending | never reached on Tegra X1 (vendor 0x10DE) |

## What the TEST3 Tegra cores actually contain

`libemucore_tegrax1.so` is the stock NetherSX2 4248 core plus **8 changed
words**, nothing else:

| offset | stock | tegra | meaning |
|---|---|---|---|
| `0x4bab8c` | `fcsel s0,s2,s1,mi` | `fmov s0,s1` | removes the 0.5x upscale clamp |
| `0x4bac34` | `ldrb w3,[x21,#8]` | `mov w3,#2` | texture_preloading fallback = Full |
| `0x84179c` | `csel w0,w8,wzr,ne` | `mov w0,#2` | texture_preloading default = Full |
| `0x840f4c` | `mov w2,#1` | `mov w2,wzr` | undocumented |
| `0x840f50` | `mov w3,#1` | `mov w3,wzr` | undocumented |
| `0x840f5c` | `bl 0x7ea840` | `nop` | undocumented |
| `0x840fd8` | `mov w2,#1` | `mov w2,wzr` | undocumented |
| `0x840fe8` | `bl 0x7ea840` | `nop` | undocumented |

`--apply tegra` reproduces the first three from the stock core and stops there;
the five undocumented words stay reference-only because the callee at
`0x7ea840` is a settings getter for the `"UI"` section whose return value the
call site does not use, so their purpose cannot be stated safely.

The spinrelax build is byte-identical to `libemucore_tegrax1.so` outside the
spin-relax edits (648 words, 81 regions).

## Patches that are deliberately *not* carried over

* Mali dual-source-blend lock (`0x65b2dc` region) - the check is compiled for
  ARM Mali (`0x13B5`); on Tegra X1 (NVIDIA `0x10DE`) the branch is never taken.
* The six `b.ne` branches to the fatal "Required format %u is missing bits"
  aborts are **left enforcing** in every Switch core. They only need NOPing for
  drivers that reject a format bit; NVK boots the emulator, so keep them.
* Custom data-directory gates (`0x83a3ec`...) - the wrapper supplies its own
  data directory; on Android these are applied at build time instead.
* The licence-signature and BIOS-type bypasses are already present in every
  NetherSX2-derived core (base APK core shows the original `cbz`).

## Open candidate

The RetroAchievements zero-length guard from `decomp/Hackify.bat`
(`0x81b264`, `cbz x8` -> `b`) is present in **no** 4248 core, including the
Switch ones. Test with `--apply ra` if RA hashes are missing for Scarface
(SLUS-211.11); it is unvalidated on hardware.
