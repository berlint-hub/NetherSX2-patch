#include "AndroidSurface.h"
#include "AndroidHost.h"

AndroidSurface& AndroidSurface::GetInstance() {
    static AndroidSurface s_instance;
    return s_instance;
}

AndroidSurface::~AndroidSurface() {
    ReleaseSurface();
}

void AndroidSurface::UpdateSurface(JNIEnv* env, jobject surface, int width, int height, float scale) {
    std::lock_guard<std::mutex> lock(m_mutex);

    if (m_window) {
        ANativeWindow_release(m_window);
        m_window = nullptr;
    }

    m_width = width;
    m_height = height;
    m_scale = scale;

    if (surface) {
        m_window = ANativeWindow_fromSurface(env, surface);
        LOGI("AndroidSurface: Window created from surface %p (%dx%d, scale=%.2f, window=%p)",
             surface, width, height, scale, m_window);
    } else {
        LOGI("AndroidSurface: Surface cleared");
    }
}

void AndroidSurface::ReleaseSurface() {
    std::lock_guard<std::mutex> lock(m_mutex);
    if (m_window) {
        ANativeWindow_release(m_window);
        m_window = nullptr;
        LOGI("AndroidSurface: Window released");
    }
}

bool AndroidSurface::HasValidSurface() {
    std::lock_guard<std::mutex> lock(m_mutex);
    return (m_window != nullptr);
}

ANativeWindow* AndroidSurface::GetWindow() {
    std::lock_guard<std::mutex> lock(m_mutex);
    return m_window;
}

void AndroidSurface::SetDisplayAlignment(int alignment) {
    std::lock_guard<std::mutex> lock(m_mutex);
    m_alignment = alignment;
    LOGI("AndroidSurface: Display alignment set to %d", alignment);
}
