#!/bin/bash -e

[[ ${target_platform} == osx-64 ]] && cp "${RECIPE_DIR}"/xcode-select .
PATH="${PWD}:$PATH" ./install.sh --prefix="${PREFIX}"
