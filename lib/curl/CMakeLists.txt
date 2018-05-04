cmake_minimum_required(VERSION 3.6)
include(Paths)
include(ExternalProject)
ExternalProject_Add(
        curl
        GIT_REPOSITORY https://github.com/curl/curl.git
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ./buildconf && ./configure --host=${MULTIARCH_TUPLE} --target=${MULTIARCH_TUPLE} --prefix=${CMAKE_INSTALL_PREFIX}
        INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
        INSTALL_COMMAND make install
)
