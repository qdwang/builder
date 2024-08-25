@echo off
setlocal

set "src=libjxl-main"

echo === checkout libjxl ===
git clone --depth 1 --branch v0.10.3 --recurse-submodules https://github.com/libjxl/libjxl.git %src%

echo === build libjxl ===
if exist %src%-native rmdir /s /q %src%-native
mkdir %src%-native
cd %src%-native

cmake ..\%src% ^
    -D CMAKE_SYSTEM_NAME=Windows ^
    -D CMAKE_BUILD_TYPE=Release ^
    -D JPEGXL_STATIC=OFF ^
    -D JPEGXL_ENABLE_TOOLS=ON ^
    -D BROTLI_BUNDLED_MODE=OFF ^
    -D BUILD_TESTING=OFF ^
    -D BUILD_SHARED_LIBS=OFF ^
    -D JPEGXL_ENABLE_DEVTOOLS=OFF ^
    -D JPEGXL_ENABLE_DOXYGEN=OFF ^
    -D JPEGXL_ENABLE_MANPAGES=OFF ^
    -D JPEGXL_ENABLE_BENCHMARK=OFF ^
    -D JPEGXL_ENABLE_EXAMPLES=OFF ^
    -D JPEGXL_ENABLE_JNI=OFF ^
    -D SJPEG_ENABLE_SIMD=OFF ^
    -D JPEGXL_ENABLE_PLUGINS=OFF ^
    -D BUILD_SHARED_LIBS=OFF ^
    -D JPEGXL_ENABLE_VIEWERS=OFF

cmake --build . --config Release

cd ..

echo === done ===
endlocal
