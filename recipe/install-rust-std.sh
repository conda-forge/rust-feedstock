#!/bin/bash

set -ex

DESTDIR=$PWD/destdir/

# we want to install only a portion of the full installation.
# To do that, let's use destdir and then use the manifest-rust-std-* file
# to install the files corresponding to rust-std
./install.sh --prefix=$PREFIX --destdir=$DESTDIR

while read line; do
  file=$(echo $line | cut -b 6-)
  destination=$(echo $file | cut -b ${#DESTDIR}-)
  mkdir -p $(dirname $destination)
  cp $file ${destination}
done < $DESTDIR$PREFIX/lib/rustlib/manifest-rust-std-$rust_arch

