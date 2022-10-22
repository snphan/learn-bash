#! /bin/bash

car=('BMW' 'Toyota' 'Honda')

echo "${car[@]}"

# The 0-th index of the array
echo "${car[0]}"

# Show the index
echo "${!car[@]}"

# The length of the array
echo "${#car[@]}"

# Deleting elements in the array
unset car[2]
echo "${car[@]}"

# Insert element
car[2]='Lambo'
echo "${car[@]}"

