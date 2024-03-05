#!/bin/bash

set -ex

cd $SRC_DIR/rust-std

echo $PKG_NAME > ./components

./install.sh --prefix="$PREFIX" --destdir="$DESTDIR"

rm "${PREFIX}"/lib/rustlib/components
rm "${PREFIX}"/lib/rustlib/install.log
rm "${PREFIX}"/lib/rustlib/rust-installer-version
rm "${PREFIX}"/lib/rustlib/uninstall.sh
