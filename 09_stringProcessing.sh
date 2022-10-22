#! /bin/bash


echo "enter 1st string"
read st1

echo "enter 2st string"
read st2

if [ "$st1" == "$st2" ]
then
    echo "Strings are the same"
else
    echo "Strings are different"
fi

if [ "$st1" \< "$st2" ]
then
    echo "string 2 is larger"
else
    echo "String 1 is larger"
fi

# Concatenation
c="$st1 $st2"
echo "Concatenation $c"

# Lower case and Upper case
echo ${st1,,}
echo ${st2^^}

# Upper case first letter.
echo ${st1^l} 


