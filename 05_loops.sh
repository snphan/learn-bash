#! /bin/bash

number=1
while (( $number < 10 ))
do
    echo "$number"
    number=$(( number+1 ))
done

for i in {0..20..2}
do
    echo $i
done
