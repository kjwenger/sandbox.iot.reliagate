cmake_minimum_required(VERSION 3.6)
include(Paths)
include(ExternalProject)
ExternalProject_Add(
        cumulocity-sdk-c
        GIT_REPOSITORY https://kjwenger@bitbucket.org/m2m/cumulocity-sdk-c.git
        UPDATE_COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/init.mk <SOURCE_DIR>
        BUILD_IN_SOURCE 1
        BUILD_COMMAND make CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} SYSROOT=${CMAKE_PREFIX_PATH}
        CONFIGURE_COMMAND cp Makefile.template Makefile
        INSTALL_COMMAND find <SOURCE_DIR>/lib -name * | xargs -I{} cp -R {} ${CMAKE_INSTALL_PREFIX}/lib && find <SOURCE_DIR>/include -name * | xargs -I{} cp -R {} ${CMAKE_INSTALL_PREFIX}/include
)
add_dependencies(cumulocity-sdk-c curl)
add_dependencies(cumulocity-sdk-c lua)
