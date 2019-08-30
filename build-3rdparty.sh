#!/bin/bash

set -x

export LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH"

NEBULA_HOME=/home/nebula

cd $NEBULA_HOME/nebula-3rdparty
/home/engshare/cmake/bin/cmake -DCMAKE_C_COMPILER=/home/engshare/gcc/bin/gcc -DCMAKE_CXX_COMPILER=/home/engshare/gcc/bin/g++ -DNEBULA_GPERF_BIN_DIR=/home/engshare/gperf/bin -DNEBULA_FLEX_ROOT=/home/engshare/flex -DNEBULA_BOOST_ROOT=/home/engshare/boost -DNEBULA_OPENSSL_ROOT=/home/engshare/openssl -DNEBULA_KRB5_ROOT=/home/engshare/krb5 -DNEBULA_LIBUNWIND_ROOT=/home/engshare/libunwind -DNEBULA_READLINE_ROOT=/home/engshare/readline -DNEBULA_NCURSES_ROOT=/home/engshare/ncurses .
make
make install
cd $NEBULA_HOME
rm -rf $NEBULA_HOME/nebula-3rdparty
