#!/bin/sh

writefile=$1
writestr=$2

if [ $# != 2 ]; then
    echo "Error: Please enter the full path to a file (including filename) on the filesystem and a text string to be written within this file. Parameters are not specified."
    exit 1
fi

# Extract the directory from the file path
dirname=$(dirname "$writefile")

# Check if the directory exists, if not, create it
if [ ! -d "$dirname" ]; then
    mkdir -p "$dirname"
fi

# Check if the file exists, if not, create it
if [ -e "$writefile" ]; then
    echo "$writestr" > "$writefile"
else
    touch "$writefile"
    echo "$writestr" > "$writefile"
fi

