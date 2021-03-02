#!/bin/sh
cd ../../node_modules/flatbuffers
git clean -fxd
sed -i "s/#ifdef FLATBUFFERS_NO_ABSOLUTE_PATH_RESOLUTION/#if 1/" src/util.cpp
sed -i "s/mkdir.*;/return;/" src/util.cpp

emmake cmake .  -DFLATBUFFERS_NO_ABSOLUTE_PATH_RESOLUTION=ON \
                -DFLATBUFFERS_BUILD_LEGACY=OFF \
                -DFLATBUFFERS_BUILD_SHAREDLIB=OFF \
                -DCMAKE_CXX_EXTENSIONS=OFF \
                -DCMAKE_CXX_FLAGS="-s RELOCATABLE=1 -v -g -Qunused-arguments -fno-exceptions"
emmake make -j 4

emcc -s LLD_REPORT_UNDEFINED -s SINGLE_FILE -s EXPORT_ES6=1 -I./include ./src/flatc_main.cpp -o flatbuffers.js
mkdir -p ../../lib/flatbuffers
cp flatbuffers.js ../../lib/flatbuffers
#cp flatc.wasm ../../lib/flatbuffers/flatc.wasm
#cp flathash.wasm ../../lib/flatbuffers/flathash.wasm