#!/bin/sh
# file: srcvim.sh
# info: Recursively opens source files whose extension/s is/are mentioned
# usage: srcvim cpp h BUILD
# author: a1prashant

set -x

cmd_find="find . "
is_prev_name=false
INDEXFILE="cscope.files"

if [ "$#" -eq 0 ]; then
    cmd_find="$cmd_find -name \"*.cpp\" -o -name \"*.h\""
    echo "No arguments, considering cpp, h file extensions"
fi

echo "Finding files..."
for i in "$@"
do
    if [ "$is_prev_name" = true ]; then
        find_params="$find_params -o "
    fi
    find_params="$find_params -name \"*.$i\" -o -name \"$i\""
    is_prev_name=true
done

# consider only files, not directories
find_params="$find_params -type f ! -type d"

cmd_find="$cmd_find $find_params"
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
