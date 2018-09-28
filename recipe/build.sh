#!/bin/bash -e

echo "$CC $@" > cc
echo "#!/usr/bin/env bash"   > ./cc
echo "${CC} \"\$@\""        >> ./cc
chmod +x cc

PATH="${PWD}:$PATH" ./install.sh --prefix=${PREFIX}
