cmake_minimum_required(VERSION 3.26.4)

project(
        NVSEMake
        LANGUAGES CXX
        VERSION 1
)

set(CMAKE_CXX_STANDARD 20)

add_compile_options(
        /FI "${PROJECT_SOURCE_DIR}/nvse/nvse/prefix.h"
)

include_directories(nvse)

add_subdirectory(nvse/common)

add_subdirectory(nvse/Algohol)

add_subdirectory(nvse/nvse)
