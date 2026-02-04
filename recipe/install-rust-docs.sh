#!/bin/bash

set -ex

# windows shell doesn't start here
cd $SRC_DIR

DESTDIR=$PWD/destdir/

# we want to install only a portion of the full installation.
# To do that, let's use destdir (populated via build.sh) and then use the
# manifest-rust-docs file to install the files corresponding to rust-docs

while read line; do
  file=$(echo $line | cut -b 6-)
  destination=$(echo $file | cut -b ${#DESTDIR}-)
  mkdir -p $(dirname $destination)
  cp $file ${destination}
done < $DESTDIR$PREFIX/lib/rustlib/manifest-rust-docs
