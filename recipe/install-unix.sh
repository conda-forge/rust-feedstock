#!/bin/bash -e

[[ ${target_platform} == osx-64 ]] && cp "${RECIPE_DIR}"/xcode-select .
PATH="${PWD}:$PATH" ./install.sh --prefix="${PREFIX}"

# these files looks to be missing from the rustlib dir
# TODO investigate if these are really needed
if [[ ${target_platform} == linux-64 ]]; then
    ln -s ${PREFIX}/lib/librustc_driver-*.so ${PREFIX}/lib/rustlib/x86_64-unknown-linux-gnu/lib/
fi
if [[ ${target_platform} == osx-64 ]]; then
    ln -s ${PREFIX}/lib/librustc_driver-*.dylib ${PREFIX}/lib/rustlib/x86_64-apple-darwin/lib/
fi
