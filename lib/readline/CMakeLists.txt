cmake_minimum_required(VERSION 3.6)
include(Paths)
include(ExternalProject)
ExternalProject_Add(
        readline
        GIT_REPOSITORY https://git.savannah.gnu.org/git/readline.git
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ./configure --enable-languages=c++ --enable-static --disable-test --host=${MULTIARCH_TUPLE} --target=${MULTIARCH_TUPLE} --prefix=${CMAKE_INSTALL_PREFIX}
        INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
)
