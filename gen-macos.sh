#!/usr/bin/env bash
set -ex

# Generate project files
mkdir -p build-macos
cd build-macos
cmake -G Xcode -DCMAKE_TOOLCHAIN_FILE=$(which vcpkg)/../scripts/buildsystems/vcpkg.cmake ..
