#!/usr/bin/env python3
"""Build NetherSX2 Adreno and Mali APKs with 0.25x resolution scale and generate xdelta."""
from __future__ import annotations

import hashlib
import os
import re
import shutil
import struct
import subprocess
import sys
import tempfile
import urllib.request
import zipfile
import zlib
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
DECOMP_LIB = REPO_ROOT / "decomp" / "lib"
PATCHES_DIR = REPO_ROOT / "patches"

# Adreno paths
ADRENO_SRC_APK = REPO_ROOT / "apk" / "xyz.aethersx2.android_v1.5-4248_adreno.apk"
ADRENO_FALLBACK_APK = REPO_ROOT / "15210-v1.5-4248.apk"
ADRENO_URL = "https://github.com/Trixarian/NetherSX2-patch/releases/download/0.0/15210-v1.5-4248.apk"
ADRENO_MD5 = "c98b0e4152d3b02fbfb9f62581abada5"
ADRENO_NETHERSX2_XDELTA = REPO_ROOT / "old" / "scripts" / "builder" / "lib" / "nethersx2.xdelta"

# Mali input source paths
MALI_SRC_APK = REPO_ROOT / "apk" / "xyz.aethersx2.android_v1.5-3668_mali.apk"
MALI_FALLBACK_APK = REPO_ROOT / "13930-v1.5-3668.apk"
MALI_URL = "https://github.com/Trixarian/NetherSX2-classic/releases/download/0.0/13930-v1.5-3668.apk"
MALI_MD5 = "4a1751fa99bc4dcd647114c4d64e7985"
MALI_CLASSIC_XDELTA_URL = "https://github.com/Trixarian/NetherSX2-classic/releases/download/1.0/nethersx2-classic.xdelta"
MALI_CLASSIC_XDELTA = REPO_ROOT / "nethersx2-classic.xdelta"

# Output NetherSX2 APKs
NETHERSX2_ADRENO_APK = REPO_ROOT / "xyz.nethersx2.android_adreno.apk"
NETHERSX2_MALI_APK = REPO_ROOT / "xyz.nethersx2.android_mali.apk"

# Aliases
ADRENO_FINAL_APK = NETHERSX2_ADRENO_APK
MALI_FINAL_APK = NETHERSX2_MALI_APK
ADRENO_FINAL_XDELTA = REPO_ROOT / "xyz.aethersx2.android_.xdelta"

# Tools
APKEDITOR_JAR = DECOMP_LIB / "APKEditor.jar"
APKEDITOR_URL = "https://github.com/REAndroid/APKEditor/releases/download/V1.4.9/APKEditor-1.4.9.jar"
APKSIGNER_JAR = DECOMP_LIB / "apksigner.jar"
BAKSMALI_JAR = DECOMP_LIB / "baksmali.jar"
BAKSMALI_URL = "https://bitbucket.org/JesusFreke/smali/downloads/baksmali-2.5.2.jar"
SMALI_JAR = DECOMP_LIB / "smali.jar"
SMALI_URL = "https://bitbucket.org/JesusFreke/smali/downloads/smali-2.5.2.jar"
KEYSTORE = DECOMP_LIB / "android.jks"


def run_cmd(cmd: list[str]) -> None:
    print("+ " + " ".join(cmd), flush=True)
    subprocess.run(cmd, check=True)


def get_xdelta_bin() -> str:
    xdelta_bin = shutil.which("xdelta3") or shutil.which("xdelta")
    if not xdelta_bin:
        raise SystemExit("xdelta3 executable not found")
    return xdelta_bin


def ensure_apkeditor() -> Path:
    if not APKEDITOR_JAR.exists():
        print(f"Downloading APKEditor from {APKEDITOR_URL}...")
        urllib.request.urlretrieve(APKEDITOR_URL, APKEDITOR_JAR)
    return APKEDITOR_JAR


def ensure_baksmali() -> list[str]:
    if shutil.which("baksmali"):
        return ["baksmali"]
    if not BAKSMALI_JAR.exists():
        print(f"Downloading baksmali from {BAKSMALI_URL}...")
        BAKSMALI_JAR.parent.mkdir(parents=True, exist_ok=True)
        urllib.request.urlretrieve(BAKSMALI_URL, BAKSMALI_JAR)
    return ["java", "-jar", str(BAKSMALI_JAR)]


def ensure_smali() -> list[str]:
    if shutil.which("smali"):
        return ["smali"]
    if not SMALI_JAR.exists():
        print(f"Downloading smali from {SMALI_URL}...")
        SMALI_JAR.parent.mkdir(parents=True, exist_ok=True)
        urllib.request.urlretrieve(SMALI_URL, SMALI_JAR)
    return ["java", "-jar", str(SMALI_JAR)]


def align_apk(input_apk: Path, output_apk: Path, alignment: int = 4) -> None:
    pad_header_id = 0xD935
    with zipfile.ZipFile(input_apk, "r") as zin, zipfile.ZipFile(output_apk, "w") as zout:
        for src in zin.infolist():
            info = zipfile.ZipInfo(src.filename, date_time=src.date_time)
            info.compress_type = src.compress_type
            info.comment = src.comment
            info.external_attr = src.external_attr
            info.internal_attr = src.internal_attr
            info.create_system = src.create_system
            info.extra = src.extra
            data = zin.read(src.filename)

            if src.compress_type == zipfile.ZIP_STORED:
                filename_len = len(src.filename.encode("utf-8"))
                data_offset = zout.fp.tell() + 30 + filename_len + len(info.extra)
                needed = (-data_offset) % alignment
                if needed:
                    total_extra = needed if needed >= 4 else needed + alignment
                    payload_len = total_extra - 4
                    info.extra += (
                        pad_header_id.to_bytes(2, "little")
                        + payload_len.to_bytes(2, "little")
                        + (b"\x00" * payload_len)
                    )

            zout.writestr(info, data)


def zipalign_apk(input_apk: Path, output_apk: Path) -> None:
    if shutil.which("zipalign"):
        run_cmd(["zipalign", "-f", "-p", "4", str(input_apk), str(output_apk)])
    else:
        align_apk(input_apk, output_apk)


def sign_apk(unsigned_apk: Path, signed_apk: Path) -> None:
    run_cmd([
        "java", "-jar", str(APKSIGNER_JAR),
        "sign",
        "--ks", str(KEYSTORE),
        "--ks-pass", "pass:android_sign",
        "--key-pass", "pass:android_sign_alias",
        "--out", str(signed_apk),
        str(unsigned_apk),
    ])
    run_cmd(["java", "-jar", str(APKSIGNER_JAR), "verify", "--verbose", str(signed_apk)])


def get_adreno_base_apk() -> Path:
    if ADRENO_SRC_APK.exists():
        md5 = hashlib.md5(ADRENO_SRC_APK.read_bytes()).hexdigest()
        if md5 == ADRENO_MD5:
            return ADRENO_SRC_APK
    if ADRENO_FALLBACK_APK.exists():
        md5 = hashlib.md5(ADRENO_FALLBACK_APK.read_bytes()).hexdigest()
        if md5 == ADRENO_MD5:
            return ADRENO_FALLBACK_APK

    print(f"Downloading Adreno base APK from {ADRENO_URL}...")
    urllib.request.urlretrieve(ADRENO_URL, ADRENO_FALLBACK_APK)
    return ADRENO_FALLBACK_APK


def get_mali_base_apk() -> Path:
    if MALI_SRC_APK.exists():
        md5 = hashlib.md5(MALI_SRC_APK.read_bytes()).hexdigest()
        if md5 == MALI_MD5:
            return MALI_SRC_APK
    if MALI_FALLBACK_APK.exists():
        md5 = hashlib.md5(MALI_FALLBACK_APK.read_bytes()).hexdigest()
        if md5 == MALI_MD5:
            return MALI_FALLBACK_APK

    print(f"Downloading Mali base APK from {MALI_URL}...")
    urllib.request.urlretrieve(MALI_URL, MALI_FALLBACK_APK)
    return MALI_FALLBACK_APK


def remove_custom_controller_buttons(work_dir: Path) -> None:
    # Delete all custom controller PNG button images from the APK
    deleted = 0
    for png in list(work_dir.rglob("ic_controller_*.png")):
        png.unlink()
        deleted += 1
    print(f"Deleted {deleted} custom controller PNG images from {work_dir.name}")

    # Restore clean original AetherSX2 vector XML buttons (plain text XML)
    buttons_dir = REPO_ROOT / "patches" / "controller_buttons"
    if buttons_dir.exists():
        restored = 0
        for res_dir in work_dir.rglob("res"):
            if res_dir.is_dir():
                dest_drawable = res_dir / "drawable"
                dest_drawable.mkdir(parents=True, exist_ok=True)
                for xml_file in buttons_dir.glob("*.xml"):
                    shutil.copyfile(xml_file, dest_drawable / xml_file.name)
                    restored += 1
        print(f"Restored {restored} clean original AetherSX2 controller vector XML buttons.")


def apply_mali_optimizations(work_dir: Path) -> None:
    print("Applying exclusive Mali GPU core, rendering, and CPU-affinity performance optimizations...")
    import re

    def update_preference_xml(file_path: Path, updates: dict[str, str]) -> int:
        if not file_path.exists():
            return 0
        text = file_path.read_text(encoding="utf-8")
        original = text
        for key, new_val in updates.items():
            def replace_default(m: re.Match) -> str:
                tag = m.group(0)
                if "app:defaultValue=" in tag:
                    return re.sub(r'app:defaultValue="[^"]*"', f'app:defaultValue="{new_val}"', tag)
                elif tag.endswith("/>"):
                    return tag[:-2].rstrip() + f' app:defaultValue="{new_val}" />'
                elif tag.endswith(">"):
                    return tag[:-1].rstrip() + f' app:defaultValue="{new_val}">'
                return tag

            pattern = re.compile(rf'<[^>]+app:key="{re.escape(key)}"[^>]*>', re.DOTALL)
            text = pattern.sub(replace_default, text)
        if text != original:
            file_path.write_text(text, encoding="utf-8")
            return 1
        return 0

    gfx_updates = {
        "EmuCore/GS/Renderer": "14",                 # Default to Vulkan backend (direct command buffer on Mali)
        "EmuCore/GS/ThreadedPresentation": "true",    # Decouple frame presentation thread
        "EmuCore/GS/HWDownloadMode": "1",            # Disable Readbacks (eliminates light occlusion & TBDR tile flush stalls)
        "EmuCore/GS/accurate_blending_unit": "0",    # Minimum Blending Accuracy (eliminates multi-pass light/sun/bloom lag)
        "EmuCore/GS/texture_preloading": "2",        # Full Texture Hash Cache (keeps decoded textures resident in RAM)
    }
    adv_updates = {
        "EmuCore/GS/DisableDualSourceBlend": "true", # Fix Mali driver dual-source blending bottlenecks
        "EmuCore/GS/SkipDuplicateFrames": "true",    # Conserve tile memory bandwidth on Mali TBDR
    }
    sys_updates = {
        "EmuCore/Speedhacks/vuThread": "true",        # MTVU (Multi-Threaded VU1) for 8-core Mali SoCs
        "EmuCore/AffinityControlMode": "7",           # Bind emulation threads to Performance Cores
        "EmuCore/Speedhacks/fastCDVD": "true",        # Fast CDVD read speeds
    }

    # Inject global HWDownloadMode into graphics_preferences.xml if absent
    for p in work_dir.rglob("graphics_preferences.xml"):
        text = p.read_text(encoding="utf-8")
        if "EmuCore/GS/HWDownloadMode" not in text:
            hw_download_tag = """    <ListPreference app:defaultValue="1"
                    app:entries="@array/gs_hardware_download_mode_entries"
                    app:entryValues="@array/gs_hardware_download_mode_values"
                    app:iconSpaceReserved="false"
                    app:key="EmuCore/GS/HWDownloadMode"
                    app:title="@string/gs_hardware_download_mode"
                    app:useSimpleSummaryProvider="true" />
  </PreferenceCategory>"""
            text = re.sub(
                r'(<ListPreference[^>]+app:key="EmuCore/GS/texture_preloading"[^>]*>[\s\n]*)(</PreferenceCategory>)',
                r'\g<1>' + hw_download_tag,
                text,
            )
            p.write_text(text, encoding="utf-8")

    for p in work_dir.rglob("graphics_preferences.xml"):
        if update_preference_xml(p, gfx_updates):
            print(f"  ✓ Configured Vulkan (14), Threaded Presentation, HWDownloadMode (1), Blending Accuracy (0 - Minimum), and Texture Preloading (2 - Full) in {p.name}")
    for p in work_dir.rglob("graphics_game_settings_preferences.xml"):
        if update_preference_xml(p, {
            "EmuCore/GS/HWDownloadMode": "1",
            "EmuCore/GS/accurate_blending_unit": "0",
            "EmuCore/GS/texture_preloading": "2",
        }):
            print(f"  ✓ Defaulted HWDownloadMode (1), Blending Accuracy (0), and Texture Preload (2) in {p.name}")
    for p in work_dir.rglob("advanced_preferences.xml"):
        if update_preference_xml(p, adv_updates):
            print(f"  ✓ Configured DisableDualSourceBlend and SkipDuplicateFrames in {p.name}")
    for p in work_dir.rglob("advanced_game_settings_preferences.xml"):
        if update_preference_xml(p, adv_updates):
            print(f"  ✓ Configured DisableDualSourceBlend and SkipDuplicateFrames in {p.name}")
    for p in work_dir.rglob("system_preferences.xml"):
        if update_preference_xml(p, sys_updates):
            print(f"  ✓ Configured MTVU, Performance Core Affinity, and FastCDVD in {p.name}")
    for p in work_dir.rglob("general_preferences.xml"):
        if update_preference_xml(p, {"UI/EmulationActivityOrientation": "sensor", "UI/AutoDownloadCovers": "true"}):
            print(f"  ✓ Defaulted EmulationActivityOrientation to sensor in {p.name}")
    for p in work_dir.rglob("general_game_settings_preferences.xml"):
        if update_preference_xml(p, {"UI/EmulationActivityOrientation": "sensor", "UI/AutoDownloadCovers": "true"}):
            print(f"  ✓ Defaulted EmulationActivityOrientation to sensor in {p.name}")
    for p in work_dir.rglob("touchscreen_controller_preferences.xml"):
        if update_preference_xml(p, {"TouchscreenController/AutoHide": "true"}):
            print(f"  ✓ Defaulted TouchscreenController/AutoHide to true in {p.name}")

    # Customize ONLY the Setup Wizard preset button text: change Fast/Unsafe to Fast(Mali)/Unsafe,
    # keeping the original descriptions and reset setting text untouched.
    str_updated = 0
    for p in work_dir.rglob("strings.xml"):
        text = p.read_text(encoding="utf-8")
        original = text
        text = re.sub(r'(<string name="setup_wizard_safe_defaults">)[^<]+(</string>)', r'\g<1>Fast(Mali)/Unsafe Defaults\g<2>', text)
        if text != original:
            p.write_text(text, encoding="utf-8")
            str_updated += 1
    print(f"  ✓ Updated Setup Wizard preset button to 'Fast(Mali)/Unsafe Defaults' in {str_updated} strings.xml files")

    # Patch classes.dex:
    # 1. Setup Wizard selects Fast(Mali)/Unsafe Defaults by default ("safe" -> "unsafe")
    # 2. Setup Wizard defaults Renderer to Vulkan ("14") instead of OpenGL ("12")
    dex_target = b"\x1a\x0e\x96\x15\x1a\x00\x5b\x24"      # getString("UI/PerformancePreset", "safe")
    dex_replacement = b"\x1a\x0e\x96\x15\x1a\x00\x16\x29" # getString("UI/PerformancePreset", "unsafe")
    str_12_target = b"00000\x00\x0212\x00\r3rdparty.h"
    str_14_replacement = b"00000\x00\x0214\x00\r3rdparty.h"

    for dex_path in work_dir.rglob("classes*.dex"):
        dex_data = bytearray(dex_path.read_bytes())
        dex_modified = False
        if dex_target in dex_data:
            idx = dex_data.index(dex_target)
            dex_data[idx:idx+len(dex_target)] = dex_replacement
            dex_modified = True
            print(f"  ✓ Patched {dex_path.name} to default Setup Wizard preset to 'Fast(Mali)/Unsafe Defaults'")

        if str_12_target in dex_data:
            idx = dex_data.index(str_12_target)
            dex_data[idx:idx+len(str_12_target)] = str_14_replacement
            dex_modified = True
            print(f"  ✓ Patched {dex_path.name} Setup Wizard default Renderer to Vulkan (14)")

        if dex_modified:
            # Recompute DEX SHA-1 signature and Adler32 checksum
            dex_data[12:32] = hashlib.sha1(dex_data[32:]).digest()
            dex_data[8:12] = (zlib.adler32(dex_data[12:]) & 0xffffffff).to_bytes(4, "little")
            dex_path.write_bytes(dex_data)

    # Patch NativeLibrary.setDefaultSettings in libemucore.so:
    # 1. When 'unsafe' preset is applied, set HWDownloadMode to '1' (Disable Readbacks - Unsynchronized)
    # 2. Keep EECycleSkip at '0' (Normal) instead of '2' (Cycle Skip 2) to eliminate animation jitter,
    #    black screens, and visual glitches in Black and other games.
    so_pattern_hw = bytes.fromhex("82c7ff9042541591e00313aae10314aae30316aa00013fd6")
    so_replacement_hw = bytes.fromhex("82c7ff9042541591e00313aae10314aae30317aa00013fd6")

    so_pattern_skip = bytes.fromhex("5911899a7611899ae00313aa") # csel x25, x10, x9; csel x22, x11, x9; mov x0, x19
    so_replacement_skip = bytes.fromhex("5911899af60309aae00313aa") # csel x25, x10, x9; mov x22, x9; mov x0, x19

    for so_path in work_dir.rglob("libemucore.so"):
        so_data = bytearray(so_path.read_bytes())
        so_modified = False
        if so_pattern_hw in so_data:
            idx = so_data.index(so_pattern_hw)
            so_data[idx:idx+len(so_pattern_hw)] = so_replacement_hw
            so_modified = True
            print(f"  ✓ Patched {so_path.name} setDefaultSettings to set HWDownloadMode=1 (Unsynchronized)")
        if so_pattern_skip in so_data:
            idx = so_data.index(so_pattern_skip)
            so_data[idx:idx+len(so_pattern_skip)] = so_replacement_skip
            so_modified = True
            print(f"  ✓ Patched {so_path.name} setDefaultSettings to keep EECycleSkip=0 (Normal) in Unsafe mode")
        if so_modified:
            so_path.write_bytes(so_data)


def apply_switch_optimizations(work_dir: Path) -> None:
    """Apply optimizations specifically for Nintendo Switch (Nvidia Tegra X1 / Maxwell 256 CUDA cores):
    1. Vulkan backend (14) - direct command buffer execution on Nvidia's desktop-grade Vulkan driver.
    2. DisableDualSourceBlend: "false" - Enable hardware dual-source blending (Maxwell architecture executes desktop dual-source blending natively).
    3. ThreadedPresentation: "true" - Decouples presentation thread to eliminate frame pacing jitter on Cortex-A57 CPU cores.
    4. HWDownloadMode: "1" - Disable Readbacks (Unsynchronized) to stop CPU/GPU synchronization wait-states.
    5. MTVU (vuThread: "true") - Offloads VU1 to separate thread, utilizing the Switch's 4 cores.
    6. EECycleRate: "-1" (75% Underclock) - Prevents audio crackle and thermal throttling on the Switch's 1.0-1.7 GHz CPU.
    7. Fast CDVD (fastCDVD: "true") - Faster game streaming and asset loading.
    8. AffinityControlMode: "0" - No core pinning, letting Linux CFS distribute load across all 4 A57 cores.
    """
    def update_preference_xml(file_path: Path, updates: dict[str, str]) -> int:
        if not file_path.exists():
            return 0
        text = file_path.read_text(encoding="utf-8")
        original = text
        for key, new_val in updates.items():
            def replace_default(match: re.Match) -> str:
                tag = match.group(0)
                if 'app:defaultValue="' in tag:
                    return re.sub(r'app:defaultValue="[^"]*"', f'app:defaultValue="{new_val}"', tag)
                elif tag.endswith("/>"):
                    return tag[:-2].rstrip() + f' app:defaultValue="{new_val}" />'
                elif tag.endswith(">"):
                    return tag[:-1].rstrip() + f' app:defaultValue="{new_val}">'
                return tag

            pattern = re.compile(rf'<[^>]+app:key="{re.escape(key)}"[^>]*>', re.DOTALL)
            text = pattern.sub(replace_default, text)
        if text != original:
            file_path.write_text(text, encoding="utf-8")
            return 1
        return 0

    gfx_updates = {
        "EmuCore/GS/Renderer": "14",                 # Vulkan
        "EmuCore/GS/ThreadedPresentation": "true",    # Threaded presentation (huge on 4-core A57)
        "EmuCore/GS/HWDownloadMode": "1",            # Disable Readbacks (Unsynchronized)
        "EmuCore/GS/accurate_blending_unit": "1",    # Basic Blending (Maxwell hardware handles blending effortlessly)
        "EmuCore/GS/texture_preloading": "2",        # Full Texture Hash Cache
    }
    adv_updates = {
        "EmuCore/GS/DisableDualSourceBlend": "false", # Maxwell GM20B has native hardware dual-source blending!
        "EmuCore/GS/SkipDuplicateFrames": "false",
    }
    sys_updates = {
        "EmuCore/Speedhacks/vuThread": "true",        # MTVU (vital for 4 A57 cores)
        "EmuCore/Speedhacks/EECycleRate": "-1",       # 75% EE Underclock (matches Switch CPU clock headroom)
        "EmuCore/Speedhacks/fastCDVD": "true",        # Fast CDVD
        "EmuCore/AffinityControlMode": "0",           # Normal affinity for Tegra X1
    }

    # Inject global HWDownloadMode into graphics_preferences.xml if absent
    for p in work_dir.rglob("graphics_preferences.xml"):
        text = p.read_text(encoding="utf-8")
        if "EmuCore/GS/HWDownloadMode" not in text:
            hw_download_tag = """    <ListPreference app:defaultValue="1"
                    app:entries="@array/gs_hardware_download_mode_entries"
                    app:entryValues="@array/gs_hardware_download_mode_values"
                    app:iconSpaceReserved="false"
                    app:key="EmuCore/GS/HWDownloadMode"
                    app:title="@string/gs_hardware_download_mode"
                    app:useSimpleSummaryProvider="true" />
  </PreferenceCategory>"""
            text = re.sub(
                r'(<ListPreference[^>]+app:key="EmuCore/GS/texture_preloading"[^>]*>[\s\n]*)(</PreferenceCategory>)',
                r'\g<1>' + hw_download_tag,
                text,
            )
            p.write_text(text, encoding="utf-8")

    for p in work_dir.rglob("graphics_preferences.xml"):
        if update_preference_xml(p, gfx_updates):
            print(f"  ✓ Configured Switch Tegra X1 graphics in {p.name}")
    for p in work_dir.rglob("graphics_game_settings_preferences.xml"):
        if update_preference_xml(p, {
            "EmuCore/GS/HWDownloadMode": "1",
            "EmuCore/GS/accurate_blending_unit": "1",
            "EmuCore/GS/texture_preloading": "2",
        }):
            print(f"  ✓ Defaulted HWDownloadMode (1), Blending Accuracy (1), and Texture Preload (2) in {p.name}")
    for p in work_dir.rglob("advanced_preferences.xml"):
        if update_preference_xml(p, adv_updates):
            print(f"  ✓ Enabled hardware Dual-Source Blend for Tegra X1 Maxwell in {p.name}")
    for p in work_dir.rglob("system_preferences.xml"):
        if update_preference_xml(p, sys_updates):
            print(f"  ✓ Configured MTVU, -1 EE Cycle Rate, and FastCDVD for Switch in {p.name}")
    for p in work_dir.rglob("general_preferences.xml"):
        if update_preference_xml(p, {"UI/EmulationActivityOrientation": "sensor", "UI/AutoDownloadCovers": "true"}):
            print(f"  ✓ Defaulted EmulationActivityOrientation to sensor in {p.name}")
    for p in work_dir.rglob("general_game_settings_preferences.xml"):
        if update_preference_xml(p, {"UI/EmulationActivityOrientation": "sensor", "UI/AutoDownloadCovers": "true"}):
            print(f"  ✓ Defaulted EmulationActivityOrientation to sensor in {p.name}")
    for p in work_dir.rglob("touchscreen_controller_preferences.xml"):
        if update_preference_xml(p, {"TouchscreenController/AutoHide": "true"}):
            print(f"  ✓ Defaulted TouchscreenController/AutoHide to true in {p.name}")

    # Customize Setup Wizard preset text for Switch
    str_updated = 0
    for p in work_dir.rglob("strings.xml"):
        text = p.read_text(encoding="utf-8")
        original = text
        text = re.sub(r'(<string name="setup_wizard_safe_defaults">)[^<]+(</string>)', r'\g<1>Switch(Tegra X1) Defaults\g<2>', text)
        if text != original:
            p.write_text(text, encoding="utf-8")
            str_updated += 1
    print(f"  ✓ Updated Setup Wizard preset button to 'Switch(Tegra X1) Defaults' in {str_updated} strings.xml files")


def patch_preserve_user_data_on_reset(work_dir: Path) -> None:
    """Patch NativeLibrary.setDefaultSettings and ApplyPerformancePreset in libemucore.so:
    Prevent resetting core, memory cards, achievements, and input bindings when resetting to Optimal or Fast defaults.
    
    Patches both Call 1 (in setDefaultSettings) and Call 2 (in ApplyPerformancePreset):
    1. v1.5-4248 (Adreno & Switch):
       - Call 1 at 0x840f48: mov w2, wzr; mov w3, wzr; NOP bl 0x7ea840
       - Call 2 at 0x840fd4: mov w2, wzr; NOP bl 0x7ea840
    2. v1.5-3668 (Mali):
       - Call 1 at 0x833c58: mov w2, wzr; mov w3, wzr; NOP bl 0x7dfa20
       - Call 2 at 0x833ce4: mov w2, wzr; NOP bl 0x7dfa20
    
    This completely eliminates the wipe of MemoryCards, RetroAchievements login/tokens/settings,
    and custom controller mappings when applying performance presets.
    """
    call1_4248_target = bytes.fromhex("e1031f2a2200805223008052e4031f2ae5031f2a39a6fe97")
    call1_4248_patch  = bytes.fromhex("e1031f2ae2031f2ae3031f2ae4031f2ae5031f2a1f2003d5")

    call2_4248_target = bytes.fromhex("e1031f2a22008052e3031f2ae4031f2ae5031f2a16a6fe97")
    call2_4248_patch  = bytes.fromhex("e1031f2ae2031f2ae3031f2ae4031f2ae5031f2a1f2003d5")

    call1_3668_target = bytes.fromhex("e1031f2a2200805223008052e4031f2ae5031f2a6daffe97")
    call1_3668_patch  = bytes.fromhex("e1031f2ae2031f2ae3031f2ae4031f2ae5031f2a1f2003d5")

    call2_3668_target = bytes.fromhex("e1031f2a22008052e3031f2ae4031f2ae5031f2a4aaffe97")
    call2_3668_patch  = bytes.fromhex("e1031f2ae2031f2ae3031f2ae4031f2ae5031f2a80018052")

    for so_path in work_dir.rglob("libemucore.so"):
        so_data = bytearray(so_path.read_bytes())
        patches_applied = 0

        # Patch Call 1
        if call1_4248_target in so_data:
            idx = so_data.index(call1_4248_target)
            so_data[idx:idx+len(call1_4248_target)] = call1_4248_patch
            patches_applied += 1
        elif call1_3668_target in so_data:
            idx = so_data.index(call1_3668_target)
            so_data[idx:idx+len(call1_3668_target)] = call1_3668_patch
            patches_applied += 1

        # Patch Call 2
        if call2_4248_target in so_data:
            idx = so_data.index(call2_4248_target)
            so_data[idx:idx+len(call2_4248_target)] = call2_4248_patch
            patches_applied += 1
        elif call2_3668_target in so_data:
            idx = so_data.index(call2_3668_target)
            so_data[idx:idx+len(call2_3668_target)] = call2_3668_patch
            patches_applied += 1

        if patches_applied > 0:
            so_path.write_bytes(so_data)
            print(f"  ✓ Patched {so_path.name} ({patches_applied} calls patched): Memory cards, achievements, and controls preserved on reset")


def patch_ui_preferences(work_dir: Path, is_mali: bool = False) -> None:
    """Inject QoL preference switches (Auto Covers, Discord RPC, Gyro to Stick) and defaults into decompiled preference XML files."""
    def set_preference_default(text: str, key: str, new_val: str) -> str:
        def replace_default(m: re.Match) -> str:
            tag = m.group(0)
            if 'app:defaultValue=' in tag:
                return re.sub(r'app:defaultValue="[^"]*"', f'app:defaultValue="{new_val}"', tag)
            elif tag.endswith('/>'):
                return tag[:-2].rstrip() + f' app:defaultValue="{new_val}" />'
            elif tag.endswith('>'):
                return tag[:-1].rstrip() + f' app:defaultValue="{new_val}">'
            return tag

        pattern = re.compile(rf'<[^>]+app:key="{re.escape(key)}"[^>]*>', re.DOTALL)
        return pattern.sub(replace_default, text)

    # 1. general_preferences.xml
    auto_covers_tag = """    <SwitchPreferenceCompat app:defaultValue="true"
                          app:iconSpaceReserved="false"
                          app:key="UI/AutoDownloadCovers"
                          app:summary="Automatically downloads missing box art covers from online databases."
                          app:title="Auto Download Covers" />"""
    discord_rpc_tag = """    <SwitchPreferenceCompat app:defaultValue="true"
                          app:iconSpaceReserved="false"
                          app:key="UI/EnableDiscordRpc"
                          app:summary="Broadcasts current game to Discord Rich Presence."
                          app:title="Discord Rich Presence" />"""

    for p in work_dir.rglob("general_preferences.xml"):
        text = p.read_text(encoding="utf-8")
        orig = text
        if "UI/AutoDownloadCovers" not in text:
            m = re.search(r'(<ListPreference[^>]+app:key="UI/EmulationActivityOrientation"[^>]*/>)', text)
            if m:
                text = text[:m.end()] + "\n" + auto_covers_tag + text[m.end():]
            else:
                m_cat = re.search(r'(<PreferenceCategory[^>]+app:title="@string/settings_category_interface"[^>]*>)', text)
                if m_cat:
                    text = text[:m_cat.end()] + "\n" + auto_covers_tag + text[m_cat.end():]

        if "UI/EnableDiscordRpc" not in text:
            m = re.search(r'(<SwitchPreferenceCompat[^>]+app:key="UI/AutoDownloadCovers"[^>]*/>)', text)
            if m:
                text = text[:m.end()] + "\n" + discord_rpc_tag + text[m.end():]
            else:
                m_cat = re.search(r'(<PreferenceCategory[^>]+app:title="@string/settings_category_interface"[^>]*>)', text)
                if m_cat:
                    text = text[:m_cat.end()] + "\n" + discord_rpc_tag + text[m_cat.end():]

        text = set_preference_default(text, "UI/EmulationActivityOrientation", "sensor")
        if text != orig:
            p.write_text(text, encoding="utf-8")
            print(f"  ✓ Injected/configured QoL preferences (Auto Covers, Discord RPC, Sensor Orientation) into {p.name}")

    # 2. general_game_settings_preferences.xml
    discord_rpc_tristate = """    <xyz.aethersx2.android.TriStatePreference app:iconSpaceReserved="false"
                          app:key="UI/EnableDiscordRpc"
                          app:summary="Broadcasts current game to Discord Rich Presence."
                          app:title="Discord Rich Presence"
                          app:useSimpleSummaryProvider="true" />"""
    for p in work_dir.rglob("general_game_settings_preferences.xml"):
        text = p.read_text(encoding="utf-8")
        orig = text
        if "UI/EnableDiscordRpc" not in text:
            m = re.search(r'(<ListPreference[^>]+app:key="UI/EmulationActivityOrientation"[^>]*/>)', text)
            if m:
                text = text[:m.end()] + "\n" + discord_rpc_tristate + text[m.end():]
        text = set_preference_default(text, "UI/EmulationActivityOrientation", "sensor")
        if text != orig:
            p.write_text(text, encoding="utf-8")
            print(f"  ✓ Injected/configured Discord RPC into {p.name}")

    # 3. touchscreen_controller_preferences.xml
    gyro_tag = """    <SwitchPreferenceCompat app:defaultValue="false"
                          app:iconSpaceReserved="false"
                          app:key="Pad/GyroToRightStick"
                          app:summary="Maps device gyroscope motion to the right analog stick for motion aiming."
                          app:title="Gyro to Right Stick" />"""
    for p in work_dir.rglob("touchscreen_controller_preferences.xml"):
        text = p.read_text(encoding="utf-8")
        orig = text
        if "Pad/GyroToRightStick" not in text:
            m = re.search(r'(<SwitchPreferenceCompat[^>]+app:key="TouchscreenController/BindToRightStick"[^>]*/>)', text)
            if m:
                text = text[:m.end()] + "\n" + gyro_tag + text[m.end():]
            else:
                m_auto = re.search(r'(<SwitchPreferenceCompat[^>]+app:key="TouchscreenController/AutoHide"[^>]*/>)', text)
                if m_auto:
                    text = text[:m_auto.end()] + "\n" + gyro_tag + text[m_auto.end():]

        text = set_preference_default(text, "TouchscreenController/AutoHide", "true")
        if text != orig:
            p.write_text(text, encoding="utf-8")
            print(f"  ✓ Injected/configured Gyro to Right Stick and Auto-Hide in {p.name}")

    # 4. Inject Discord tab into settings_tabs in arrays.xml
    for p in work_dir.rglob("arrays.xml"):
        text = p.read_text(encoding="utf-8")
        if 'name="settings_tabs"' in text and '<item>Discord</item>' not in text:
            text = re.sub(
                r'(<string-array\s+name="settings_tabs"[^>]*>[\s\S]*?)(</string-array>)',
                r'\1    <item>Discord</item>\n  \2',
                text
            )
            p.write_text(text, encoding="utf-8")
            print(f"  ✓ Injected Discord tab into {p.name}")


def patch_libemucore_settings_defaults(work_dir: Path) -> None:
    """Patch libemucore.so:
    1. Full Texture Preloading (2) by default for both Optimal and Fast defaults in setDefaultSettings and GSSettings::Load.
    2. GPU Renderer for Fast Mali uses Vulkan (14), while Optimal uses OpenGL (12).
    """
    mali_patches = {
        0x833D04: (bytes.fromhex("80018052"), bytes.fromhex("0004140b")), # add w0, w0, w20, lsl #1 (Fast=14 Vulkan, Safe=12 OpenGL)
        0x8344AC: (bytes.fromhex("00119f1a"), bytes.fromhex("40008052")), # mov w0, #2 (Full Texture Preload in setDefaultSettings)
        0x4AB558: (bytes.fromhex("a3224039"), bytes.fromhex("43008052")), # mov w3, #2 (Full Texture Preload fallback in GSSettings::Load)
    }
    adreno_patches = {
        0x84179C: (bytes.fromhex("00119f1a"), bytes.fromhex("40008052")), # mov w0, #2 (Full Texture Preload in setDefaultSettings)
        0x4BAC34: (bytes.fromhex("a3224039"), bytes.fromhex("43008052")), # mov w3, #2 (Full Texture Preload fallback in GSSettings::Load)
    }

    for so_path in work_dir.rglob("libemucore.so"):
        data = bytearray(so_path.read_bytes())
        file_len = len(data)
        patches = None
        if file_len == 12162984:
            patches = adreno_patches
        elif file_len == 12094744:
            patches = mali_patches
        else:
            if all(data[off:off+4] in (orig, repl) for off, (orig, repl) in adreno_patches.items()):
                patches = adreno_patches
            elif all(data[off:off+4] in (orig, repl) for off, (orig, repl) in mali_patches.items()):
                patches = mali_patches

        if patches:
            applied = 0
            for off, (orig, repl) in patches.items():
                if data[off:off+4] == orig:
                    data[off:off+4] = repl
                    applied += 1
                elif data[off:off+4] == repl:
                    applied += 1
            if applied == len(patches):
                so_path.write_bytes(data)
                print(f"  ✓ Patched {so_path.name}: Full Texture Preload as default and Fast Mali Vulkan")

    # Also ensure all preference XMLs default texture_preloading to 2 (Full)
    for p in work_dir.rglob("*preferences*.xml"):
        txt = p.read_text(encoding="utf-8")
        if "EmuCore/GS/texture_preloading" in txt:
            pattern = re.compile(r'(<[^>]+app:key="EmuCore/GS/texture_preloading"[^>]*>)', re.DOTALL)
            def repl_tag(m: re.Match) -> str:
                tag = m.group(1)
                if 'app:defaultValue=' in tag:
                    return re.sub(r'app:defaultValue="[^"]*"', 'app:defaultValue="2"', tag)
                elif tag.endswith("/>"):
                    return tag[:-2].rstrip() + ' app:defaultValue="2" />'
                elif tag.endswith(">"):
                    return tag[:-1].rstrip() + ' app:defaultValue="2">'
                return tag
            new_txt = pattern.sub(repl_tag, txt)
            if new_txt != txt:
                p.write_text(new_txt, encoding="utf-8")


def patch_gameindex(work_dir: Path) -> None:
    """Patch GameIndex.yaml inside decoded APK:
    1. Black: Ensure vuClampMode: 3 (fixes SPS polygon spikes), autoFlush: 1 (fixes light strips), and minimumBlendingLevel: 2.
    2. Downhill Domination: Disable sun lighting / lens flare post-processing and stage backdrop, and disable autoFlush (1 -> 0).
    3. Tales of the Abyss: Disable autoFlush (1 -> 0) to prevent TBDR tile flush stalls.
    """
    downhill_patch = """  patches:
    default:
      content: |-
        author=Community
        comment=Disable Sun, Lens Flare Post-processing, and Stage Backdrop
        patch=1,EE,0029DBA5,byte,0
        patch=1,EE,0029E200,byte,0
    5AE01D98:
      content: |-
        author=Community
        comment=Disable Sun, Lens Flare Post-processing, and Stage Backdrop
        patch=1,EE,0029DBA5,byte,0
        patch=1,EE,0029E200,byte,0
"""
    black_serials = ["SLAJ-25078", "SLES-53886", "SLES-54030", "SLPM-66354", "SLUS-21376", "SLKA-25372"]

    def patch_downhill_scus(m: re.Match) -> str:
        block = m.group(0)
        block = re.sub(r"(autoFlush:\s*)1", r"\g<1>0", block)
        if "patches:" not in block:
            block = block.rstrip() + "\n" + downhill_patch
        else:
            if "0029E200" not in block:
                block = block.replace("patch=1,EE,0029DBA5,byte,0", "patch=1,EE,0029DBA5,byte,0\n        patch=1,EE,0029E200,byte,0")
        return block

    gi_updated = 0
    for p in work_dir.rglob("GameIndex.yaml"):
        text = p.read_text(encoding="utf-8")
        orig = text
        for s in black_serials:
            # Ensure vuClampMode is 3 (fixes SPS polygon explosion)
            pattern_vu = rf"({s}:.*?\n\s*name:\s*[\"\x27]Black[\"\x27].*?vuClampMode:\s*)[0-2]"
            text = re.sub(pattern_vu, r"\g<1>3", text, flags=re.DOTALL)
            # Ensure autoFlush is 1 (fixes light strips and missing sky)
            pattern_af = rf"({s}:.*?\n\s*name:\s*[\"\x27]Black[\"\x27].*?autoFlush:\s*)0"
            text = re.sub(pattern_af, r"\g<1>1", text, flags=re.DOTALL)
            # Ensure minimumBlendingLevel: 2 is present in Black's gsHWFixes
            pattern_blend = rf"({s}:.*?\n\s*name:\s*[\"\x27]Black[\"\x27].*?gsHWFixes:\s*\n)(?!\s*minimumBlendingLevel:)"
            text = re.sub(pattern_blend, r"\g<1>    minimumBlendingLevel: 2 # Fixes building and object lighting.\n", text, flags=re.DOTALL)

        # Patch Downhill Domination SCUS-97177 (NTSC-U) with sun disable patch and autoFlush 0
        text = re.sub(r"SCUS-97177:.*?(?=\n[A-Z]{4}-[0-9]{5}:|\Z)", patch_downhill_scus, text, flags=re.DOTALL)

        # Disable autoFlush for other Downhill Domination releases (PAL and Demos)
        for s in ["SLES-52202", "SCUS-97329", "SLED-52325"]:
            pattern_dh = rf"({s}:.*?\n\s*name:\s*[\"\x27]Downhill Domination.*?autoFlush:\s*)1"
            text = re.sub(pattern_dh, r"\g<1>0", text, flags=re.DOTALL)

        # Disable autoFlush for Tales of the Abyss
        for s in ["SCAJ-20163", "SLUS-21386"]:
            pattern_tales = rf"({s}:.*?\n\s*name:\s*[\"\x27]Tales of the Abyss.*?autoFlush:\s*)1"
            text = re.sub(pattern_tales, r"\g<1>0", text, flags=re.DOTALL)

        # Patch Midnight Club 3 (SLUS-21355, SLUS-21029, SLES-53717, SLES-52942) to disable motion blur
        mc3_blur_patch = """        // Disable Motion Blur (eliminates Mali TBDR fillrate lag and blur accumulation)
        patch=1,EE,201CC3D4,extended,00000000
        patch=1,EE,201CC3D8,extended,00000000
        patch=1,EE,201CC3E0,extended,00000000
        patch=1,EE,201CC3E8,extended,00000000
        patch=1,EE,201CC38C,extended,00000000
        patch=1,EE,201CC39C,extended,00000000"""

        def patch_mc3_block(m: re.Match) -> str:
            block = m.group(0)
            if "201CC3D4" not in block:
                block = re.sub(r"(patch=1,EE,2052[0-9A-F]{4},extended,00000000)", r"\g<1>\n" + mc3_blur_patch, block)
            return block

        for s in ["SLUS-21355", "SLUS-21029", "SLES-53717", "SLES-52942"]:
            text = re.sub(rf"({s}:.*?\n)(?=[A-Z]{{4}}-[0-9]{{5}}:|\Z)", patch_mc3_block, text, flags=re.DOTALL)

        # Ensure Resident Evil 4 / Biohazard 4 has minimumBlendingLevel: 2, textureInsideRT: 1, and halfPixelOffset: 2 (fixes gray/washed-out screen and fog)
        re4_serials = ["SLUS-21134", "SLES-53702", "SLES-53756", "SLPM-66213", "SLPM-74229", "SLPM-74262", "SLPM-74288", "SCKA-20089", "SLKA-25410", "SLAJ-25073", "SLUS-29169"]
        for s in re4_serials:
            pattern_hpo = rf"({s}:.*?\n\s*gsHWFixes:\s*\n.*?halfPixelOffset:\s*)[0-9]+"
            text = re.sub(pattern_hpo, r"\g<1>2", text, flags=re.DOTALL)
            pattern_re4_blend = rf"({s}:.*?\n\s*gsHWFixes:\s*\n)(?!\s*minimumBlendingLevel:)"
            text = re.sub(pattern_re4_blend, r"\g<1>    minimumBlendingLevel: 2 # Enforces destination reads for color grading & fog\n", text, flags=re.DOTALL)
            pattern_re4_trt = rf"({s}:.*?\n\s*gsHWFixes:\s*\n)(?!\s*textureInsideRT:)"
            text = re.sub(pattern_re4_trt, r"\g<1>    textureInsideRT: 1 # Syncs post-processing color grading pass with active render target\n", text, flags=re.DOTALL)

        if text != orig:
            p.write_text(text, encoding="utf-8")
            gi_updated += 1
    print(f"  ✓ Patched GameIndex.yaml (optimized Black, Downhill Domination, Tales of the Abyss, Midnight Club 3, and Resident Evil 4 in {gi_updated} files)")


def patch_manifest_target_sdk(work_dir: Path, target_sdk: int = 34) -> None:
    """Update AndroidManifest.xml targetSdkVersion and compileSdkVersion to modern Android standards (API 34)."""
    manifest_path = work_dir / "AndroidManifest.xml"
    if not manifest_path.exists():
        return
    text = manifest_path.read_text(encoding="utf-8")
    orig = text

    # Update android:targetSdkVersion
    if 'android:targetSdkVersion=' in text:
        text = re.sub(r'android:targetSdkVersion="[0-9]+"', f'android:targetSdkVersion="{target_sdk}"', text)
    elif '<uses-sdk' in text:
        text = re.sub(r'(<uses-sdk\b[^>]*?)(\s*/>|>)', rf'\g<1> android:targetSdkVersion="{target_sdk}"\g<2>', text)

    # Update compileSdkVersion and platformBuildVersionCode so Android 14/15 does not see legacy build versions
    text = re.sub(r'android:compileSdkVersion="[0-9]+"', f'android:compileSdkVersion="{target_sdk}"', text)
    text = re.sub(r'android:compileSdkVersionCodename="[^"]+"', f'android:compileSdkVersionCodename="{target_sdk}"', text)
    text = re.sub(r'platformBuildVersionCode="[0-9]+"', f'platformBuildVersionCode="{target_sdk}"', text)
    text = re.sub(r'platformBuildVersionName="[^"]+"', f'platformBuildVersionName="{target_sdk}"', text)

    for json_file in work_dir.glob("*.json"):
        try:
            jtext = json_file.read_text(encoding="utf-8")
            jtext_mod = re.sub(r'("targetSdkVersion"\s*:\s*)[0-9]+', rf'\g<1>{target_sdk}', jtext)
            jtext_mod = re.sub(r'("target_sdk_version"\s*:\s*)[0-9]+', rf'\g<1>{target_sdk}', jtext_mod)
            if jtext_mod != jtext:
                json_file.write_text(jtext_mod, encoding="utf-8")
        except Exception:
            pass

    if text != orig:
        manifest_path.write_text(text, encoding="utf-8")
        print(f"  ✓ Patched AndroidManifest.xml: targetSdkVersion={target_sdk}, compileSdkVersion={target_sdk}")


def patch_manifest_storage_permissions(work_dir: Path) -> None:
    """Ensure MANAGE_EXTERNAL_STORAGE, READ/WRITE_EXTERNAL_STORAGE, and requestLegacyExternalStorage are in AndroidManifest.xml."""
    manifest_path = work_dir / "AndroidManifest.xml"
    if not manifest_path.exists():
        return
    text = manifest_path.read_text(encoding="utf-8")
    orig = text

    permissions = [
        '<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />',
        '<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />',
        '<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />',
    ]
    for perm in permissions:
        perm_name = perm.split('"')[1]
        if perm_name not in text:
            text = text.replace("</manifest>", f"    {perm}\n</manifest>")

    if 'android:requestLegacyExternalStorage=' not in text:
        text = re.sub(r'(<application\b[^>]*)>', r'\g<1> android:requestLegacyExternalStorage="true">', text)

    if text != orig:
        manifest_path.write_text(text, encoding="utf-8")
        print(f"  ✓ Injected storage permissions into AndroidManifest.xml")


def patch_setup_wizard_xml(work_dir: Path) -> None:
    """Update activity_setup_wizard.xml progressBar max to 6 for the 7 setup wizard steps."""
    for p in work_dir.rglob("activity_setup_wizard.xml"):
        txt = p.read_text(encoding="utf-8")
        new_txt = txt.replace('android:max="5"', 'android:max="6"')
        if new_txt != txt:
            p.write_text(new_txt, encoding="utf-8")
            print(f"  ✓ Updated progressBar android:max=\"6\" in {p.name}")


def patch_libemucore_custom_data_dir(work_dir: Path) -> None:
    """Patch libemucore.so to bypass package name restriction for custom data directories."""
    adreno_patches = {
        0x83A3EC: (bytes.fromhex("e0c200b4"), bytes.fromhex("ac000014")),
        0x83A430: (bytes.fromhex("06060014"), bytes.fromhex("9b000014")),
        0x83A790: (bytes.fromhex("c0a500b4"), bytes.fromhex("51000014")),
        0x83A7D4: (bytes.fromhex("1d050014"), bytes.fromhex("40000014")),
    }
    mali_patches = {
        0x82D0DC: (bytes.fromhex("00c300b4"), bytes.fromhex("ac000014")),
        0x82D120: (bytes.fromhex("07060014"), bytes.fromhex("9b000014")),
        0x82D480: (bytes.fromhex("e0a500b4"), bytes.fromhex("51000014")),
        0x82D4C4: (bytes.fromhex("1e050014"), bytes.fromhex("40000014")),
    }

    for so_path in work_dir.rglob("libemucore.so"):
        data = bytearray(so_path.read_bytes())
        file_len = len(data)
        patches = None
        if file_len == 12162984:
            patches = adreno_patches
        elif file_len == 12094744:
            patches = mali_patches
        else:
            if all(data[off:off+4] in (orig, repl) for off, (orig, repl) in adreno_patches.items()):
                patches = adreno_patches
            elif all(data[off:off+4] in (orig, repl) for off, (orig, repl) in mali_patches.items()):
                patches = mali_patches

        if patches:
            applied = 0
            for off, (orig, repl) in patches.items():
                if data[off:off+4] == orig:
                    data[off:off+4] = repl
                    applied += 1
                elif data[off:off+4] == repl:
                    applied += 1
            if applied == len(patches):
                so_path.write_bytes(data)
                print(f"  ✓ Patched {so_path.name} to allow arbitrary custom data directories")


def inject_updated_pcsx2_assets(work_dir: Path) -> None:
    """Inject updated PCSX2 and community emulation assets into the decoded APK:
    1. GameIndex[merged].yaml -> assets/GameIndex.yaml
    2. assets/game_controller_db.txt -> assets/game_controller_db.txt
    3. assets/cheats_ws.zip -> assets/cheats_ws.zip
    4. assets/cheats_ni.zip -> assets/cheats_ni.zip
    5. assets/3rdparty.html -> assets/3rdparty.html
    6. assets/faq.html -> assets/faq.html
    7. Clean up residual Google Ad Services property files
    """
    assets_dir = REPO_ROOT / "assets"
    merged_gameindex = REPO_ROOT / "GameIndex[merged].yaml"

    # Find or create assets directory in decoded APK
    apk_assets_dirs = [p for p in work_dir.rglob("assets") if p.is_dir()]
    if not apk_assets_dirs:
        primary_assets = work_dir / "assets"
        primary_assets.mkdir(parents=True, exist_ok=True)
        apk_assets_dirs = [primary_assets]

    # 1. Inject updated GameIndex.yaml from GameIndex[merged].yaml
    if merged_gameindex.exists():
        gi_updated = 0
        for ad in apk_assets_dirs:
            shutil.copyfile(merged_gameindex, ad / "GameIndex.yaml")
            gi_updated += 1
        for p in work_dir.rglob("GameIndex.yaml"):
            shutil.copyfile(merged_gameindex, p)
            gi_updated += 1
        print(f"  ✓ Injected updated PCSX2 GameDB ({merged_gameindex.stat().st_size} bytes)")

    # 2. Inject controller database
    controller_db = assets_dir / "game_controller_db.txt"
    if controller_db.exists():
        for ad in apk_assets_dirs:
            shutil.copyfile(controller_db, ad / "game_controller_db.txt")
        for p in work_dir.rglob("game_controller_db.txt"):
            shutil.copyfile(controller_db, p)
        print(f"  ✓ Injected updated SDL Controller DB ({controller_db.stat().st_size} bytes)")

    # 3. Inject cheats and info assets
    for asset_name in ["cheats_ws.zip", "cheats_ni.zip", "3rdparty.html", "faq.html"]:
        src = assets_dir / asset_name
        if src.exists():
            for ad in apk_assets_dirs:
                shutil.copyfile(src, ad / asset_name)
            print(f"  ✓ Injected {asset_name} into APK assets")

    # 4. Inject updated CPU/GPU accurate shaders (Vulkan and OpenGL)
    shaders_src = assets_dir / "shaders"
    if shaders_src.exists():
        shaders_injected = 0
        for ad in apk_assets_dirs:
            dest_shaders = ad / "shaders"
            for shader_file in [p for p in shaders_src.rglob("*") if p.is_file()]:
                rel_path = shader_file.relative_to(shaders_src)
                target_dest = dest_shaders / rel_path
                target_dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(shader_file, target_dest)
                shaders_injected += 1
        print(f"  ✓ Injected {shaders_injected} updated accurate GPU/CPU shaders and headers into APK assets")

    # 4. Remove residual ad services property files
    deleted_props = 0
    for prop in list(work_dir.rglob("*.properties")):
        if any(ad_key in prop.name for ad_key in ["play-services-ads", "user-messaging-platform"]):
            prop.unlink()
            deleted_props += 1
    if deleted_props > 0:
        print(f"  ✓ Cleaned up {deleted_props} residual Google Ad Services property files")


def remove_dead_socials_and_telemetry(work_dir: Path) -> None:
    """Remove dead Discord and Patreon buttons, URLs, and telemetry:
    1. Remove action_show_news_updates (Patreon) and action_discord_server from menu_main_navigation.xml.
    2. Strip dead Patreon URLs from update notes in classes*.dex.
    3. Neutralize dead aethersx2.com URLs in classes*.dex.
    """
    # 1. Clean menu_main_navigation.xml
    menus_cleaned = 0
    for menu_path in work_dir.rglob("menu_main_navigation.xml"):
        content = menu_path.read_text(encoding="utf-8")
        orig = content
        # Remove action_show_news_updates item
        content = re.sub(r'\s*<item[^>]*android:id="@id/action_show_news_updates"[^>]*/>', '', content)
        content = re.sub(r'\s*<item[^>]*android:id="@id/action_show_news_updates"[^>]*>.*?</item>', '', content, flags=re.DOTALL)
        # Remove action_discord_server item
        content = re.sub(r'\s*<item[^>]*android:id="@id/action_discord_server"[^>]*/>', '', content)
        content = re.sub(r'\s*<item[^>]*android:id="@id/action_discord_server"[^>]*>.*?</item>', '', content, flags=re.DOTALL)
        if content != orig:
            menu_path.write_text(content, encoding="utf-8")
            menus_cleaned += 1
    if menus_cleaned > 0:
        print(f"  ✓ Removed Discord and Patreon buttons from {menus_cleaned} navigation menu(s)")


def inject_check_update_menu(work_dir: Path) -> None:
    """Inject 'Check Update' button at the bottom of the navigation menu."""
    check_update_item = """    <item android:icon="@drawable/ic_baseline_tips_and_updates_24"
          android:title="Check Update" />"""

    injected = 0
    for menu_path in work_dir.rglob("menu_main_navigation.xml"):
        content = menu_path.read_text(encoding="utf-8")
        if "Check Update" not in content:
            pattern = r"(<group\b[^>]*android:id=\"@id/support\"[^>]*>.*?)(\s*</group>)"
            new_content, count = re.subn(pattern, rf"\g<1>\n{check_update_item}\g<2>", content, flags=re.DOTALL)
            if count > 0:
                menu_path.write_text(new_content, encoding="utf-8")
                injected += count
    if injected > 0:
        print(f"  ✓ Injected 'Check Update' menu item into {injected} navigation menu(s)")


def get_pcsx2_version() -> str:
    """Read version and commit hash from pcsx2 submodule or fallback."""
    pcsx2_dir = REPO_ROOT / "pcsx2"
    if (pcsx2_dir / ".git").exists() or pcsx2_dir.is_dir():
        try:
            rev = subprocess.check_output(
                ["git", "-C", str(pcsx2_dir), "rev-parse", "--short", "HEAD"],
                text=True, stderr=subprocess.DEVNULL
            ).strip()
            desc = subprocess.check_output(
                ["git", "-C", str(pcsx2_dir), "describe", "--tags", "--always"],
                text=True, stderr=subprocess.DEVNULL
            ).strip()
            if not desc or desc == rev or re.match(r"^[0-9a-fA-F]{7,40}$", desc):
                tags = subprocess.check_output(
                    ["git", "-C", str(pcsx2_dir), "tag", "-l", "v*", "--sort=-v:refname"],
                    text=True, stderr=subprocess.DEVNULL
                ).strip().splitlines()
                if tags:
                    desc = tags[0]
                else:
                    desc = "v2.9.129"
            if desc and rev:
                return f"{desc} ({rev})"
        except Exception:
            pass
    return "v2.9.129 (091ab68)"


def verify_dex_integrity(dex_bytes: bytes) -> None:
    """Verifies that classes.dex conforms to Android ART DexFileVerifier rules (no missing data map entries)."""
    if len(dex_bytes) < 0x70:
        return
    map_off = struct.unpack("<I", dex_bytes[0x34:0x38])[0]
    string_ids_size, string_ids_off = struct.unpack("<II", dex_bytes[0x38:0x40])
    map_count = struct.unpack("<I", dex_bytes[map_off:map_off+4])[0]

    offset_to_type = {}
    for i in range(map_count):
        mtype, munused, msize, moffset = struct.unpack("<HHII", dex_bytes[map_off+4+i*12:map_off+16+i*12])
        if mtype == 0x2002:  # TYPE_STRING_DATA_ITEM
            p = moffset
            for _ in range(msize):
                offset_to_type[p] = mtype
                while p < len(dex_bytes) and (dex_bytes[p] & 0x80):
                    p += 1
                p += 1
                while p < len(dex_bytes) and dex_bytes[p] != 0:
                    p += 1
                p += 1

    for i in range(string_ids_size):
        s_off = struct.unpack("<I", dex_bytes[string_ids_off + i*4 : string_ids_off + (i+1)*4])[0]
        if s_off not in offset_to_type:
            raise ValueError(f"DEX verification failed: string_id[{i}] at 0x{s_off:x} has no data map entry (expected 0x2002)")


_DEX_CACHE: dict[str, bytes] = {}


def patch_dex_pcsx2_version(work_dir: Path, is_mali: bool = False) -> None:
    """Inject PCSX2 upstream version into the Show Version dialog and custom smali into classes.dex using baksmali/smali."""
    pcsx2_ver = get_pcsx2_version()
    target_needle = 'const-string v0, "\\nNative Version:\\n"'
    replacement = f'const-string v0, "\\nPCSX2 Version: {pcsx2_ver}\\nNative Version:\\n"'

    dex_files = list(work_dir.rglob("classes*.dex"))
    if not dex_files:
        return

    baksmali_cmd = ensure_baksmali()
    smali_cmd = ensure_smali()

    for dex_path in dex_files:
        original_bytes = dex_path.read_bytes()
        dex_md5 = hashlib.md5(original_bytes).hexdigest()
        cache_key = f"{dex_md5}_{pcsx2_ver}_qol_features_v22_{'mali' if is_mali else 'adreno'}"

        if cache_key in _DEX_CACHE:
            patched_bytes = _DEX_CACHE[cache_key]
            dex_path.write_bytes(patched_bytes)
            verify_dex_integrity(patched_bytes)
            print(f"  ✓ Applied cached PCSX2 version ({pcsx2_ver}) + custom smali DEX to {dex_path.name}")
            continue

        temp_dir = Path(tempfile.mkdtemp(prefix="dex_patch_"))
        try:
            smali_out = temp_dir / "smali"
            print(f"  Disassembling {dex_path.name} with baksmali...")
            run_cmd(baksmali_cmd + ["disassemble", str(dex_path), "-o", str(smali_out)])

            # 1. Inject target-specific smali classes (common + adreno or mali)
            injected_count = 0
            dirs_to_inject = [REPO_ROOT / "smali_target" / "common"]
            if is_mali:
                dirs_to_inject.append(REPO_ROOT / "smali_target" / "mali")
            else:
                dirs_to_inject.append(REPO_ROOT / "smali_target" / "adreno")

            for src_dir in dirs_to_inject:
                if src_dir.exists():
                    for smali_file in src_dir.rglob("*.smali"):
                        rel = smali_file.relative_to(src_dir)
                        dest = smali_out / rel
                        dest.parent.mkdir(parents=True, exist_ok=True)
                        shutil.copyfile(smali_file, dest)
                        injected_count += 1
            print(f"  ✓ Injected {injected_count} custom/updated smali classes ({'Mali' if is_mali else 'Adreno'}) into {dex_path.name}")

            # 2. Patch NativeLibrary.smali in-place (preserves target-specific obfuscated types & fields)
            nat_lib = smali_out / "xyz" / "aethersx2" / "android" / "NativeLibrary.smali"
            if nat_lib.exists():
                nl_txt = nat_lib.read_text(encoding="utf-8")
                if "setDataDirectory" not in nl_txt:
                    set_data_dir = """
.method public static setDataDirectory(Ljava/lang/String;)V
    .registers 3

    sput-object p0, Lxyz/aethersx2/android/NativeLibrary;->mDataDirectory:Ljava/lang/String;

    if-eqz p0, :cond_e

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_e
    return-void
.end method
"""
                    nl_txt = nl_txt.replace(".method private static native initialize", set_data_dir + "\n.method private static native initialize")

                target_cond6 = """:cond_6
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;"""

                repl_cond6 = """:cond_6
    invoke-static {p0}, Lxyz/aethersx2/android/NativeLibrary;->sanitizeGameListPaths(Landroid/content/Context;)V

    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "UI/DataDirectory"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :use_internal_storage

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :use_internal_storage

    const-string v2, "internal"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :use_internal_storage

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    sput-object v0, Lxyz/aethersx2/android/NativeLibrary;->mDataDirectory:Ljava/lang/String;

    goto :data_dir_ready

    :use_internal_storage
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;"""

                if target_cond6 in nl_txt:
                    nl_txt = nl_txt.replace(target_cond6, repl_cond6)
                    nl_txt = nl_txt.replace("sput-object v2, Lxyz/aethersx2/android/NativeLibrary;->mDataDirectory:Ljava/lang/String;", "sput-object v2, Lxyz/aethersx2/android/NativeLibrary;->mDataDirectory:Ljava/lang/String;\n\n    :data_dir_ready\n    const/4 v0, 0x0", 1)

                if "deduplicateEntries" not in nl_txt:
                    dedup_method = """
.method public static deduplicateEntries([Lxyz/aethersx2/android/GameListEntry;)[Lxyz/aethersx2/android/GameListEntry;
    .registers 9

    if-nez p0, :cond_dedup_null

    const/4 p0, 0x0

    return-object p0

    :cond_dedup_null
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    const/4 v1, 0x0

    :goto_dedup_loop
    array-length v2, p0

    if-ge v1, v2, :cond_dedup_done

    aget-object v2, p0, v1

    if-nez v2, :cond_dedup_valid

    goto :goto_dedup_next

    :cond_dedup_valid
    invoke-virtual {v2}, Lxyz/aethersx2/android/GameListEntry;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lxyz/aethersx2/android/GameListEntry;->getRegion()Lxyz/aethersx2/android/GameListEntry$b;

    invoke-virtual {v2}, Lxyz/aethersx2/android/GameListEntry;->getSerial()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_dedup_by_title

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_dedup_by_title

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    :cond_dedup_by_title
    if-nez v5, :cond_dedup_key_ready

    if-eqz v3, :cond_dedup_key_ready

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    :cond_dedup_key_ready
    if-nez v5, :cond_dedup_chk_key

    invoke-virtual {v2}, Lxyz/aethersx2/android/GameListEntry;->getPath()Ljava/lang/String;

    move-result-object v5

    :cond_dedup_chk_key
    if-nez v5, :cond_dedup_put

    goto :goto_dedup_next

    :cond_dedup_put
    invoke-virtual {v0, v5}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_dedup_insert

    invoke-virtual {v0, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lxyz/aethersx2/android/GameListEntry;

    if-eqz v3, :cond_dedup_insert

    invoke-virtual {v3}, Lxyz/aethersx2/android/GameListEntry;->getSerial()Ljava/lang/String;

    move-result-object v3

    if-eqz v4, :cond_goto_next

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_goto_next

    if-eqz v3, :cond_dedup_insert

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_goto_next

    :cond_dedup_insert
    invoke-virtual {v0, v5, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_goto_next
    :goto_dedup_next
    add-int/lit8 v1, v1, 0x1

    goto :goto_dedup_loop

    :cond_dedup_done
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    new-array v0, v0, [Lxyz/aethersx2/android/GameListEntry;

    invoke-interface {p0, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lxyz/aethersx2/android/GameListEntry;

    return-object p0
.end method
"""

                    sanitize_paths = """
.method public static sanitizeGameListPaths(Landroid/content/Context;)V
    .registers 13

    if-nez p0, :cond_san_done

    :try_start_san
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    if-nez v0, :cond_san_start

    return-void

    :cond_san_start
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "GameList/Paths"

    aput-object v3, v1, v2

    const/4 v3, 0x1

    const-string v4, "GameList/RecursivePaths"

    aput-object v4, v1, v3

    const/4 v3, 0x0

    :goto_san_keys
    const/4 v4, 0x2

    if-ge v3, v4, :cond_san_done

    aget-object v4, v1, v3

    const/4 v5, 0x0

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    if-eqz v5, :cond_san_next_key

    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_san_next_key

    const/4 v6, 0x0

    new-instance v7, Landroid/util/ArraySet;

    invoke-direct {v7}, Landroid/util/ArraySet;-><init>()V

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_san_loop
    :goto_san_loop
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_san_commit

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_san_loop

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_san_check_p

    goto :goto_san_loop

    :cond_san_check_p
    move-object v9, v8

    const-string v10, "content://"

    invoke-virtual {v8, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_san_chk_pct

    :try_start_tree
    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-static {v10, p0}, Lxyz/aethersx2/android/FileHelper;->getFullPathFromTreeUri(Landroid/net/Uri;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_san_chk_pct

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_san_chk_pct

    const-string v11, "/"

    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_san_chk_pct

    const-string v9, "UTF-8"

    invoke-static {v10, v9}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/4 v6, 0x1
    :try_end_tree
    .catch Ljava/lang/Exception; {:try_start_tree .. :try_end_tree} :catch_tree

    goto :cond_san_add

    :catch_tree
    nop

    :cond_san_chk_pct
    const-string v10, "%"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_san_add

    :try_start_url
    const-string v10, "UTF-8"

    invoke-static {v9, v10}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/4 v6, 0x1
    :try_end_url
    .catch Ljava/lang/Exception; {:try_start_url .. :try_end_url} :catch_url

    goto :cond_san_add

    :catch_url
    nop

    :cond_san_add
    invoke-virtual {v7, v9}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    goto :goto_san_loop

    :cond_san_commit
    if-eqz v6, :cond_san_next_key

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5, v4, v7}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_san_next_key
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_san_keys
    :try_end_san
    .catch Ljava/lang/Exception; {:try_start_san .. :try_end_san} :catch_san

    :catch_san
    nop

    :cond_san_done
    return-void
.end method
"""
                    nl_txt = nl_txt.replace(".method private static native initialize", dedup_method + "\n" + sanitize_paths + "\n.method private static native initialize")

                nat_lib.write_text(nl_txt, encoding="utf-8")
                print(f"  ✓ Patched NativeLibrary data directory loader and deduplication in {dex_path.name}")

            # Patch GameListEntry.smali: clean %20 and extensions from titles, and infer regions from serial/name
            gle_file = smali_out / "xyz" / "aethersx2" / "android" / "GameListEntry.smali"
            if gle_file.exists():
                gle_txt = gle_file.read_text(encoding="utf-8")
                orig_get_title = ".method public getTitle()Ljava/lang/String;\\n    .registers 2\\n\\n    iget-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;\\n\\n    return-object v0\\n.end method"
                new_get_title = """.method public getTitle()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    if-nez v0, :cond_gle_t_not_null

    const-string v0, ""

    return-object v0

    :cond_gle_t_not_null
    const-string v1, "%20"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_gle_t_url

    const-string v1, "%20"

    const-string v2, " "

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    :cond_gle_t_url
    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_gle_t_ext

    :try_start_gle_dec
    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_gle_dec
    .catch Ljava/lang/Exception; {:try_start_gle_dec .. :try_end_gle_dec} :catch_gle_dec

    goto :cond_gle_t_ext

    :catch_gle_dec
    nop

    :cond_gle_t_ext
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".iso"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_strip_4

    const-string v2, ".chd"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_strip_4

    const-string v2, ".cso"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_strip_4

    const-string v2, ".bin"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_strip_4

    const-string v2, ".gz"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_gle_t_done

    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :cond_gle_t_done

    :cond_strip_4
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_gle_t_done
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    return-object v0
.end method"""

                orig_get_reg = ".method public getRegion()Lxyz/aethersx2/android/GameListEntry$b;\\n    .registers 2\\n\\n    iget-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;\\n\\n    return-object v0\\n.end method"
                new_detect_and_get_reg = """.method public static detectRegion(Lxyz/aethersx2/android/GameListEntry;)Lxyz/aethersx2/android/GameListEntry$b;
    .registers 6

    if-nez p0, :cond_gle_reg_null

    sget-object v0, Lxyz/aethersx2/android/GameListEntry$b;->d:[Lxyz/aethersx2/android/GameListEntry$b;

    const/4 v1, 0x7

    aget-object v0, v0, v1

    return-object v0

    :cond_gle_reg_null
    iget-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    sget-object v1, Lxyz/aethersx2/android/GameListEntry$b;->d:[Lxyz/aethersx2/android/GameListEntry$b;

    if-eqz v0, :cond_gle_reg_check

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x7

    if-eq v2, v3, :cond_gle_reg_check

    return-object v0

    :cond_gle_reg_check
    iget-object v2, p0, Lxyz/aethersx2/android/GameListEntry;->d:Ljava/lang/String;

    if-eqz v2, :cond_gle_chk_name

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "SLUS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_ntsc_u

    const-string v3, "SCUS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_chk_ser_pal

    :cond_ntsc_u
    const/4 v2, 0x6

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_chk_ser_pal
    const-string v3, "SLES"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_pal_e

    const-string v3, "SCES"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_pal_e

    const-string v3, "SLED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_pal_e

    const-string v3, "SCED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_chk_ser_jp

    :cond_pal_e
    const/16 v2, 0xc

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_chk_ser_jp
    const-string v3, "SLPS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_ntsc_j

    const-string v3, "SCPS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_ntsc_j

    const-string v3, "SLPM"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_ntsc_j

    const-string v3, "SCPM"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_chk_ser_kr

    :cond_ntsc_j
    const/4 v2, 0x3

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_chk_ser_kr
    const-string v3, "SLKA"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_ntsc_k

    const-string v3, "SCKA"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_chk_ser_cn

    :cond_ntsc_k
    const/4 v2, 0x4

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_chk_ser_cn
    const-string v3, "SLCN"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_ntsc_c

    const-string v3, "SCCN"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_gle_chk_name

    :cond_ntsc_c
    const/4 v2, 0x1

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_gle_chk_name
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    if-eqz v3, :cond_chk_p

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_chk_p
    iget-object v3, p0, Lxyz/aethersx2/android/GameListEntry;->c:Ljava/lang/String;

    if-eqz v3, :cond_chk_str

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_chk_str
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "(USA)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_u

    const-string v3, "(US)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_u

    const-string v3, "[USA]"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_u

    const-string v3, "SLUS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_u

    const-string v3, "SCUS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_u

    const-string v3, "NTSC-U"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_chk_name_pal

    :cond_match_u
    const/4 v2, 0x6

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_chk_name_pal
    const-string v3, "(EUROPE)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_pal

    const-string v3, "(EU)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_pal

    const-string v3, "[EUROPE]"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_pal

    const-string v3, "(PAL)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_pal

    const-string v3, "[PAL]"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_pal

    const-string v3, "(EN,"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_pal

    const-string v3, "SLES"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_pal

    const-string v3, "SCES"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_pal

    const-string v3, "PAL-E"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_chk_name_jp

    :cond_match_pal
    const/16 v2, 0xc

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_chk_name_jp
    const-string v3, "(JAPAN)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_jp

    const-string v3, "(JP)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_jp

    const-string v3, "[JAPAN]"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_jp

    const-string v3, "SLPS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_jp

    const-string v3, "SCPS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_jp

    const-string v3, "SLPM"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_jp

    const-string v3, "NTSC-J"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_chk_name_kr

    :cond_match_jp
    const/4 v2, 0x3

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_chk_name_kr
    const-string v3, "(KOREA)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_kr

    const-string v3, "(KO)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_kr

    const-string v3, "SLKA"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_kr

    const-string v3, "NTSC-K"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_chk_name_cn

    :cond_match_kr
    const/4 v2, 0x4

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_chk_name_cn
    const-string v3, "(CHINA)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_cn

    const-string v3, "(CN)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_cn

    const-string v3, "SLCN"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_match_cn

    const-string v3, "NTSC-C"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_ret_orig

    :cond_match_cn
    const/4 v2, 0x1

    aget-object v1, v1, v2

    iput-object v1, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v1

    :cond_ret_orig
    if-eqz v0, :cond_fallback_other

    return-object v0

    :cond_fallback_other
    const/4 v0, 0x7

    aget-object v0, v1, v0

    iput-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v0
.end method

.method public getRegion()Lxyz/aethersx2/android/GameListEntry$b;
    .registers 2

    invoke-static {p0}, Lxyz/aethersx2/android/GameListEntry;->detectRegion(Lxyz/aethersx2/android/GameListEntry;)Lxyz/aethersx2/android/GameListEntry$b;

    move-result-object v0

    return-object v0
.end method"""

                orig_get_title = """.method public getTitle()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->e:Ljava/lang/String;

    return-object v0
.end method"""

                orig_get_reg = """.method public getRegion()Lxyz/aethersx2/android/GameListEntry$b;
    .registers 2

    iget-object v0, p0, Lxyz/aethersx2/android/GameListEntry;->a:Lxyz/aethersx2/android/GameListEntry$b;

    return-object v0
.end method"""

                if orig_get_title in gle_txt:
                    gle_txt = gle_txt.replace(orig_get_title, new_get_title, 1)
                if orig_get_reg in gle_txt:
                    gle_txt = gle_txt.replace(orig_get_reg, new_detect_and_get_reg, 1)
                gle_file.write_text(gle_txt, encoding="utf-8")
                print(f"  ✓ Patched GameListEntry.smali: clean %20 titles and auto-detect region flags")

            # Patch FileHelper.smali: sanitize getFileNameForPath (%20 -> space)
            fh_file = smali_out / "xyz" / "aethersx2" / "android" / "FileHelper.smali"
            if fh_file.exists():
                fh_txt = fh_file.read_text(encoding="utf-8")
                target_fh = """:cond_31
    return-object p0"""
                repl_fh = """:cond_31
    if-eqz p0, :cond_fn_ret

    const-string v0, "%20"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_fn_ret

    const-string v0, "%20"

    const-string v1, " "

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_fn_ret
    return-object p0"""
                if target_fh in fh_txt:
                    fh_txt = fh_txt.replace(target_fh, repl_fh, 1)
                    fh_file.write_text(fh_txt, encoding="utf-8")
                    print(f"  ✓ Patched FileHelper.smali: decode %20 in filenames")

            # Patch game list runners: l6/n4.smali (Adreno) and q3/u1.smali (Mali)
            for runner_rel in [Path("l6") / "n4.smali", Path("q3") / "u1.smali"]:
                runner_file = smali_out / runner_rel
                if runner_file.exists():
                    r_txt = runner_file.read_text(encoding="utf-8")
                    orig_get_entries = """invoke-static {}, Lxyz/aethersx2/android/NativeLibrary;->getGameListEntries()[Lxyz/aethersx2/android/GameListEntry;

    move-result-object v1"""
                    repl_get_entries = orig_get_entries + """

    invoke-static {v1}, Lxyz/aethersx2/android/NativeLibrary;->deduplicateEntries([Lxyz/aethersx2/android/GameListEntry;)[Lxyz/aethersx2/android/GameListEntry;

    move-result-object v1"""
                    if orig_get_entries in r_txt and "deduplicateEntries" not in r_txt:
                        r_txt = r_txt.replace(orig_get_entries, repl_get_entries, 1)
                        runner_file.write_text(r_txt, encoding="utf-8")
                        print(f"  ✓ Patched {runner_rel}: deduplicate game list entries")

            # Patch directory settings: l6/p4.smali (Adreno) and q3/v1.smali (Mali)
            p4_file = smali_out / "l6" / "p4.smali"
            if p4_file.exists():
                p4_txt = p4_file.read_text(encoding="utf-8")
                target_p4 = """.method public static z(Landroid/content/Context;Ljava/lang/String;Z)V
    .registers 3

    .line 1
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;"""
                repl_p4 = """.method public static z(Landroid/content/Context;Ljava/lang/String;Z)V
    .registers 6

    if-eqz p1, :cond_resolve_done

    const-string v0, "content://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_resolve_done

    :try_start_p4_res
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, p0}, Lxyz/aethersx2/android/FileHelper;->getFullPathFromTreeUri(Landroid/net/Uri;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_resolve_done

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_resolve_done

    const-string v1, "/"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_resolve_done

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_resolve_done

    move-object p1, v0
    :try_end_p4_res
    .catch Ljava/lang/Exception; {:try_start_p4_res .. :try_end_p4_res} :catch_p4_res

    goto :cond_resolve_done

    :catch_p4_res
    nop

    :cond_resolve_done
    .line 1
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;"""
                if target_p4 in p4_txt:
                    p4_txt = p4_txt.replace(target_p4, repl_p4, 1)
                    p4_file.write_text(p4_txt, encoding="utf-8")
                    print(f"  ✓ Patched l6/p4.smali: resolve content:// SAF tree URIs to POSIX paths")

            v1_file = smali_out / "q3" / "v1.smali"
            if v1_file.exists():
                v1_txt = v1_file.read_text(encoding="utf-8")
                target_v1 = """.method public static y(Landroid/content/Context;Ljava/lang/String;Z)V
    .registers 3

    .line 1
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;"""
                repl_v1 = """.method public static y(Landroid/content/Context;Ljava/lang/String;Z)V
    .registers 6

    if-eqz p1, :cond_resolve_done

    const-string v0, "content://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_resolve_done

    :try_start_v1_res
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, p0}, Lxyz/aethersx2/android/FileHelper;->getFullPathFromTreeUri(Landroid/net/Uri;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_resolve_done

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_resolve_done

    const-string v1, "/"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_resolve_done

    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_resolve_done

    move-object p1, v0
    :try_end_v1_res
    .catch Ljava/lang/Exception; {:try_start_v1_res .. :try_end_v1_res} :catch_v1_res

    goto :cond_resolve_done

    :catch_v1_res
    nop

    :cond_resolve_done
    .line 1
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;"""
                if target_v1 in v1_txt:
                    v1_txt = v1_txt.replace(target_v1, repl_v1, 1)
                    v1_file.write_text(v1_txt, encoding="utf-8")
                    print(f"  ✓ Patched q3/v1.smali: resolve content:// SAF tree URIs to POSIX paths")

            # 3. Patch MainActivity.smali: inject PCSX2 version, Check Update button handler, and Setup Wizard restart
            main_activity = smali_out / "xyz" / "aethersx2" / "android" / "MainActivity.smali"
            if main_activity.exists():
                content = main_activity.read_text(encoding="utf-8")
                if target_needle in content:
                    content = content.replace(target_needle, replacement, 1)
                    print(f"  ✓ Injected PCSX2 version ({pcsx2_ver}) after Java Version into {dex_path.name}")

                req_obj = "invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;\n"
                check_update_code = """    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_check_update_skip

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Check Update"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_update_skip

    invoke-virtual {p0}, Lxyz/aethersx2/android/MainActivity;->B()V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "https://github.com/mininxd/NetherSX2-patch/releases/latest"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const/4 v0, 0x1

    return v0

    :cond_check_update_skip
"""
                if req_obj in content and "Check Update" not in content:
                    content = content.replace(req_obj, req_obj + "\n" + check_update_code, 1)
                    print(f"  ✓ Injected Check Update navigation handler into MainActivity.smali")

                pattern_wizard_finish = r"(:pswitch_[0-9a-fA-F]+\n\s*iget-object v0, v1, Lxyz/aethersx2/android/MainActivity;->[A-Za-z0-9_]+:Lxyz/aethersx2/android/d;.*?:cond_[0-9a-fA-F]+\n\s*invoke-virtual/range \{p0 \.\. p0\}, Landroid/app/Activity;->recreate\(\)V)"
                m_finish = re.search(pattern_wizard_finish, content, flags=re.DOTALL)
                if m_finish:
                    label = re.search(r":pswitch_[0-9a-fA-F]+", m_finish.group(1)).group(0)
                    restart_code = label + """
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lxyz/aethersx2/android/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v2, 0x14008000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    return-void"""
                    content = content[:m_finish.start()] + restart_code + content[m_finish.end():]
                    print(f"  ✓ Patched Setup Wizard completion in MainActivity.smali to restart process cleanly")

                set_main = "invoke-static {p0}, Lxyz/aethersx2/android/NativeLibrary;->setMainActivity(Lxyz/aethersx2/android/MainActivity;)V\n"
                if set_main in content and "AutoCoversDownloader" not in content:
                    content = content.replace(set_main, set_main + "\n    invoke-static {p0}, Lxyz/aethersx2/android/AutoCoversDownloader;->startAutoDownload(Landroid/content/Context;)V\n", 1)
                    print(f"  ✓ Injected AutoCoversDownloader trigger into MainActivity.smali")

                main_activity.write_text(content, encoding="utf-8")

            # 4. Patch EmulationActivity.smali: DiscordRpcManager & GyroToRightStickManager
            emu_act = smali_out / "xyz" / "aethersx2" / "android" / "EmulationActivity.smali"
            if emu_act.exists():
                ea_content = emu_act.read_text(encoding="utf-8")
                if "DiscordRpcManager" not in ea_content:
                    pattern_boot = r'(const-string [a-z0-9]+, \"bootPath\"\s+invoke-virtual \{[a-z0-9]+, [a-z0-9]+\}, Landroid/content/Intent;->getStringExtra\(Ljava/lang/String;\)Ljava/lang/String;\s+move-result-object ([a-z0-9]+)\s+iput-object \2, p0, Lxyz/aethersx2/android/EmulationActivity;->[A-Za-z0-9_]+:Ljava/lang/String;)'
                    m_boot = re.search(pattern_boot, ea_content)
                    if m_boot:
                        reg = m_boot.group(2)
                        repl_boot = m_boot.group(1) + f'\n\n    invoke-static {{p0, {reg}}}, Lxyz/aethersx2/android/DiscordRpcManager;->start(Landroid/content/Context;Ljava/lang/String;)V'
                        ea_content = ea_content[:m_boot.start()] + repl_boot + ea_content[m_boot.end():]

                    pattern_destroy = r'(\.method public final onDestroy\(\)V\s+\.registers 4\s+)'
                    m_destroy = re.search(pattern_destroy, ea_content)
                    if m_destroy:
                        repl_destroy = m_destroy.group(1) + 'invoke-static {p0}, Lxyz/aethersx2/android/DiscordRpcManager;->stop(Landroid/content/Context;)V\n\n    invoke-static {}, Lxyz/aethersx2/android/GyroToRightStickManager;->stop()V\n\n    '
                        ea_content = ea_content[:m_destroy.start()] + repl_destroy + ea_content[m_destroy.end():]

                    pattern_resume = r'(invoke-super \{p0\}, L[a-z]+/e;->onPostResume\(\)V)'
                    m_resume = re.search(pattern_resume, ea_content)
                    if m_resume:
                        repl_resume = m_resume.group(1) + '\n\n    invoke-static {p0}, Lxyz/aethersx2/android/GyroToRightStickManager;->start(Landroid/content/Context;)V'
                        ea_content = ea_content[:m_resume.start()] + repl_resume + ea_content[m_resume.end():]

                    emu_act.write_text(ea_content, encoding="utf-8")
                    print(f"  ✓ Injected DiscordRpcManager and GyroToRightStickManager into EmulationActivity.smali")

            # 5. Patch EmulationSurfaceView.smali: ExternalControllerHelper
            esv_file = smali_out / "xyz" / "aethersx2" / "android" / "EmulationSurfaceView.smali"
            if esv_file.exists():
                esv_content = esv_file.read_text(encoding="utf-8")
                if "ExternalControllerHelper" not in esv_content:
                    pattern_esv = (
                        r'(invoke-static \{([a-z0-9]+)\}, Lxyz/aethersx2/android/EmulationSurfaceView;->e\(Landroid/view/InputDevice;\)Z\s+'
                        r'move-result ([a-z0-9]+)\s+'
                        r'if-eqz \3, :cond_[0-9a-fA-F]+'
                        r'(?:\s+\.line \d+)?\s+'
                        r'iput-boolean [a-z0-9]+,\s*([a-z0-9]+),\s*Lxyz/aethersx2/android/EmulationSurfaceView;->(?:d|j):Z)'
                    )
                    m_esv = re.search(pattern_esv, esv_content)
                    if m_esv:
                        dev_reg = m_esv.group(2)
                        scratch_reg = m_esv.group(3)
                        this_reg = m_esv.group(4)
                        repl_esv = (
                            m_esv.group(1) +
                            f'\n\n    invoke-virtual {{{this_reg}}}, Landroid/view/View;->getContext()Landroid/content/Context;\n\n'
                            f'    move-result-object {scratch_reg}\n\n'
                            f'    invoke-static {{{scratch_reg}, {dev_reg}}}, Lxyz/aethersx2/android/ExternalControllerHelper;->checkAndAutoMapPlayer1(Landroid/content/Context;Landroid/view/InputDevice;)V'
                        )
                        esv_content = esv_content[:m_esv.start()] + repl_esv + esv_content[m_esv.end():]
                        esv_file.write_text(esv_content, encoding="utf-8")
                        print(f"  ✓ Injected ExternalControllerHelper auto-map into EmulationSurfaceView.smali")

            # 6. Patch SetupWizardActivity$e$a.smali: default orientation & renderer
            wizard_sub = smali_out / "xyz" / "aethersx2" / "android" / "SetupWizardActivity$e$a.smali"
            if wizard_sub.exists():
                wiz_content = wizard_sub.read_text(encoding="utf-8")
                wiz_content = re.sub(
                    r'(const-string v2, "UI/EmulationActivityOrientation"\s+const-string v3, )"unspecified"',
                    r'\g<1>"sensor"',
                    wiz_content
                )
                if is_mali:
                    wiz_content = re.sub(
                        r'(const-string v2, "EmuCore/GS/Renderer"\s+const-string v3, )"12"',
                        r'\g<1>"14"',
                        wiz_content
                    )
                wizard_sub.write_text(wiz_content, encoding="utf-8")
                print(f"  ✓ Configured SetupWizardActivity$e$a.smali (Orientation: sensor{' + Renderer: Vulkan 14' if is_mali else ''})")

            # 7. Patch j$d.smali: Add 10th tab (Discord) to Settings ViewPager adapter
            jd_file = smali_out / "xyz" / "aethersx2" / "android" / "j$d.smali"
            if jd_file.exists():
                jd_content = jd_file.read_text(encoding="utf-8")
                jd_content = re.sub(
                    r'(\.method public final c\(\)I\s+\.registers 2\s+const/16 v0, )0x9',
                    r'\g<1>0xa',
                    jd_content
                )
                discord_xml_id = "0x7f130017" if is_mali else "0x7f130018"
                pswitch_discord = f"""    :pswitch_discord
    new-instance p1, Lxyz/aethersx2/android/j$e;

    const v0, {discord_xml_id}

    invoke-direct {{p1, v0}}, Lxyz/aethersx2/android/j$e;-><init>(I)V

    return-object p1

"""
                if ":pswitch_discord" not in jd_content:
                    jd_content = jd_content.replace("    :pswitch_data_4c", pswitch_discord + "    :pswitch_data_4c")
                    jd_content = re.sub(r'(:pswitch_9\s+)(\.end packed-switch)', r'\1    :pswitch_discord\n    \2', jd_content)
                jd_file.write_text(jd_content, encoding="utf-8")
                print(f"  ✓ Injected Discord tab ({discord_xml_id}) into j$d.smali")

            # 8. Patch l6/j0.smali: Safe tab title boundary check
            j0_file = smali_out / "l6" / "j0.smali"
            if j0_file.exists():
                j0_content = j0_file.read_text(encoding="utf-8")
                old_j0 = """    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    aget-object p2, v0, p2

    invoke-virtual {p1, p2}, Lcom/google/android/material/tabs/TabLayout$f;->b(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$f;

    return-void"""
                new_j0 = """    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    if-ge p2, v1, :cond_tab_fallback

    aget-object p2, v0, p2

    invoke-virtual {p1, p2}, Lcom/google/android/material/tabs/TabLayout$f;->b(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$f;

    return-void

    :cond_tab_fallback
    const-string p2, "Discord"

    invoke-virtual {p1, p2}, Lcom/google/android/material/tabs/TabLayout$f;->b(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$f;

    return-void"""
                if old_j0 in j0_content:
                    j0_content = j0_content.replace(old_j0, new_j0)
                    j0_file.write_text(j0_content, encoding="utf-8")
                    print(f"  ✓ Patched l6/j0.smali with safe Discord tab title resolution")

            print(f"  Reassembling {dex_path.name} with smali...")
            patched_dex = temp_dir / "classes.dex"
            run_cmd(smali_cmd + ["assemble", str(smali_out), "-o", str(patched_dex)])
            patched_bytes = patched_dex.read_bytes()
            verify_dex_integrity(patched_bytes)
            _DEX_CACHE[cache_key] = patched_bytes
            dex_path.write_bytes(patched_bytes)
            print(f"  ✓ Injected PCSX2 version ({pcsx2_ver}), Setup Wizard Data Directory & custom smali into {dex_path.name}")
        finally:
            shutil.rmtree(temp_dir, ignore_errors=True)


def inject_discord_tab_resources(work_dir: Path, is_mali: bool = False) -> None:
    """Inject discord_preferences.xml, public.xml ID, and arrays.xml tab title into work_dir."""
    discord_xml_id = "0x7f130017" if is_mali else "0x7f130018"
    discord_xml_content = """<?xml version='1.0' encoding='utf-8' ?>
<PreferenceScreen xmlns:app="http://schemas.android.com/apk/res-auto">
  <PreferenceCategory app:iconSpaceReserved="false"
                      app:title="Discord Rich Presence">
    <SwitchPreferenceCompat app:defaultValue="true"
                          app:iconSpaceReserved="false"
                          app:key="UI/EnableDiscordRpc"
                          app:summary="Broadcasts current game to Discord Rich Presence."
                          app:title="Enable Discord Rich Presence" />
    <SwitchPreferenceCompat app:defaultValue="true"
                          app:dependency="UI/EnableDiscordRpc"
                          app:iconSpaceReserved="false"
                          app:key="UI/DiscordShowTime"
                          app:summary="Displays elapsed playing time on Discord."
                          app:title="Show Elapsed Playtime" />
  </PreferenceCategory>
  <PreferenceCategory app:iconSpaceReserved="false"
                      app:title="Direct Discord Gateway (Standalone)">
    <EditTextPreference app:dependency="UI/EnableDiscordRpc"
                        app:dialogTitle="Discord User Token"
                        app:iconSpaceReserved="false"
                        app:key="UI/DiscordToken"
                        app:summary="Direct Discord Gateway connection. Paste your account token to display activity."
                        app:title="Discord User Token" />
    <EditTextPreference app:defaultValue="1560829866645917746"
                        app:dependency="UI/EnableDiscordRpc"
                        app:dialogTitle="Discord Application ID"
                        app:iconSpaceReserved="false"
                        app:key="UI/DiscordClientId"
                        app:summary="Application ID for Rich Presence (Default: 1560829866645917746)"
                        app:title="Discord Application (Client) ID" />
  </PreferenceCategory>
  <PreferenceCategory app:iconSpaceReserved="false"
                      app:title="Information">
    <Preference app:iconSpaceReserved="false"
                app:summary="Paste your Discord User Token above to show rich status directly on your Discord profile without any background apps."
                app:title="How to Use" />
  </PreferenceCategory>
</PreferenceScreen>
"""
    # 1. Write discord_preferences.xml into every res/xml directory
    xml_written = 0
    for xml_dir in work_dir.rglob("res/xml"):
        if xml_dir.is_dir():
            target_xml = xml_dir / "discord_preferences.xml"
            target_xml.write_text(discord_xml_content, encoding="utf-8")
            xml_written += 1
    print(f"  ✓ Injected discord_preferences.xml into {xml_written} xml directory(ies)")

    # 2. Add discord_preferences to public.xml
    pub_entry = f'  <public id="{discord_xml_id}" type="xml" name="discord_preferences" />\n'
    for pub_path in work_dir.rglob("public.xml"):
        content = pub_path.read_text(encoding="utf-8")
        if 'name="discord_preferences"' not in content:
            if "</resources>" in content:
                content = content.replace("</resources>", pub_entry + "</resources>")
            else:
                content += "\n" + pub_entry
            pub_path.write_text(content, encoding="utf-8")
            print(f"  ✓ Added discord_preferences ({discord_xml_id}) to {pub_path.name}")

    # 3. Add Discord to settings_tabs in arrays.xml
    tab_item = "    <item>Discord</item>\n"
    arrays_patched = 0
    for arr_path in work_dir.rglob("arrays.xml"):
        content = arr_path.read_text(encoding="utf-8")
        if 'name="settings_tabs"' in content and "<item>Discord</item>" not in content:
            pattern = r'(<string-array\b[^>]*name="settings_tabs"[^>]*>.*?)(\s*</string-array>)'
            new_content, count = re.subn(pattern, rf"\g<1>\n{tab_item}\g<2>", content, flags=re.DOTALL)
            if count > 0:
                arr_path.write_text(new_content, encoding="utf-8")
                arrays_patched += count
    print(f"  ✓ Injected 'Discord' tab into {arrays_patched} arrays.xml files")


def inject_scale_multiplier(input_apk: Path, output_apk: Path, work_name: str, is_mali: bool = False, is_switch: bool = False) -> None:
    work_dir = REPO_ROOT / work_name
    if work_dir.exists():
        shutil.rmtree(work_dir)

    apkeditor = ensure_apkeditor()
    # Decode with -dex so classes.dex and native libraries are kept raw and resource IDs are preserved
    run_cmd(["java", "-jar", str(apkeditor), "d", "-dex", "-f", "-i", str(input_apk), "-o", str(work_dir)])

    # Delete all custom controller PNG buttons entirely and restore clean original vector buttons
    remove_custom_controller_buttons(work_dir)

    # Inject updated PCSX2 GameDB, controller DB, cheats, and strip ad leftovers
    inject_updated_pcsx2_assets(work_dir)

    # Inject QoL preference switches (Auto Covers, Discord RPC, Gyro) and default settings
    patch_ui_preferences(work_dir, is_mali=is_mali)

    # Inject dedicated Discord tab resources into work_dir
    inject_discord_tab_resources(work_dir, is_mali=is_mali)

    # Patch DEX to show PCSX2 version in Show Version dialog
    patch_dex_pcsx2_version(work_dir, is_mali=is_mali)

    # Patch GameIndex.yaml with database optimizations (Black, Downhill Domination)
    patch_gameindex(work_dir)

    # If building Mali or Switch APK, apply device-specific defaults
    if is_mali:
        apply_mali_optimizations(work_dir)
    elif is_switch:
        apply_switch_optimizations(work_dir)

    # Preserve user data (Memory Cards, RetroAchievements login & settings, controller mappings) when resetting defaults
    patch_preserve_user_data_on_reset(work_dir)

    # Patch targetSdkVersion and compileSdkVersion to Android 14 (API 34) for full Android 15 compatibility
    patch_manifest_target_sdk(work_dir, target_sdk=34)

    # Inject storage permissions and legacy external storage flag
    patch_manifest_storage_permissions(work_dir)

    # Update setup wizard step count in layout XML
    patch_setup_wizard_xml(work_dir)

    # Remove dead Discord and Patreon buttons, URLs, and telemetry
    remove_dead_socials_and_telemetry(work_dir)

    # Inject Check Update menu item into navigation drawer
    inject_check_update_menu(work_dir)

    # Check if newly built native core from PCSX2 source exists and should be injected
    custom_so = REPO_ROOT / "native" / "build" / "libemucore.so"
    use_custom_core = os.environ.get("USE_CUSTOM_CORE", "0") == "1"
    has_custom_so = False
    if use_custom_core and custom_so.exists() and custom_so.stat().st_size > 0:
        injected = 0
        for so_dest in work_dir.rglob("libemucore.so"):
            shutil.copyfile(custom_so, so_dest)
            print(f"  ✓ Injected freshly compiled PCSX2 native core ({custom_so.stat().st_size} bytes) into {so_dest.relative_to(work_dir)}")
            injected += 1
        if injected == 0:
            target_so = work_dir / "lib" / "arm64-v8a" / "libemucore.so"
            target_so.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(custom_so, target_so)
            print(f"  ✓ Injected freshly compiled PCSX2 native core ({custom_so.stat().st_size} bytes) into {target_so.relative_to(work_dir)}")
        has_custom_so = True

    # Patch resolution scale multiplier in arrays.xml and libemucore.so
    sys.path.insert(0, str(PATCHES_DIR))
    from patch_scale_multiplier import patch_arrays, patch_emucore_scale_clamp
    from patch_mali_vulkan import patch_mali_vulkan_core
    modified = 0
    for res_dir in work_dir.rglob("res"):
        if res_dir.is_dir():
            modified += patch_arrays(res_dir)
    print(f"Patched resolution scales (0.05x, 0.1x, 0.25x) in {modified} arrays.xml files inside {work_name}")
    if not has_custom_so:
        patch_emucore_scale_clamp(work_dir)
        patch_mali_vulkan_core(work_dir)
        patch_libemucore_custom_data_dir(work_dir)
        patch_libemucore_settings_defaults(work_dir)

    # Rebuild with APKEditor (preserves original resource IDs)
    raw_rebuilt = REPO_ROOT / f"{work_name}_rebuilt.apk"
    run_cmd(["java", "-jar", str(apkeditor), "b", "-framework-version", "34", "-f", "-i", str(work_dir), "-o", str(raw_rebuilt)])

    # Zipalign
    aligned = REPO_ROOT / f"{work_name}_aligned.apk"
    zipalign_apk(raw_rebuilt, aligned)

    # Sign
    sign_apk(aligned, output_apk)

    # Cleanup temporary files
    shutil.rmtree(work_dir, ignore_errors=True)
    if raw_rebuilt.exists():
        raw_rebuilt.unlink()
    if aligned.exists():
        aligned.unlink()





def build_nethersx2_adreno() -> None:
    print("\n==========================================")
    print("Building NetherSX2 Adreno (v1.5-4248) APK")
    print("==========================================")
    base_apk = get_adreno_base_apk()
    xdelta_bin = get_xdelta_bin()

    if not ADRENO_NETHERSX2_XDELTA.exists():
        raise SystemExit(f"Adreno NetherSX2 xdelta patch not found: {ADRENO_NETHERSX2_XDELTA}")
    adreno_nethersx2_base = REPO_ROOT / "adreno_nethersx2_base.apk"
    # Apply official NetherSX2 4248 patch
    run_cmd([xdelta_bin, "-d", "-f", "-s", str(base_apk), str(ADRENO_NETHERSX2_XDELTA), str(adreno_nethersx2_base)])

    # Inject scale multiplier and sign
    inject_scale_multiplier(adreno_nethersx2_base, NETHERSX2_ADRENO_APK, "work_nethersx2_adreno")
    if adreno_nethersx2_base.exists():
        adreno_nethersx2_base.unlink()

    # Also keep nethersx2.apk for compatibility
    shutil.copyfile(NETHERSX2_ADRENO_APK, REPO_ROOT / "nethersx2.apk")

    # Generate xdelta against base Adreno APK
    if ADRENO_FINAL_XDELTA.exists():
        ADRENO_FINAL_XDELTA.unlink()
    run_cmd([xdelta_bin, "-e", "-f", "-s", str(base_apk), str(NETHERSX2_ADRENO_APK), str(ADRENO_FINAL_XDELTA)])
    shutil.copyfile(ADRENO_FINAL_XDELTA, REPO_ROOT / "nethersx2.xdelta")
    print(f"Generated {ADRENO_FINAL_XDELTA} ({ADRENO_FINAL_XDELTA.stat().st_size} bytes)")
    print(f"Successfully built {NETHERSX2_ADRENO_APK}")


def build_nethersx2_mali() -> None:
    print("\n==========================================")
    print("Building NetherSX2 Mali (v1.5-3668) APK")
    print("==========================================")
    base_apk = get_mali_base_apk()
    xdelta_bin = get_xdelta_bin()

    if not MALI_CLASSIC_XDELTA.exists():
        print(f"Downloading NetherSX2 classic xdelta from {MALI_CLASSIC_XDELTA_URL}...")
        urllib.request.urlretrieve(MALI_CLASSIC_XDELTA_URL, MALI_CLASSIC_XDELTA)

    mali_nethersx2_base = REPO_ROOT / "mali_nethersx2_base.apk"
    # Apply NetherSX2 Classic 3668 patch
    run_cmd([xdelta_bin, "-d", "-f", "-s", str(base_apk), str(MALI_CLASSIC_XDELTA), str(mali_nethersx2_base)])

    # Inject scale multiplier and sign
    inject_scale_multiplier(mali_nethersx2_base, NETHERSX2_MALI_APK, "work_nethersx2_mali", is_mali=True)
    if mali_nethersx2_base.exists():
        mali_nethersx2_base.unlink()
    print(f"Successfully built {NETHERSX2_MALI_APK}")


def build_adreno() -> None:
    build_nethersx2_adreno()


def build_mali() -> None:
    build_nethersx2_mali()


def verify_all(target_apks: list[Path] | None = None) -> None:
    print("\n==========================================")
    print("Verifying built artifacts...")
    print("==========================================")
    if target_apks is None:
        target_apks = [
            NETHERSX2_ADRENO_APK,
            NETHERSX2_MALI_APK,
        ]
    if not target_apks:
        raise SystemExit("ERROR: No output APKs specified to verify!")

    for apk in target_apks:
        if not apk.exists():
            raise SystemExit(f"ERROR: Expected built APK not found: {apk}")
        with zipfile.ZipFile(apk) as z:
            arsc = z.read("resources.arsc")
            for scale_val in [b"0.050000", b"0.100000", b"0.250000"]:
                if scale_val not in arsc:
                    raise SystemExit(f"ERROR: {scale_val.decode()} render option missing in {apk.name}!")
            custom_so = REPO_ROOT / "native" / "build" / "libemucore.so"
            use_custom_core = os.environ.get("USE_CUSTOM_CORE", "0") == "1"
            if use_custom_core and custom_so.exists() and custom_so.stat().st_size > 0:
                if "lib/arm64-v8a/libemucore.so" not in z.namelist():
                    raise SystemExit(f"ERROR: lib/arm64-v8a/libemucore.so missing in {apk.name}!")
                so_bytes = z.read("lib/arm64-v8a/libemucore.so")
                if len(so_bytes) != custom_so.stat().st_size:
                    raise SystemExit(f"ERROR: libemucore.so in {apk.name} size ({len(so_bytes)}) doesn't match compiled size ({custom_so.stat().st_size})!")
                if not so_bytes.startswith(b"\x7fELF") or so_bytes[0x12:0x14] != b"\xb7\x00":
                    raise SystemExit(f"ERROR: libemucore.so in {apk.name} is not a valid arm64-v8a ELF binary!")
                print(f"  ✓ Verified integrated libemucore.so in {apk.name} ({len(so_bytes)} bytes, arm64-v8a ELF)")
            else:
                so_bytes = z.read("lib/arm64-v8a/libemucore.so")
                patched_pattern = b"\x01\x58\x21\x1e\x02\x10\x2c\x1e\x00\x20\x22\x1e\x20\x40\x20\x1e"
                if patched_pattern not in so_bytes:
                    raise SystemExit(f"ERROR: libemucore.so in {apk.name} still has 0.5f minimum clamp!")
                mali_dsb_unlocked = bytes.fromhex("490100521f2003d54d008052")
                if mali_dsb_unlocked in so_bytes:
                    raise SystemExit(f"ERROR: libemucore.so in {apk.name} has dual-source blend unlocked for Mali (violates deactivation requirement)!")
                arm64_nop = bytes.fromhex("1f2003d5")
                if arm64_nop not in (so_bytes[0x65afa0:0x65afa4], so_bytes[0x681e7c:0x681e80]):
                    raise SystemExit(f"ERROR: libemucore.so in {apk.name} missing Vulkan format check bypass!")
                if apk.name == NETHERSX2_MALI_APK.name:
                    if so_bytes[0x833D04:0x833D08] != bytes.fromhex("0004140b"):
                        raise SystemExit(f"ERROR: libemucore.so in {apk.name} missing Fast Mali Vulkan patch!")
                    if so_bytes[0x8344AC:0x8344B0] != bytes.fromhex("40008052"):
                        raise SystemExit(f"ERROR: libemucore.so in {apk.name} missing Full Texture Preload patch!")
                elif apk.name == NETHERSX2_ADRENO_APK.name:
                    if so_bytes[0x84179C:0x8417A0] != bytes.fromhex("40008052"):
                        raise SystemExit(f"ERROR: libemucore.so in {apk.name} missing Full Texture Preload patch!")
            custom_buttons = [n for n in z.namelist() if n.endswith(".png") and "ic_controller_" in n]
            if custom_buttons:
                raise SystemExit(f"ERROR: Custom controller buttons still found in {apk.name}: {custom_buttons}")
            xml_buttons = [n for n in z.namelist() if n.startswith("res/drawable/ic_controller_") and n.endswith(".xml")]
            if len(xml_buttons) != 34:
                raise SystemExit(f"ERROR: Expected 34 original controller XML buttons, found {len(xml_buttons)} in {apk.name}!")
            if apk == NETHERSX2_MALI_APK and b"Fast(Mali)/Unsafe Defaults" not in arsc:
                raise SystemExit(f"ERROR: 'Fast(Mali)/Unsafe Defaults' missing in {apk.name} resources.arsc!")
            if shutil.which("aapt"):
                out = subprocess.check_output(["aapt", "dump", "badging", str(apk)]).decode("utf-8", errors="ignore")
                if "targetSdkVersion:'34'" not in out:
                    raise SystemExit(f"ERROR: targetSdkVersion is not 34 in {apk.name}!")
            if "assets/GameIndex.yaml" in z.namelist():
                gi_bytes = z.read("assets/GameIndex.yaml")
                if len(gi_bytes) < 1500000:
                    raise SystemExit(f"ERROR: assets/GameIndex.yaml in {apk.name} is smaller than expected ({len(gi_bytes)} bytes)!")
            if "assets/game_controller_db.txt" in z.namelist():
                db_bytes = z.read("assets/game_controller_db.txt")
                if len(db_bytes) < 400000:
                    raise SystemExit(f"ERROR: assets/game_controller_db.txt in {apk.name} is smaller than expected ({len(db_bytes)} bytes)!")
            if "classes.dex" in z.namelist():
                dex_bytes = z.read("classes.dex")
                if b"PCSX2 Version:" not in dex_bytes:
                    raise SystemExit(f"ERROR: classes.dex in {apk.name} missing PCSX2 version string!")
                if b"SetupWizardDataDirectoryFragment" not in dex_bytes:
                    raise SystemExit(f"ERROR: classes.dex in {apk.name} missing SetupWizardDataDirectoryFragment!")
                if b"deduplicateEntries" not in dex_bytes:
                    raise SystemExit(f"ERROR: classes.dex in {apk.name} missing deduplicateEntries!")
                if b"https://github.com/mininxd/NetherSX2-patch/releases/latest" not in dex_bytes:
                    raise SystemExit(f"ERROR: classes.dex in {apk.name} missing Check Update releases URL!")
                if b"DiscordRpcManager" not in dex_bytes:
                    raise SystemExit(f"ERROR: classes.dex in {apk.name} missing DiscordRpcManager!")
                if b"GyroToRightStickManager" not in dex_bytes:
                    raise SystemExit(f"ERROR: classes.dex in {apk.name} missing GyroToRightStickManager!")
                if b"ExternalControllerHelper" not in dex_bytes:
                    raise SystemExit(f"ERROR: classes.dex in {apk.name} missing ExternalControllerHelper!")
                if "res/xml/discord_preferences.xml" not in z.namelist():
                    raise SystemExit(f"ERROR: res/xml/discord_preferences.xml missing in {apk.name}!")
                verify_dex_integrity(dex_bytes)
            for item in z.namelist():
                if "menu_main_navigation" in item:
                    menu_data = z.read(item)
                    if b"action_discord_server" in menu_data:
                        raise SystemExit(f"ERROR: action_discord_server still present in {item} of {apk.name}!")
                    if b"action_show_news_updates" in menu_data:
                        raise SystemExit(f"ERROR: action_show_news_updates still present in {item} of {apk.name}!")
                    if b"Check Update" not in menu_data:
                        raise SystemExit(f"ERROR: 'Check Update' missing in {item} of {apk.name}!")
        print(f"✓ {apk.name}: 0.05x, 0.1x, 0.25x (XML + unclamped libemucore.so) & targetSdkVersion 34 verified")

    if NETHERSX2_ADRENO_APK in target_apks or any(apk.name.endswith("_adreno.apk") for apk in target_apks):
        if ADRENO_FINAL_XDELTA.exists() and ADRENO_FINAL_XDELTA.stat().st_size > 0:
            print(f"✓ {ADRENO_FINAL_XDELTA.name} confirmed ({ADRENO_FINAL_XDELTA.stat().st_size} bytes)")
    print("\nAll builds and verifications completed successfully!")


def main() -> None:
    print("\n==========================================")
    print("Building NetherSX2 Patched + PCSX2 (Adreno & Mali)")
    print("==========================================")
    build_nethersx2_adreno()
    build_nethersx2_mali()
    built = [NETHERSX2_ADRENO_APK, NETHERSX2_MALI_APK]
    verify_all(built)


if __name__ == "__main__":
    main()


