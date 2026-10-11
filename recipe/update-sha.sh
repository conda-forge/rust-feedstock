#!/bin/bash
set -euo pipefail

ver="${1:-$(date +%Y-%m-%d)}"
base_url="https://static.rust-lang.org/dist"
template_url='https://static.rust-lang.org/dist/${{ year }}-${{ month }}-${{ day }}'
patch=0001-gh-106-install.sh-Perfomance-Use-more-shell-builtins.patch

emit_source() {
  local first_indent="$1" indent="$2" archive="$3" target_directory="${4:-}"
  local checksum
  checksum=$(curl -fsSL "${base_url}/${ver}/${archive}.sha256")
  checksum="${checksum%% *}"
  printf '%surl: %s/%s\n' "$first_indent" "$template_url" "$archive"
  printf '%ssha256: %s\n' "$indent" "$checksum"
  if [[ -n "$target_directory" ]]; then
    printf '%starget_directory: %s\n' "$indent" "$target_directory"
  else
    printf '%spatches:\n%s  - %s\n' "$indent" "$indent" "$patch"
  fi
}

# noarch outputs still need the archive for their Rust target triple.
for arch in \
  x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu \
  riscv64gc-unknown-linux-gnu powerpc64le-unknown-linux-gnu \
  x86_64-apple-darwin aarch64-apple-darwin \
  x86_64-pc-windows-msvc aarch64-pc-windows-msvc; do
  printf '  - if: rust_arch == "%s"\n    then:\n' "$arch"
  emit_source '      ' '      ' "rust-nightly-${arch}.tar.gz"
done

emit_source '  - ' '    ' rust-src-nightly.tar.gz rust-src
printf '  - if: rust_arch in ["x86_64-unknown-linux-gnu", "x86_64-pc-windows-msvc"]\n    then:\n'

for arch in \
  aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim \
  aarch64-linux-android arm-linux-androideabi armv7-linux-androideabi \
  i686-linux-android x86_64-linux-android wasm32-unknown-unknown \
  x86_64-pc-windows-msvc wasm32-unknown-emscripten thumbv7em-none-eabihf \
  x86_64-pc-windows-gnu aarch64-pc-windows-msvc; do
  extension=tar.gz
  if [[ "$arch" == aarch64-pc-windows-msvc ]]; then
    extension=tar.xz
  fi
  emit_source '      - ' '        ' "rust-std-nightly-${arch}.${extension}" "rust-std/${arch}"
done
