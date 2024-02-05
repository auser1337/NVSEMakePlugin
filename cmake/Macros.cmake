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
endmacro()
