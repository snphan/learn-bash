#! /bin/bash

# Check if a directory exists
echo "Enter directory name to check"
read direct

if [ -d "$direct" ] 
then
    echo "$direct exists already"
else
    echo "$direct doesn't exist"
fi

# Create a file
echo "Enter the file name to create"
read fileName


# Check if file exists
if [ -f "$fileName" ]
then 
    echo "$direct exists"
else
    echo "$direct doesn't exist"
    touch $fileName
fi


