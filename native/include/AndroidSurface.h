#pragma once

#include <jni.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <mutex>

class AndroidSurface {
public:
    static AndroidSurface& GetInstance();

    void UpdateSurface(JNIEnv* env, jobject surface, int width, int height, float scale);
    void ReleaseSurface();
    bool HasValidSurface();

    ANativeWindow* GetWindow();
    int GetWidth() const { return m_width; }
    int GetHeight() const { return m_height; }
    float GetScale() const { return m_scale; }

    void SetDisplayAlignment(int alignment);
    int GetDisplayAlignment() const { return m_alignment; }

private:
    AndroidSurface() = default;
    ~AndroidSurface();

    ANativeWindow* m_window = nullptr;
    int m_width = 0;
    int m_height = 0;
    float m_scale = 1.0f;
    int m_alignment = 0;
    std::mutex m_mutex;
};
