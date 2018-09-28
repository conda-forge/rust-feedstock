#!/bin/bash -e -x

## TODO: remove the following `unset` lines, once the following issue in `conda-build` is resolved:
##       <https://github.com/conda/conda-build/issues/2255>

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

rustc --help
rustdoc --help
cargo --help

echo "#!/usr/bin/env bash"                         > ./cc
if [[ $(uname) == Linux ]]; then
  echo "x86_64-conda_cos6-linux-gnu-cc \"\$@\""   >> ./cc
else
  echo "x86_64-apple-darwin13.4.0-clang \"\$@\""  >> ./cc
fi
cat cc
chmod +x cc

PATH="$PWD:$PATH" cargo install xsv --force
