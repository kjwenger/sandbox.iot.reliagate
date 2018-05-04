cmake_minimum_required(VERSION 3.6)
include(Paths)
include(ExternalProject)
ExternalProject_Add(
        cumulocity-agent-linux
        GIT_REPOSITORY https://kjwenger@bitbucket.org/m2m/cumulocity-agent-linux.git
        UPDATE_COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/init.mk <SOURCE_DIR>
        BUILD_IN_SOURCE 1
        BUILD_COMMAND make CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} SYSROOT=${CMAKE_PREFIX_PATH}
        CONFIGURE_COMMAND cp Makefile.template Makefile
        INSTALL_COMMAND cp <SOURCE_DIR>/lib/libsera.so <SOURCE_DIR>/lib/libsera.so.1 <SOURCE_DIR>/lib/libsera.so.1.2.2 ${CMAKE_INSTALL_PREFIX}/lib
)
add_dependencies(cumulocity-agent-linux curl)
add_dependencies(cumulocity-agent-linux lua)
