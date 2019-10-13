#!/bin/bash
# file: srcgrep.sh
# info: grep in the source code only; source-code file extension same provided in srcvim or default cpp h
# usage: srcgrep -r some_keyword
# author: a1prashant

set -x

declare -a use_src_file_names
use_src_file_names="( "$@" )"

source ~/pscripts/include-pscripts.sh
source ~/pscripts/_utility-funcs.sh

INDEXFILE="cscope.files"

if [ "$#" -eq 0 ]; then
    echo "Usage: srcgrep <grep options> <keyword to grep>"
    exit -1
fi

use_src_file_names=${pscripts_src_files[@]}
get_find_cmd_for_names true "$use_src_file_names"
cmd_find=$find_cmd | grep "$@"

