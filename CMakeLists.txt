cmake_minimum_required(VERSION 3.6)
project(sandbox-iot-reliagate VERSION 0.0.1 LANGUAGES C;CXX)
include("${CMAKE_SOURCE_DIR}/cmake/Paths.cmake")
enable_testing()
add_subdirectory(lib)
add_subdirectory(app)
