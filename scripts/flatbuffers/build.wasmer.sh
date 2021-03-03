#!/bin/sh
cd ../../node_modules/flatbuffers
git clean -fxd
sed -i "s/#ifdef FLATBUFFERS_NO_ABSOLUTE_PATH_RESOLUTION/#if 1/" src/util.cpp
sed -i "s/mkdir.*;/return;/" src/util.cpp
~/.wasienv/bin/wasimake cmake . -DFLATBUFFERS_NO_ABSOLUTE_PATH_RESOLUTION=ON\
                 -DFLATBUFFERS_BUILD_LEGACY=OFF \
                 -DFLATBUFFERS_BUILD_SHAREDLIB=OFF  \
                 -DCMAKE_CXX_EXTENSIONS=OFF \
                 -DCMAKE_CXX_FLAGS="-v -g -Qunused-arguments -fno-exceptions"
~/.wasienv/bin/wasimake make -j 4
cp flatc.wasm ../../lib/flatbuffers/flatc.wasm
cp flathash.wasm ../../lib/flatbuffers/flathash.wasm
