#!/bin/bash

set -ex

# windows shell doesn't start here
cd $SRC_DIR

DESTDIR=$PWD/destdir/

# we want to install only a portion of the full installation.
# To do that, let's use destdir and then use the manifest-rust-std-* file
# to install the files corresponding to rust-std
./install.sh --prefix=$PREFIX --destdir=$DESTDIR

# install.log is large because it records full paths for each file.
# => conda-build is slow to parse ripgrep's output for prefix replacement.
# => replace path records beforehand:
install_log="${DESTDIR}${PREFIX}/lib/rustlib/install.log"
sed \
  -e "s|${PREFIX}|/prefix|g" \
  -e "s|${DESTDIR}|/destdir|g" \
  -e "s|${PWD}|/source|g" \
  -i.bak "${install_log}"
rm "${install_log}.bak"
