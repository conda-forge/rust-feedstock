#!/bin/bash

set -ex

# Each target has its own installer and metadata; rattler-build does not support clobbering of archives.
cd "${SRC_DIR}/rust-std/${rust_std_extra}"

echo $PKG_NAME > ./components

./install.sh --prefix="$PREFIX" --destdir="$DESTDIR"

rm "${PREFIX}"/lib/rustlib/components
rm "${PREFIX}"/lib/rustlib/install.log
rm "${PREFIX}"/lib/rustlib/rust-installer-version
rm "${PREFIX}"/lib/rustlib/uninstall.sh
