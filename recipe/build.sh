#!/bin/bash

set -ex

# windows shell doesn't start here
cd $SRC_DIR

DESTDIR=$PWD/destdir/

# we want to install only a portion of the full installation.
# To do that, let's use destdir and then use the manifest-rust-std-* file
# to install the files corresponding to rust-std
./install.sh --prefix=$PREFIX --destdir=$DESTDIR
