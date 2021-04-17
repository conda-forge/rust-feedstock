#!/bin/bash -e

function cygpath()
{
  if type -P cygpath.exe > /dev/null 2>&1; then
    echo $(cygpath.exe -u "$1")
  else
    echo "$1"
  fi
}

pushd $(cygpath $SRC_DIR)/gnu

PATH="${PWD}:$PATH" ./install.sh --prefix=$(cygpath ${PREFIX})

if [[ ${target_platform} == osx-64 ]]; then
  if [[ $(uname) == Darwin ]]; then
    ${INSTALL_NAME_TOOL:-install_name_tool} -add_rpath @loader_path/../../.. ${PREFIX}/lib/rustlib/x86_64-apple-darwin/lib/python2.7/site-packages/lldb/lldb-argdumper
  else
    echo "ERROR :: To build ${PKG_NAME} for ${target_platform} you need install_name_tool"
    exit 1
  fi
fi
