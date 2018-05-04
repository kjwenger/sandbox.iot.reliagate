cmake_minimum_required(VERSION 3.7)
set(CMAKE_EXE_LINKER_FLAGS "-static")
add_executable(hello-world
        main.cpp
)
target_link_libraries(hello-world -static-libgcc -static-libstdc++)
