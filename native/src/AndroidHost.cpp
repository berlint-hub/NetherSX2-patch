#include "AndroidHost.h"

#include <unordered_map>

namespace {
std::unordered_map<std::string, std::string> s_in_memory_settings;
}

AndroidHost& AndroidHost::GetInstance() {
    static AndroidHost s_instance;
    return s_instance;
}

void AndroidHost::Initialize(JNIEnv*, jobject, const std::string& data_dir, const std::string& cache_dir) {
    std::lock_guard<std::mutex> lock(m_mutex);
    m_data_dir = data_dir;
    m_cache_dir = cache_dir;
    LOGI("AndroidHost initialized: data_dir=%s cache_dir=%s", m_data_dir.c_str(), m_cache_dir.c_str());
}

void AndroidHost::Shutdown() {
    std::lock_guard<std::mutex> lock(m_mutex);
    LOGI("AndroidHost shutdown complete");
}

void AndroidHost::AddOSDMessage(const std::string& message, float duration) {
    LOGI("AndroidHost OSD (%.1fs): %s", duration, message.c_str());
}

void AndroidHost::AddKeyedOSDMessage(const std::string& key, const std::string& message, float duration) {
    LOGI("AndroidHost Keyed OSD [%s] (%.1fs): %s", key.c_str(), duration, message.c_str());
}

void AndroidHost::ReportError(const std::string_view title, const std::string_view message) {
    LOGE("AndroidHost Error [%.*s]: %.*s", (int)title.length(), title.data(), (int)message.length(), message.data());
}

void AndroidHost::ReportInfo(const std::string_view title, const std::string_view message) {
    LOGI("AndroidHost Info [%.*s]: %.*s", (int)title.length(), title.data(), (int)message.length(), message.data());
}

bool AndroidHost::GetBoolSetting(const std::string& section, const std::string& key, bool default_val) {
    std::lock_guard<std::mutex> lock(m_mutex);
    std::string full_key = section + "/" + key;
    auto it = s_in_memory_settings.find(full_key);
    if (it != s_in_memory_settings.end()) {
        return (it->second == "true" || it->second == "1");
    }
    return default_val;
}

int AndroidHost::GetIntSetting(const std::string& section, const std::string& key, int default_val) {
    std::lock_guard<std::mutex> lock(m_mutex);
    std::string full_key = section + "/" + key;
    auto it = s_in_memory_settings.find(full_key);
    if (it != s_in_memory_settings.end()) {
        try { return std::stoi(it->second); } catch (...) {}
    }
    return default_val;
}

float AndroidHost::GetFloatSetting(const std::string& section, const std::string& key, float default_val) {
    std::lock_guard<std::mutex> lock(m_mutex);
    std::string full_key = section + "/" + key;
    auto it = s_in_memory_settings.find(full_key);
    if (it != s_in_memory_settings.end()) {
        try { return std::stof(it->second); } catch (...) {}
    }
    return default_val;
}

std::string AndroidHost::GetStringSetting(const std::string& section, const std::string& key, const std::string& default_val) {
    std::lock_guard<std::mutex> lock(m_mutex);
    std::string full_key = section + "/" + key;
    auto it = s_in_memory_settings.find(full_key);
    if (it != s_in_memory_settings.end()) {
        return it->second;
    }
    return default_val;
}

void AndroidHost::SetBoolSetting(const std::string& section, const std::string& key, bool val) {
    std::lock_guard<std::mutex> lock(m_mutex);
    s_in_memory_settings[section + "/" + key] = val ? "true" : "false";
}

void AndroidHost::SetIntSetting(const std::string& section, const std::string& key, int val) {
    std::lock_guard<std::mutex> lock(m_mutex);
    s_in_memory_settings[section + "/" + key] = std::to_string(val);
}
