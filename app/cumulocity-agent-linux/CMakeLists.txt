cmake_minimum_required(VERSION 3.6)
include(Paths)
include(ExternalProject)
set(ENV{CXXFLAGS} $ENV{CXXFLAGS} -std=c++11 -I${CMAKE_PREFIX_PATH}/include -I$ENV{SYSROOT}/include)
set(ENV{LIBRARY_PATH} $ENV{LIBRARY_PATH}:${CMAKE_PREFIX_PATH}/lib:$ENV{SYSROOT}/lib:./lib)
set(ENV{EXTRA_LINK_DIRECTORY} $ENV{EXTRA_LINK_DIRECTORY}:${CMAKE_PREFIX_PATH}/lib:$ENV{SYSROOT}/lib:./lib)
set(ENV{LDFLAGS} $ENV{LDFLAGS} -L${CMAKE_PREFIX_PATH}/lib -L$ENV{SYSROOT}/lib -L./lib)
set(ENV{LDLIBS} $ENV{LDLIBS} -lsera -llua -lreadline -lcurl -pthread)
set(ENV{LD_DEBUG} $ENV{LD_DEBUG} "all cat")
ExternalProject_Add(
        cumulocity-agent-linux
        GIT_REPOSITORY https://bitbucket.org/m2m/cumulocity-agents-linux.git
        CONFIGURE_COMMAND :
        BUILD_IN_SOURCE 1
        BUILD_COMMAND make VERBOSE=1 release C8Y_LIB_PATH=${CMAKE_PREFIX_PATH}
)
add_dependencies(cumulocity-agent-linux curl)
add_dependencies(cumulocity-agent-linux lua)
add_dependencies(cumulocity-agent-linux cumulocity-sdk-c)
