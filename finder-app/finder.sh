#!/bin/sh

filesdir=$1
searchstr=$2

#arguement not specified
if [ $# != 2 ]
then
	echo "Error: Please Enter path to a directory and the string to be searched, parameters mentioned are not specified."
	exit 1
fi

#find
if [ -d "$filesdir" ]
then
	matchFileCount=$(find "$filesdir" -type f | wc -l )
	cd "$filesdir"

	matchLineCount=$(grep -r "$searchstr" | wc -l)
	
	echo "The number of files are ${matchFileCount} and the number of matching lines are ${matchLineCount}"
       	exit 0	
else
	echo "Error:  Directory not found or is not a directory"
	exit 1
fi


