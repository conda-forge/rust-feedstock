#!/bin/bash

set -ex

# windows shell doesn't start here
cd $SRC_DIR

DESTDIR=$PWD/destdir/

# we want to install only a portion of the full installation.
# To do that, let's use destdir (populated via build.sh) and then use the
# manifest-rust-docs file to install the files corresponding to rust-docs

for manifest in manifest-rust-docs manifest-rust-docs-json-preview; do
  while read line; do
    case "$line" in
      file:*)
        src=$(echo $line | cut -b 6-)
        dest=$(echo $src | cut -b ${#DESTDIR}-)
        mkdir -p $(dirname $dest)
        cp $src $dest
        ;;
      dir:*)
        src=$(echo $line | cut -b 5-)
        dest=$(echo $src | cut -b ${#DESTDIR}-)
        mkdir -p $dest
        cp -r $src/* $dest/ 2>/dev/null || true
        ;;
    esac
  done < $DESTDIR$PREFIX/lib/rustlib/$manifest
done
