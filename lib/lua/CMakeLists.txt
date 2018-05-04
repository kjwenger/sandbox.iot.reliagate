cmake_minimum_required(VERSION 3.6)
include(Paths)
include(ExternalProject)
ExternalProject_Add(
        lua
        URL https://www.lua.org/ftp/lua-5.3.4.tar.gz
        BUILD_IN_SOURCE 1
        BUILD_COMMAND make -j CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} INSTALL_TOP=${CMAKE_INSTALL_PREFIX} posix
        CONFIGURE_COMMAND ls -l
        INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
        INSTALL_COMMAND make INSTALL_TOP=${CMAKE_INSTALL_PREFIX} install
)
add_dependencies(lua curl)
add_dependencies(lua readline)
