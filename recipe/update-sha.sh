ver="2020-10-14"
wget https://static.rust-lang.org/dist/$ver/rust-nightly-x86_64-pc-windows-msvc.tar.gz
wget https://static.rust-lang.org/dist/$ver/rust-nightly-x86_64-apple-darwin.tar.gz
wget https://static.rust-lang.org/dist/$ver/rust-nightly-x86_64-unknown-linux-gnu.tar.gz
wget https://static.rust-lang.org/dist/$ver/rust-nightly-aarch64-unknown-linux-gnu.tar.gz
wget https://static.rust-lang.org/dist/$ver/rust-nightly-powerpc64le-unknown-linux-gnu.tar.gz
wget https://static.rust-lang.org/dist/$ver/rust-std-nightly-aarch64-apple-darwin.tar.gz

echo "  sha256: $(sha256sum rust-nightly-x86_64-pc-windows-msvc.tar.gz | cut -b -64)  # [win64]"
echo "  sha256: $(sha256sum rust-nightly-x86_64-apple-darwin.tar.gz | cut -b -64)  # [osx and x86_64]"
echo "  sha256: $(sha256sum rust-nightly-x86_64-unknown-linux-gnu.tar.gz | cut -b -64)  # [linux and x86_64]"
echo "  sha256: $(sha256sum rust-nightly-aarch64-unknown-linux-gnu.tar.gz | cut -b -64)  # [linux and aarch64]"
echo "  sha256: $(sha256sum rust-nightly-powerpc64le-unknown-linux-gnu.tar.gz | cut -b -64)  # [linux and ppc64le]"
echo "  sha256: $(sha256sum rust-std-nightly-aarch64-apple-darwin.tar.gz | cut -b -64)  # [osx and arm64]"
