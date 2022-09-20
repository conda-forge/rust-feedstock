#!/bin/bash -e

echo ${target_platform}

[[ ${target_platform} == osx-64 ]] && cp "${RECIPE_DIR}"/xcode-select .
PATH="${PWD}:$PATH" ./install.sh --prefix="${PREFIX}"

[[ `uname` == Darwin ]] && DSO_EXT='dylib' || DSO_EXT='so'

# these files appear to be missing from the rustlib dir
ln -s ${PREFIX}/lib/librustc_driver-*.${DSO_EXT} ${PREFIX}/lib/rustlib/${rust_arch}/lib/
ln -s ${PREFIX}/lib/libgit2.1.5.${DSO_EXT} ${PREFIX}/lib/rustlib/${rust_arch}/lib/
