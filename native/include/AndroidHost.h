#pragma once

#include <jni.h>
#include <android/log.h>
#include <string>
#include <string_view>
#include <vector>
#include <mutex>
#include <memory>

#define LOG_TAG "libemucore"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

class AndroidHost {
public:
    static AndroidHost& GetInstance();

    void Initialize(JNIEnv* env, jobject context, const std::string& data_dir, const std::string& cache_dir);
    void Shutdown();

    // OSD and notifications
    void AddOSDMessage(const std::string& message, float duration = 2.0f);
    void AddKeyedOSDMessage(const std::string& key, const std::string& message, float duration = 2.0f);
    void ReportError(const std::string_view title, const std::string_view message);
    void ReportInfo(const std::string_view title, const std::string_view message);

    // Settings retrieval
    bool GetBoolSetting(const std::string& section, const std::string& key, bool default_val);
    int GetIntSetting(const std::string& section, const std::string& key, int default_val);
    float GetFloatSetting(const std::string& section, const std::string& key, float default_val);
    std::string GetStringSetting(const std::string& section, const std::string& key, const std::string& default_val);

    void SetBoolSetting(const std::string& section, const std::string& key, bool val);
    void SetIntSetting(const std::string& section, const std::string& key, int val);

    // Paths
    const std::string& GetDataDir() const { return m_data_dir; }
    const std::string& GetCacheDir() const { return m_cache_dir; }

private:
    AndroidHost() = default;
    ~AndroidHost() = default;

    std::string m_data_dir;
    std::string m_cache_dir;
    std::mutex m_mutex;
};
