#! /bin/bash

function funcName() {
    echo "this is new functions"
}

# Adding arguments (same with getting arguments from CLI)
# Also assigning global variables.
function funcPrint() {
    isDone="i am done"
    echo "Printing from inside function: $1"
}




# Call the functions
funcName
funcPrint "Hi World"
echo "funcPrint : $isDone"
