#! /bin/bash

echo $0 $1 $2 $3

args=("$@")

for (( i=0; i<$#; i++ ))
do
    echo ${args[i]}
done

while read line
do
    echo "$line"
done < "${1:-/dev/stdin}"


