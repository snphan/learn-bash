#! /bin/bash

echo "input filename: "
read filename

if [ -f $filename ]
then
    # Get the emails
    echo "----------------------------------------"
    echo "All of the emails"
    grep -n "^[a-zA-Z0-9]\+@[a-zA-Z0-9]\+.\(com\|ca\|co.jp\)" "$filename"

    echo "----------------------------------------"

    # All of the phone numbers
    echo "All of the phone numbers"
    grep "(\?[0-9]\{3\})\?-\?[0-9]\{3\}-\?[0-9]\{4\}" "$filename"
else
    echo "Error: File does not exist"
fi



