#!/bin/sh

set -ex

NEBULA_HOME=$1
INSTALL_PATH=$2
PROFILE_PATH=$3

EXTRA_CXXFLAGS="-O2 -m64 -march=x86-64"
EXTRA_PIC_CXXFLAGS="${EXTRA_CXXFLAGS} -fPIC -DPIC"
EXTRA_LDFLAGS="-static-libgcc -static-libstdc++"

. ${PROFILE_PATH}

# Install openssl-1.1.0h
wget -qO - https://www.openssl.org/source/old/1.1.0/openssl-1.1.0h.tar.gz | tar zxf - -C ${NEBULA_HOME}
cd ${NEBULA_HOME}/openssl-1.1.0h
./config --prefix=${INSTALL_PATH} --openssldir=${INSTALL_PATH}/ssl no-shared threads ${EXTRA_CXXFLAGS} ${EXTRA_LDFLAGS}
make -j $(nproc) && make install

# Install cmake-3.11.4
wget -qO - https://github.com/Kitware/CMake/releases/download/v3.11.4/cmake-3.11.4.tar.gz | tar zxf - -C ${NEBULA_HOME}
cd ${NEBULA_HOME}/cmake-3.11.4
CXXFLAGS=${EXTRA_PIC_CXXFLAGS} CFLAGS=$CXXFLAGS CPPFLAGS=$CXXFLAGS LDFLAGS="${EXTRA_LDFLAGS} -pthread" ./configure --prefix=${INSTALL_PATH}
make -j $(nproc) && make install

# Install bison-3.0.5
wget -qO - http://ftp.gnu.org/gnu/bison/bison-3.0.5.tar.gz | tar zxf - -C ${NEBULA_HOME}
cd ${NEBULA_HOME}/bison-3.0.5
CXXFLAGS=${EXTRA_PIC_CXXFLAGS} CFLAGS=$CXXFLAGS CPPFLAGS=$CXXFLAGS LDFLAGS=${EXTRA_LDFLAGS} ./configure --prefix=${INSTALL_PATH} --enable-shared=no --enable-static
make -j $(nproc) && make install

# Install flex-2.6.4
wget -qO - https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz | tar zxf - -C ${NEBULA_HOME}
cd ${NEBULA_HOME}/flex-2.6.4
CXXFLAGS=${EXTRA_PIC_CXXFLAGS} CFLAGS=$CXXFLAGS CPPFLAGS=$CXXFLAGS LDFLAGS=${EXTRA_LDFLAGS} ./configure --prefix=${INSTALL_PATH} --enable-shared=no
make -j $(nproc) && make install

# Install boost-1.66
wget -qO - https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.gz | tar zxf - -C ${NEBULA_HOME}
cd ${NEBULA_HOME}/boost_1_66_0
./bootstrap.sh --prefix=${INSTALL_PATH} --without-icu --without-libraries=python
./b2 cxxflags=${EXTRA_CXXFLAGS} link=static runtime-link=static install
./b2 --clean-all

# Install gperf-3.1
wget -qO - http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz | tar zxf - -C ${NEBULA_HOME}
cd ${NEBULA_HOME}/gperf-3.1
CXXFLAGS=${EXTRA_PIC_CXXFLAGS} CFLAGS=$CXXFLAGS CPPFLAGS=$CXXFLAGS LDFLAGS=${EXTRA_LDFLAGS} ./configure --prefix=${INSTALL_PATH} --enable-shared=no
make -j $(nproc) && make install

# Install krb5-1.16.3, depends on bison
wget -qO - https://github.com/krb5/krb5/archive/krb5-1.16.3-final.tar.gz | tar zxf - -C ${NEBULA_HOME}
cd ${NEBULA_HOME}/krb5-krb5-1.16.3-final/src
autoreconf
CXXFLAGS=$EXTRA_PIC_CXXFLAGS CFLAGS=$CXXFLAGS CPPFLAGS=$CXXFLAGS LDFLAGS=${EXTRA_LDFLAGS} ./configure --prefix=${INSTALL_PATH} --enable-static --disable-shared --disable-rpath --disable-aesni --disable-thread-support
make -j $(nproc) all && make install

# Install libunwind-1.2.1
wget -qO - https://github.com/libunwind/libunwind/releases/download/v1.2.1/libunwind-1.2.1.tar.gz | tar zxf - -C ${NEBULA_HOME}
cd ${NEBULA_HOME}/libunwind-1.2.1
CXXFLAGS=${EXTRA_PIC_CXXFLAGS} CFLAGS=$CXXFLAGS CPPFLAGS=$CXXFLAGS LDFLAGS=${EXTRA_LDFLAGS} ./configure --prefix=${INSTALL_PATH} --enable-shared=no
make -j $(nproc) && make install

# Cleanup
cd ${NEBULA_HOME}
rm -rf *
