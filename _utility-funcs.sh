#!/bin/bash
# file: _utility-funcs.sh
# info: all internal utility functions are kept here
# usage: (for internal use - DO NOT CALL DIRECTLY)
# author: a1prashant

# $1: boolean, skip directories
# $2: array of name params
function get_find_cmd_for_names
{
    find_cmd=""
    skip_directories=$1
    echo "skip_dir: $skip_directories"
    first=true
    list_of_names=$2
    for i in ${list_of_names}
    do
        if [ "$first" = false ]; then
            find_params="$find_params -o "
        fi
        find_params="$find_params -name \"*.$i\" -o -name \"$i\""
        first=false
    done
    if [ "$skip_directories" = true ]; then
        find_params="$find_params -type f ! -type d"
    fi
    echo "find command: find . $find_params"
    find_cmd="find . $find_params"
}

function run() {
    local cmd="$1 >> "$out_file" 2>&1"
    eval "$cmd"
    return $?
}

function rm_remake_dir() {
    if [ -d $build_dir ];
    then
        echo "dir exists - removing"
        local cmd="rm -rf $1 ; mkdir $1 ; sleep 1"
        run "$cmd"
        return $?
    else
        echo "dir was NOT present"
    fi
}

