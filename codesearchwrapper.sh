#!/bin/bash

# Do something nifty like aliasing "csearch" to "codesearchwrapper csearch $@"
#   and "cindex" to "codesearchwrapper cindex $@"

CSEARCH="/usr/local/bin/csearch"
CINDEX="/usr/local/bin/cindex"

INDEX_BASE="$HOME/.csearchindex"
export CSEARCHINDEX="$INDEX_BASE/$2"

if [ $# -lt 1 ]; then
    echo "USAGE: $0 (csearch|cindex) workspace [codesearchopts]"
    exit 3
fi

if [ "$1" == "csearch" ]; then
    $CSEARCH ${@:3}
fi

if [ "$1" == "cindex" ]; then
    mkdir -p "$INDEX_BASE"
    $CINDEX ${@:3}
fi
