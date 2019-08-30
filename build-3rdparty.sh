#!/bin/bash

set -x

git lfs install
git clone https://github.com/vesoft-inc/nebula-3rdparty.git
cd nebula-3rdparty
source ~/.bashrc
cmake .
make
make install
cd ..
rm -rf nebula-3rdparty
