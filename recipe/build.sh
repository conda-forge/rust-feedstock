#!/bin/bash -e

unset REQUESTS_CA_BUNDLE
unset SSL_CERT_FILE

./install.sh --prefix=$PREFIX
