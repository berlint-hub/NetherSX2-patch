#pragma once

#include <jni.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <string>

#ifdef __cplusplus
extern "C" {
#endif

// ============================================================================
// Lifecycle & VM Thread Management
// ============================================================================
JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_initialize(
    JNIEnv* env, jclass clazz, jobject context, jstring data_dir, jstring cache_dir, jstring external_dir);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_runVMThread(
    JNIEnv* env, jclass clazz, jobject context, jstring boot_path, jstring elf_path);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_stopVMThreadLoop(
    JNIEnv* env, jclass clazz, jboolean wait_for_shutdown);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_pauseVM(
    JNIEnv* env, jclass clazz, jboolean paused);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_isVMPaused(
    JNIEnv* env, jclass clazz);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_resetVM(
    JNIEnv* env, jclass clazz);

// ============================================================================
// Version & Driver Information
// ============================================================================
JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getFullScmVersion(
    JNIEnv* env, jclass clazz);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getScmVersion(
    JNIEnv* env, jclass clazz);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getDriverInfo(
    JNIEnv* env, jclass clazz);

// ============================================================================
// Surface & Rendering Management
// ============================================================================
JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_changeSurface(
    JNIEnv* env, jclass clazz, jobject surface, jint width, jint height, jfloat scale);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_hasValidRenderSurface(
    JNIEnv* env, jclass clazz);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setDisplayAlignment(
    JNIEnv* env, jclass clazz, jint alignment);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_toggleSoftwareRenderer(
    JNIEnv* env, jclass clazz);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_toggleLimiterMode(
    JNIEnv* env, jclass clazz, jint mode);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_saveSingleFrameGSDump(
    JNIEnv* env, jclass clazz);

// ============================================================================
// Media, BIOS & Game List
// ============================================================================
JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_changeDisc(
    JNIEnv* env, jclass clazz, jstring path);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_isBIOSAvailable(
    JNIEnv* env, jclass clazz);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getBIOSDescription(
    JNIEnv* env, jclass clazz, jstring path);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getGameListEntries(
    JNIEnv* env, jclass clazz);

JNIEXPORT jobject JNICALL Java_xyz_aethersx2_android_NativeLibrary_getGameListEntry(
    JNIEnv* env, jclass clazz, jstring path);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_lookupGameNameBySerial(
    JNIEnv* env, jclass clazz, jstring serial);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getPathForSerialAndCRC(
    JNIEnv* env, jclass clazz, jstring serial, jint crc);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_refreshGameList(
    JNIEnv* env, jclass clazz, jboolean scan_crc, jboolean fast_scan, jobject callback);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_downloadCovers(
    JNIEnv* env, jclass clazz, jobjectArray serials, jobject callback);

// ============================================================================
// Input & Controller Handling
// ============================================================================
JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_handleControllerAxisEvent(
    JNIEnv* env, jclass clazz, jint controller, jint axis, jfloat value);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_handleControllerButtonEvent(
    JNIEnv* env, jclass clazz, jint controller, jint button, jboolean pressed);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_handlePointerEvent(
    JNIEnv* env, jclass clazz, jint action, jfloat x, jfloat y);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_handleAccelerometerUpdate(
    JNIEnv* env, jclass clazz, jfloat x, jfloat y, jfloat z);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setPadValue(
    JNIEnv* env, jclass clazz, jint port, jint button, jfloat value);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setPadMacroState(
    JNIEnv* env, jclass clazz, jint port, jint macro, jboolean active);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_hasAnyBindingsForControllerButton(
    JNIEnv* env, jclass clazz, jint controller, jint button);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getPadBinds(
    JNIEnv* env, jclass clazz, jstring profile, jboolean default_only);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getPadSettings(
    JNIEnv* env, jclass clazz, jstring profile);

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getPadVibrationCapabilities(
    JNIEnv* env, jclass clazz, jstring profile);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setDefaultPadSettings(
    JNIEnv* env, jclass clazz);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setInputDevices(
    JNIEnv* env, jclass clazz, jobjectArray devices);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getHotkeyInfoList(
    JNIEnv* env, jclass clazz);

// ============================================================================
// Settings Management
// ============================================================================
JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_applySettings(
    JNIEnv* env, jclass clazz);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_reloadGameSettings(
    JNIEnv* env, jclass clazz);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_reloadPatches(
    JNIEnv* env, jclass clazz);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setDefaultSettings(
    JNIEnv* env, jclass clazz, jboolean fast_boot);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_setDefaultSettingsForGame(
    JNIEnv* env, jclass clazz, jstring serial, jboolean fast_boot);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_getBooleanSettingValue(
    JNIEnv* env, jclass clazz, jstring section, jstring key, jboolean default_value);

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getIntSettingValue(
    JNIEnv* env, jclass clazz, jstring section, jstring key, jint default_value);

JNIEXPORT jfloat JNICALL Java_xyz_aethersx2_android_NativeLibrary_getFloatSettingValue(
    JNIEnv* env, jclass clazz, jstring section, jstring key, jfloat default_value);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getStringSettingValue(
    JNIEnv* env, jclass clazz, jstring section, jstring key, jstring default_value);

// ============================================================================
// Save States & Memory Cards
// ============================================================================
JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_loadStateSlot(
    JNIEnv* env, jclass clazz, jint slot);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_saveStateSlot(
    JNIEnv* env, jclass clazz, jint slot);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_waitForSaveStateFlush(
    JNIEnv* env, jclass clazz);

JNIEXPORT jobject JNICALL Java_xyz_aethersx2_android_NativeLibrary_readSaveStateScreenshot(
    JNIEnv* env, jclass clazz, jstring path);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getAvailableMemoryCards(
    JNIEnv* env, jclass clazz, jboolean formatted_only);

JNIEXPORT jobject JNICALL Java_xyz_aethersx2_android_NativeLibrary_getMemoryCardInfo(
    JNIEnv* env, jclass clazz, jstring path);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_createMemoryCard(
    JNIEnv* env, jclass clazz, jstring path, jint size_mb, jint type);

// ============================================================================
// RetroAchievements (Cheevos)
// ============================================================================
JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_cheevosLogin(
    JNIEnv* env, jclass clazz, jstring username, jstring token);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_cheevosLogout(
    JNIEnv* env, jclass clazz);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_isCheevosActive(
    JNIEnv* env, jclass clazz);

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_isCheevosChallengeModeActive(
    JNIEnv* env, jclass clazz);

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoCount(
    JNIEnv* env, jclass clazz);

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUnlockedCheevoCount(
    JNIEnv* env, jclass clazz);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoList(
    JNIEnv* env, jclass clazz);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoGameTitle(
    JNIEnv* env, jclass clazz);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoGameIconPath(
    JNIEnv* env, jclass clazz);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoBadgeURL(
    JNIEnv* env, jclass clazz, jint badge_id);

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoPointsForGame(
    JNIEnv* env, jclass clazz);

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoMaximumPointsForGame(
    JNIEnv* env, jclass clazz);

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getLeaderboardCount(
    JNIEnv* env, jclass clazz);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getLeaderboardList(
    JNIEnv* env, jclass clazz);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getLeaderboardEntryList(
    JNIEnv* env, jclass clazz, jint id);

// ============================================================================
// OSD & USB
// ============================================================================
JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_addOSDMessage(
    JNIEnv* env, jclass clazz, jstring message, jfloat duration);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_addKeyedOSDMessage(
    JNIEnv* env, jclass clazz, jstring key, jstring message, jfloat duration);

JNIEXPORT jlong JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCurrentSessionTime(
    JNIEnv* env, jclass clazz);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceNames(
    JNIEnv* env, jclass clazz, jboolean connected_only);

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceDisplayName(
    JNIEnv* env, jclass clazz, jstring device);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceSubtypes(
    JNIEnv* env, jclass clazz, jstring device);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceSettings(
    JNIEnv* env, jclass clazz, jstring device, jint subtype);

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceBinds(
    JNIEnv* env, jclass clazz, jstring device, jint subtype, jboolean default_only);

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setUSBDeviceBind(
    JNIEnv* env, jclass clazz, jint device, jint bind, jfloat value);

#ifdef __cplusplus
}
#endif
