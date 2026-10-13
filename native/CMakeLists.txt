cmake_minimum_required(VERSION 3.22.1)
project(emucore LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Optimization & warnings flags
add_compile_options(
    -O3
    -ffast-math
    -funroll-loops
    -fvisibility=hidden
    -Wno-unused-parameter
    -Wno-unused-variable
)

# Paths
set(PCSX2_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/../pcsx2)

# Include directories
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${PCSX2_ROOT}/pcsx2
    ${PCSX2_ROOT}/common
    ${PCSX2_ROOT}/3rdparty
)

# Sources
set(EMUCORE_SOURCES
    src/NativeLibrary.cpp
    src/AndroidHost.cpp
    src/AndroidSurface.cpp
)

# Build libemucore.so
add_library(emucore SHARED ${EMUCORE_SOURCES})

# Target properties
set_target_properties(emucore PROPERTIES
    OUTPUT_NAME "emucore"
    PREFIX "lib"
    SUFFIX ".so"
)

# Link against Android NDK system libraries
target_link_libraries(emucore PRIVATE
    android
    log
    vulkan
    jnigraphics
)
