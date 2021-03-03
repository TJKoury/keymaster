#!/bin/sh
cd ../../node_modules/flatbuffers
git clean -fxd
sed -i "s/#ifdef FLATBUFFERS_NO_ABSOLUTE_PATH_RESOLUTION/#if 1/" src/util.cpp
sed -i "s/mkdir.*;/return;/" src/util.cpp

emmake cmake .  -DFLATBUFFERS_NO_ABSOLUTE_PATH_RESOLUTION=ON \
                -DFLATBUFFERS_BUILD_LEGACY=OFF \
                -DFLATBUFFERS_BUILD_SHAREDLIB=OFF \
                -DCMAKE_CXX_EXTENSIONS=OFF \
                -DBUILD_SHARED_LIBS=ON \
                -DCMAKE_CXX_FLAGS="-I./include -fPIC -std=c++11 -O3 -s SINGLE_FILE -s EXPORT_ES6=1 -s LINKABLE=1 -s EXPORT_ALL=1 -v -g -Qunused-arguments -fno-exceptions"

emmake make

#emcc -s SINGLE_FILE -s EXPORT_ES6=1 -s  LLD_REPORT_UNDEFINED -I./include ./src/flatc_main.cpp -o flatbuffers.mjs
mkdir -p ../../lib/flatbuffers
cp flatc ../../lib/flatbuffers/flatbuffers.mjs
#cp flatc.wasm ../../lib/flatbuffers/flatc.wasm
#cp flathash.wasm ../../lib/flatbuffers/flathash.wasm