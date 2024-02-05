file(GLOB ALGOHOL_HEADERS
        ./*.h
)

file(GLOB ALGOHOL_SOURCES
        ./*.cpp
)

add_library(Algohol STATIC "${ALGOHOL_HEADERS}" "${ALGOHOL_SOURCES}")
