cmake_minimum_required(VERSION 3.26.4)

option(COPY_DLL "Should the DLL be copied to FalloutNVPath/Data/NVSE/Plugins?" ON)

set(RUNTIME ON CACHE INTERNAL "Is this plugin being compiled and built for the game and not the editor?" FORCE)

project(
        NVSEMakePlugin
        LANGUAGES CXX
        VERSION 1
)

set(CMAKE_CXX_STANDARD 23)

add_subdirectory(extern/NVSE)

add_subdirectory(src)
