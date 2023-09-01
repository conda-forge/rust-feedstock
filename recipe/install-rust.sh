#!/bin/bash

set -ex

# windows shell doesn't start here
cd $SRC_DIR

DESTDIR=$PWD/destdir/

# Copy everything that has been prepared by build.sh from DESTDIR to PREFIX.
cp -aR "${DESTDIR}${PREFIX}"/* "${PREFIX}/"

# Fun times -- by default, Rust/Cargo tries to link executables on Linux by
# invoking `cc`. An executable of this name is not necessarily available. By
# setting a magic environment variable, we can override this default.

case "$target_platform" in
    linux-64) rust_env_arch=X86_64_UNKNOWN_LINUX_GNU ;;
    linux-aarch64) rust_env_arch=AARCH64_UNKNOWN_LINUX_GNU ;;
    linux-ppc64le) rust_env_arch=POWERPC64LE_UNKNOWN_LINUX_GNU ;;
    win-64) rust_env_arch=X86_64_PC_WINDOWS_MSVC ;;
    osx-64) rust_env_arch=X86_64_APPLE_DARWIN ;;
    osx-arm64) rust_env_arch=AARCH64_APPLE_DARWIN ;;
    *) echo "unknown target_platform $target_platform" ; exit 1 ;;
esac

if [[ "$target_platform" == linux* ]]; then

    mkdir -p $PREFIX/etc/conda/activate.d $PREFIX/etc/conda/deactivate.d

    cat <<EOF >$PREFIX/etc/conda/activate.d/rust.sh
export CARGO_TARGET_${rust_env_arch}_LINKER=$CC
EOF

    cat <<EOF >$PREFIX/etc/conda/deactivate.d/rust.sh
unset CARGO_TARGET_${rust_env_arch}_LINKER
EOF

fi

if [[ "${target_platform}" == win-* ]]; then
  # We need to delete the two directory as otherwise conda-build treats them as a sysroot
  # See https://github.com/conda/conda-build/blob/d3b717760f550abd58832c629d7f72aed46ae5ca/conda_build/post.py#L1376-L1381
  rm -r $PREFIX/share/doc/rust/html/src/sysroot
  rm -r $PREIFX/share/doc/rust/html/sysroot
fi
