echo "=== install deps ==="
brew install emscripten

src="libjxl-main"

echo "=== checkout libjxl ==="
git clone --depth 1 --recurse-submodules https://github.com/libjxl/libjxl.git $src

echo "=== build libjxl ==="
rm -rf $src-macos
mkdir $src-macos
cd $src-macos
cmake ../$src \
    -D CMAKE_SYSTEM_NAME=Darwin \
    -D CMAKE_OSX_ARCHITECTURES=arm64 \
\
    -D CMAKE_BUILD_TYPE=Release \
    -D JPEGXL_STATIC=OFF \
    -D JPEGXL_ENABLE_TOOLS=ON \
\
    -D BROTLI_BUNDLED_MODE=OFF \
    -D BUILD_TESTING=OFF \
    -D BUILD_SHARED_LIBS=OFF \
    -D JPEGXL_ENABLE_DEVTOOLS=OFF \
    -D JPEGXL_ENABLE_DOXYGEN=OFF \
    -D JPEGXL_ENABLE_MANPAGES=OFF \
    -D JPEGXL_ENABLE_BENCHMARK=OFF \
    -D JPEGXL_ENABLE_EXAMPLES=OFF \
    -D JPEGXL_ENABLE_JNI=OFF \
    -D SJPEG_ENABLE_SIMD=OFF \
    -D JPEGXL_ENABLE_PLUGINS=OFF \
    -D BUILD_SHARED_LIBS=OFF \
    -D JPEGXL_ENABLE_VIEWERS=OFF
make
cd ..

echo "=== done ==="