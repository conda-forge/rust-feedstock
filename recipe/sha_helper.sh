#!/bin/bash

get_sha256sum_rust_nightly () {
    local year=${1};
    local month=${2};
    local day=${3};
    
    # [win64]
    curl "https://static.rust-lang.org/dist/${year}-${month}-${day}/rust-nightly-x86_64-pc-windows-msvc.tar.gz.sha256";
    # [osx and x86_64]
    curl "https://static.rust-lang.org/dist/${year}-${month}-${day}/rust-nightly-x86_64-apple-darwin.tar.gz.sha256";
    # [linux and x86_64]
    curl "https://static.rust-lang.org/dist/${year}-${month}-${day}/rust-nightly-x86_64-unknown-linux-gnu.tar.gz.sha256";
    # [aarch64]
    curl "https://static.rust-lang.org/dist/${year}-${month}-${day}/rust-nightly-aarch64-unknown-linux-gnu.tar.gz.sha256";
    # [ppc64le]
    curl "https://static.rust-lang.org/dist/${year}-${month}-${day}/rust-nightly-powerpc64le-unknown-linux-gnu.tar.gz.sha256";
    # [osx and arm64]
    curl "https://static.rust-lang.org/dist/${year}-${month}-${day}/rust-nightly-aarch64-apple-darwin.tar.gz.sha256";
}

get_sha256sum_rust_nightly $@
