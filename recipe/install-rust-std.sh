#!/bin/bash

set -ex

DESTDIR=$PWD/destdir/

# we want to install only a portion of the full installation.
# To do that, let's use destdir and then use the manifest-rust-std-* file
# to install the files corresponding to rust-std
./install.sh --prefix=$PREFIX --destdir=$DESTDIR

case "$target_platform" in
    linux-64) rust_arch=x86_64-unknown-linux-gnu ;;
    linux-aarch64) rust_arch=aarch64-unknown-linux-gnu ;;
    linux-ppc64le) rust_arch=powerpc64le-unknown-linux-gnu ;;
    win-64) rust_arch=x86_64-pc-windows-msvc ;;
    osx-64) rust_arch=x86_64-apple-darwin ;;
    osx-arm64) rust_arch=aarch64-apple-darwin ;;
    *) echo "unknown target_platform $target_platform" ; exit 1 ;;
esac


while read line; do
  file=$(echo $line | cut -b 6-)
  destination=$(echo $file | cut -b ${#DESTDIR}-)
  mkdir -p $(dirname $destination)
  cp $file ${destination}
done < $DESTDIR$PREFIX/lib/rustlib/manifest-rust-std-$rust_arch

