#!/bin/bash

set -ex

cd rust-src

DESTDIR=/

./install.sh --prefix="$PREFIX" --destdir="$DESTDIR"

rm "${DESTDIR}"/"${PREFIX}"/lib/rustlib/components
rm "${DESTDIR}"/"${PREFIX}"/lib/rustlib/install.log
rm "${DESTDIR}"/"${PREFIX}"/lib/rustlib/rust-installer-version
rm "${DESTDIR}"/"${PREFIX}"/lib/rustlib/uninstall.sh
