set(PLUGIN_HEADERS
)

set(PLUGIN_SOURCES
        main.cpp
)

add_library("${PROJECT_NAME}" SHARED "${PLUGIN_HEADERS}" "${PLUGIN_SOURCES}")

include("${PROJECT_SOURCE_DIR}/cmake/Macros.cmake")

target_add_nvse("${PROJECT_NAME}")
