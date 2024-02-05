file(GLOB COMMON_HEADERS
        ./*.h
)

file(GLOB COMMON_SOURCES
        ./*.cpp
)

add_library(common STATIC "${COMMON_HEADERS}" "${COMMON_SOURCES}")
