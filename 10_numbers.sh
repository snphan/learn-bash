#! /bin/bash

echo "Enter Hex Number of you choice"
read Hex

echo -n "The decimal value of $Hex is : "

echo "obase=10; ibase=16; $Hex" | bc

