CPPFLAGS:=-I${SYSROOT}/include -I../include
CXXFLAGS:=-std=c++11 -Wall -pedantic -Wextra
LDFLAGS:=-L${SYSROOT}/lib
LDLIBS:=-lcurl -llua
SR_PLUGIN_LUA:=1
PKG_CONFIG_PATH:=${SYSROOT}/lib/pkgconfig
