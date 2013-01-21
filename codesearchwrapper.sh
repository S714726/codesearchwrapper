#!/bin/bash

# Alias this script to the original names for genuine convenience
#   alias csearch='bash ~/bin/codesearchwrapper.sh csearch'
#   alias cindex='bash ~/bin/codesearchwrapper.sh cindex'

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
