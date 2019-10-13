#!/bin/bash
# file: srcvim.sh
# info: Recursively opens source files whose extension/s is/are mentioned
# usage: srcvim cpp h BUILD
# author: a1prashant

set +x

declare -a use_src_file_names
use_src_file_names="( "$@" )"

source ~/pscripts/include-pscripts.sh
source ~/pscripts/_utility-funcs.sh

INDEXFILE="cscope.files"

if [ "$#" -eq 0 ]; then
    number_of_preset_src_files=${#pscripts_src_files[@]}
    if [ "$number_of_preset_src_files=" = 0 ]; then
        echo "No args provided, pscripts_src_files is empty, defaulting to cpp, h file extensions"
        use_src_file_names=("*.cpp" "*.h")
    else
        echo "No args provided, using {pscripts_src_files}: ${pscripts_src_files}"
        use_src_file_names=${pscripts_src_files[@]}
    fi
fi

get_find_cmd_for_names true "$use_src_file_names"
cmd_find=$find_cmd

echo "Finding files..."
eval $cmd_find > "$INDEXFILE"

echo "Creating cscope DB..."
cscope -b -q -i "$INDEXFILE"

echo "Creating ctags..."
ctags -L "$INDEXFILE" --extra=+f

export CSCOPE_DB="cscope.out"

echo "Opening vim with all found files..."
cmd_vim="vim \`$cmd_find\`"
eval $cmd_vim

export CSCOPE_DB=""

echo "Deleting cscope DB and output..."
rm cscope.*

echo "Deleting ctags related file..."
rm tags

