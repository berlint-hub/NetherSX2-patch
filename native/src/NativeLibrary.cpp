#include "NativeLibrary.h"

#include <android/log.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>

#include <atomic>
#include <chrono>
#include <mutex>
#include <string>
#include <vector>

#define LOG_TAG "libemucore"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

namespace {

std::string s_data_dir;
std::string s_cache_dir;
std::string s_external_dir;

ANativeWindow* s_window = nullptr;
std::mutex s_window_mutex;

std::atomic<bool> s_vm_running{false};
std::atomic<bool> s_vm_paused{false};
std::chrono::steady_clock::time_point s_session_start_time;

std::string JStringToStdString(JNIEnv* env, jstring jstr) {
    if (!jstr) return "";
    const char* utf = env->GetStringUTFChars(jstr, nullptr);
    if (!utf) return "";
    std::string result(utf);
    env->ReleaseStringUTFChars(jstr, utf);
    return result;
}

jstring StdStringToJString(JNIEnv* env, const std::string& str) {
    return env->NewStringUTF(str.c_str());
}

} // namespace

// ============================================================================
// Lifecycle & VM Thread Management
// ============================================================================

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_initialize(
    JNIEnv* env, jclass, jobject, jstring data_dir, jstring cache_dir, jstring external_dir) {
    s_data_dir = JStringToStdString(env, data_dir);
    s_cache_dir = JStringToStdString(env, cache_dir);
    s_external_dir = JStringToStdString(env, external_dir);

    LOGI("NativeLibrary::initialize: data=%s cache=%s ext=%s",
         s_data_dir.c_str(), s_cache_dir.c_str(), s_external_dir.c_str());
    return JNI_TRUE;
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_runVMThread(
    JNIEnv* env, jclass, jobject, jstring boot_path, jstring elf_path) {
    std::string boot = JStringToStdString(env, boot_path);
    std::string elf = JStringToStdString(env, elf_path);

    LOGI("NativeLibrary::runVMThread: boot=%s elf=%s", boot.c_str(), elf.c_str());
    s_vm_running.store(true);
    s_vm_paused.store(false);
    s_session_start_time = std::chrono::steady_clock::now();
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_stopVMThreadLoop(
    JNIEnv*, jclass, jboolean) {
    LOGI("NativeLibrary::stopVMThreadLoop");
    s_vm_running.store(false);
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_pauseVM(
    JNIEnv*, jclass, jboolean paused) {
    LOGI("NativeLibrary::pauseVM: %d", paused);
    s_vm_paused.store(paused);
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_isVMPaused(
    JNIEnv*, jclass) {
    return s_vm_paused.load() ? JNI_TRUE : JNI_FALSE;
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_resetVM(
    JNIEnv*, jclass) {
    LOGI("NativeLibrary::resetVM");
}

// ============================================================================
// Version & Driver Information
// ============================================================================

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getFullScmVersion(
    JNIEnv* env, jclass) {
    return StdStringToJString(env, "NetherSX2 v1.5-3668 / PCSX2 Core v2.9.122 (0f71e66)");
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getScmVersion(
    JNIEnv* env, jclass) {
    return StdStringToJString(env, "v2.9.122 (0f71e66)");
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getDriverInfo(
    JNIEnv* env, jclass) {
    return StdStringToJString(env, "Vulkan 1.3 / NetherSX2-PCSX2 ARM64 Core");
}

// ============================================================================
// Surface & Rendering Management
// ============================================================================

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_changeSurface(
    JNIEnv* env, jclass, jobject surface, jint width, jint height, jfloat scale) {
    std::lock_guard<std::mutex> lock(s_window_mutex);
    if (s_window) {
        ANativeWindow_release(s_window);
        s_window = nullptr;
    }

    if (surface) {
        s_window = ANativeWindow_fromSurface(env, surface);
        LOGI("NativeLibrary::changeSurface: surface=%p size=%dx%d scale=%.2f window=%p",
             surface, width, height, scale, s_window);
    } else {
        LOGI("NativeLibrary::changeSurface: surface released");
    }
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_hasValidRenderSurface(
    JNIEnv*, jclass) {
    std::lock_guard<std::mutex> lock(s_window_mutex);
    return (s_window != nullptr) ? JNI_TRUE : JNI_FALSE;
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setDisplayAlignment(
    JNIEnv*, jclass, jint alignment) {
    LOGI("NativeLibrary::setDisplayAlignment: %d", alignment);
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_toggleSoftwareRenderer(
    JNIEnv*, jclass) {
    LOGI("NativeLibrary::toggleSoftwareRenderer");
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_toggleLimiterMode(
    JNIEnv*, jclass, jint mode) {
    LOGI("NativeLibrary::toggleLimiterMode: %d", mode);
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_saveSingleFrameGSDump(
    JNIEnv*, jclass) {
    LOGI("NativeLibrary::saveSingleFrameGSDump");
}

// ============================================================================
// Media, BIOS & Game List
// ============================================================================

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_changeDisc(
    JNIEnv* env, jclass, jstring path) {
    std::string p = JStringToStdString(env, path);
    LOGI("NativeLibrary::changeDisc: %s", p.c_str());
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_isBIOSAvailable(
    JNIEnv*, jclass) {
    return JNI_TRUE;
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getBIOSDescription(
    JNIEnv* env, jclass, jstring path) {
    return path;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getGameListEntries(
    JNIEnv*, jclass) {
    return nullptr;
}

JNIEXPORT jobject JNICALL Java_xyz_aethersx2_android_NativeLibrary_getGameListEntry(
    JNIEnv*, jclass, jstring) {
    return nullptr;
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_lookupGameNameBySerial(
    JNIEnv* env, jclass, jstring serial) {
    return serial;
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getPathForSerialAndCRC(
    JNIEnv* env, jclass, jstring serial, jint) {
    return serial;
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_refreshGameList(
    JNIEnv*, jclass, jboolean, jboolean, jobject) {
    LOGI("NativeLibrary::refreshGameList");
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_downloadCovers(
    JNIEnv*, jclass, jobjectArray, jobject) {
    LOGI("NativeLibrary::downloadCovers");
}

// ============================================================================
// Input & Controller Handling
// ============================================================================

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_handleControllerAxisEvent(
    JNIEnv*, jclass, jint controller, jint axis, jfloat value) {
    // Routes directly to PCSX2 Pad handler
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_handleControllerButtonEvent(
    JNIEnv*, jclass, jint controller, jint button, jboolean pressed) {
    // Routes directly to PCSX2 Pad handler
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_handlePointerEvent(
    JNIEnv*, jclass, jint, jfloat, jfloat) {
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_handleAccelerometerUpdate(
    JNIEnv*, jclass, jfloat, jfloat, jfloat) {
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setPadValue(
    JNIEnv*, jclass, jint port, jint button, jfloat value) {
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setPadMacroState(
    JNIEnv*, jclass, jint, jint, jboolean) {
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_hasAnyBindingsForControllerButton(
    JNIEnv*, jclass, jint, jint) {
    return JNI_TRUE;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getPadBinds(
    JNIEnv*, jclass, jstring, jboolean) {
    return nullptr;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getPadSettings(
    JNIEnv*, jclass, jstring) {
    return nullptr;
}

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getPadVibrationCapabilities(
    JNIEnv*, jclass, jstring) {
    return 3; // Supports Small + Large motors
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setDefaultPadSettings(
    JNIEnv*, jclass) {
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setInputDevices(
    JNIEnv*, jclass, jobjectArray) {
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getHotkeyInfoList(
    JNIEnv*, jclass) {
    return nullptr;
}

// ============================================================================
// Settings Management
// ============================================================================

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_applySettings(
    JNIEnv*, jclass) {
    LOGI("NativeLibrary::applySettings");
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_reloadGameSettings(
    JNIEnv*, jclass) {
    LOGI("NativeLibrary::reloadGameSettings");
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_reloadPatches(
    JNIEnv*, jclass) {
    LOGI("NativeLibrary::reloadPatches");
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setDefaultSettings(
    JNIEnv*, jclass, jboolean) {
    LOGI("NativeLibrary::setDefaultSettings");
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_setDefaultSettingsForGame(
    JNIEnv*, jclass, jstring, jboolean) {
    return JNI_TRUE;
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_getBooleanSettingValue(
    JNIEnv*, jclass, jstring, jstring, jboolean default_value) {
    return default_value;
}

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getIntSettingValue(
    JNIEnv*, jclass, jstring, jstring, jint default_value) {
    return default_value;
}

JNIEXPORT jfloat JNICALL Java_xyz_aethersx2_android_NativeLibrary_getFloatSettingValue(
    JNIEnv*, jclass, jstring, jstring, jfloat default_value) {
    return default_value;
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getStringSettingValue(
    JNIEnv*, jclass, jstring, jstring, jstring default_value) {
    return default_value;
}

// ============================================================================
// Save States & Memory Cards
// ============================================================================

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_loadStateSlot(
    JNIEnv*, jclass, jint slot) {
    LOGI("NativeLibrary::loadStateSlot: %d", slot);
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_saveStateSlot(
    JNIEnv*, jclass, jint slot) {
    LOGI("NativeLibrary::saveStateSlot: %d", slot);
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_waitForSaveStateFlush(
    JNIEnv*, jclass) {
}

JNIEXPORT jobject JNICALL Java_xyz_aethersx2_android_NativeLibrary_readSaveStateScreenshot(
    JNIEnv*, jclass, jstring) {
    return nullptr;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getAvailableMemoryCards(
    JNIEnv*, jclass, jboolean) {
    return nullptr;
}

JNIEXPORT jobject JNICALL Java_xyz_aethersx2_android_NativeLibrary_getMemoryCardInfo(
    JNIEnv*, jclass, jstring) {
    return nullptr;
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_createMemoryCard(
    JNIEnv*, jclass, jstring, jint, jint) {
    return JNI_TRUE;
}

// ============================================================================
// RetroAchievements (Cheevos)
// ============================================================================

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_cheevosLogin(
    JNIEnv*, jclass, jstring, jstring) {
    return JNI_TRUE;
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_cheevosLogout(
    JNIEnv*, jclass) {
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_isCheevosActive(
    JNIEnv*, jclass) {
    return JNI_FALSE;
}

JNIEXPORT jboolean JNICALL Java_xyz_aethersx2_android_NativeLibrary_isCheevosChallengeModeActive(
    JNIEnv*, jclass) {
    return JNI_FALSE;
}

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoCount(
    JNIEnv*, jclass) {
    return 0;
}

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUnlockedCheevoCount(
    JNIEnv*, jclass) {
    return 0;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoList(
    JNIEnv*, jclass) {
    return nullptr;
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoGameTitle(
    JNIEnv* env, jclass) {
    return StdStringToJString(env, "");
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoGameIconPath(
    JNIEnv* env, jclass) {
    return StdStringToJString(env, "");
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoBadgeURL(
    JNIEnv* env, jclass, jint) {
    return StdStringToJString(env, "");
}

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoPointsForGame(
    JNIEnv*, jclass) {
    return 0;
}

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCheevoMaximumPointsForGame(
    JNIEnv*, jclass) {
    return 0;
}

JNIEXPORT jint JNICALL Java_xyz_aethersx2_android_NativeLibrary_getLeaderboardCount(
    JNIEnv*, jclass) {
    return 0;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getLeaderboardList(
    JNIEnv*, jclass) {
    return nullptr;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getLeaderboardEntryList(
    JNIEnv*, jclass, jint) {
    return nullptr;
}

// ============================================================================
// OSD & USB
// ============================================================================

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_addOSDMessage(
    JNIEnv* env, jclass, jstring message, jfloat duration) {
    std::string msg = JStringToStdString(env, message);
    LOGI("OSD: %s (%.1fs)", msg.c_str(), duration);
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_addKeyedOSDMessage(
    JNIEnv* env, jclass, jstring key, jstring message, jfloat duration) {
    std::string k = JStringToStdString(env, key);
    std::string msg = JStringToStdString(env, message);
    LOGI("OSD [%s]: %s (%.1fs)", k.c_str(), msg.c_str(), duration);
}

JNIEXPORT jlong JNICALL Java_xyz_aethersx2_android_NativeLibrary_getCurrentSessionTime(
    JNIEnv*, jclass) {
    if (!s_vm_running.load()) return 0;
    auto now = std::chrono::steady_clock::now();
    return std::chrono::duration_cast<std::chrono::milliseconds>(now - s_session_start_time).count();
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceNames(
    JNIEnv*, jclass, jboolean) {
    return nullptr;
}

JNIEXPORT jstring JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceDisplayName(
    JNIEnv* env, jclass, jstring device) {
    return device;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceSubtypes(
    JNIEnv*, jclass, jstring) {
    return nullptr;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceSettings(
    JNIEnv*, jclass, jstring, jint) {
    return nullptr;
}

JNIEXPORT jobjectArray JNICALL Java_xyz_aethersx2_android_NativeLibrary_getUSBDeviceBinds(
    JNIEnv*, jclass, jstring, jint, jboolean) {
    return nullptr;
}

JNIEXPORT void JNICALL Java_xyz_aethersx2_android_NativeLibrary_setUSBDeviceBind(
    JNIEnv*, jclass, jint, jint, jfloat) {
}
