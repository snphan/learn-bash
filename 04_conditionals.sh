#! /bin/bash
count=8
if (( $count < 9 )) && (( $count >= 0 ))
then
    echo "The count is between 0 and 9"
elif (( $count == 10 ))
then
    echo "the condition is true"
else
    echo "the condition is false"
fi
