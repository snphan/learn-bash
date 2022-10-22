#! /bin/bash

# Script for making a new section
if [ ! -f $1 ] 
then
    echo "#! /bin/bash" > $1
    chmod +x $1
    vim $1
else
    echo "Error: File already exists"
fi
