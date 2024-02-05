macro(target_add_nvse target)
    target_compile_options("${target}" PRIVATE
            /FI "${PROJECT_SOURCE_DIR}/extern/NVSE/nvse/nvse/prefix.h"
    )

    target_include_directories("${target}" PRIVATE "${PROJECT_SOURCE_DIR}/extern/NVSE/nvse")

    target_link_libraries("${target}" PRIVATE nvse)

    if ("${COPY_DLL}")
        add_custom_command(TARGET "${target}" POST_BUILD
                COMMAND "${CMAKE_COMMAND}" -E copy $<TARGET_FILE:${target}> "$ENV{FalloutNVPath}/Data/NVSE/Plugins"
        )
    endif ()

    if ("${RUNTIME}")
        message(STATUS "Got runtime, adding suitable definitions.")

        target_compile_definitions("${target}" PRIVATE WIN32 NDEBUG _WINDOWS _USRDLL RUNTIME RUNTIME_VERSION=0x040020D0)
    else ()
        message(STATUS "Got editor, adding suitable definitions.")

        target_compile_definitions("${target}" PRIVATE WIN32 NDEBUG _WINDOWS _USRDLL EDITOR EDITOR_VERSION=0x04002060)
    endif ()
endmacro()
