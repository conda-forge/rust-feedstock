#!/bin/bash -e

./install.sh --prefix=$PREFIX

# Fun times -- by default, Rust/Cargo tries to link executables on Linux by
# invoking `cc`. This is not (necessarily) available on Linux/GCC7. By setting
# a magic environment variable, we can override this default.

set -ex

if [ "$c_compiler" = gcc ] ; then
    mkdir -p $PREFIX/etc/conda/activate.d $PREFIX/etc/conda/deactivate.d

    cat <<'EOF' >$PREFIX/etc/conda/activate.d/rust.sh
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=$CC
EOF

    cat <<'EOF' >$PREFIX/etc/conda/deactivate.d/rust.sh
unset CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER
EOF
fi
