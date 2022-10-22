# Welcome to Learning How to Bash Script

Follows the course on https://www.youtube.com/watch?v=e7BufAVwDiM&t=10058s
Start your bash script with 

```shell
#! /bin/bash 
```


## 01 Hello Bash Scripting
To show your shell environments use 

    cat /etc/shells

Bash scripts end in .sh. To make a script executeable, do the following

    chmod +x <filename>

## 02 Redirect to File

Use **`>`** to put echo contents into file

    echo "hello bash script" > 02_file.txt
    cat > 02_file.txt

Use **`>>`** to append. 

    echo "this is some content after" >> 02_file.txt 

## 03 Comments

Use **` : '<your comment here>' `** for multiline comments.

## 04 Conditionals

Use the following structure **`if []/(())`** **`then`**, **`else`**, **`elif []/(())`**, **`fi`**

```shell
#! /bin/bash

count=8
if (( $count < 9)) && (( $count >= 0 ))
then
    echo "count is between 9 and 0"
elif (($count == 10))
then 
    echo "the condition is true"
else
    echo "the condition is false"
fi
```


## 05 Loops

While loop

```shell 
#! /bin/bash

number=1
while (( $number < 10 ))
do
    echo "$number"
    number=$(( number+1 ))
done
```

For loop

```shell 
for i in 1 2 3 4 5
do
    echo $i
done
```
or using a range. *Note! it includes the end {start..end..increment}*
We can also use C-style for loops (( i=0; i<5; i++ ))

```shell 
for i in {0..20..2}
do
    echo $i
done
```

We can also use **`break`** or **`continue`** controls

# 06 Script Input

Use the **`$`** to get the args. Note $0 is the filename

```shell
#! /bin/bash

echo $0 $1 $2 $3

# Also we can get all the args as an array
args=("$@")

# Print out the all of the arguments
echo $@

# Length of the array
echo $#
```
Reading a file

```shell
#! /bin/bash
while read line
do
    echo "$line"
done < "${1:-/dev/stdin}"
# ${1....} Means to take the first argument
```

## 07 - Output

Use **`1>`** for STDOUT and **`2>`** for STDERR. Use **`>&`** for both.

```shell
#! /bin/bash

ls -a 1>07_output.txt 2>07_err_log.txt

```

## 08 - Pipes

Tranferring stuff from one script to another. We can use export to send variables to another script.

**`08_firstScript.sh`**
```shell
#! /bin/bash

MESSAGE="Hello world"
export MESSAGE
./08_secondScript.sh
```


**`08_secondScript.sh`**
```shell

echo "This is the message from secondScript: $MESSAGE"
```

## 09 String Processing

Comparing

```shell
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
```

## 10 - Doing math

We need to use **`$(())`** to do math. By default, operations will be performed
on ints. We can also use **`$(expr <your expression>)`**.

```shell
#! /bin/bash

n1=4
n2=20

echo $(( n1 + n2 ))
echo $(( n1 - n2 ))
echo $(( n1 * n2 ))
echo $(( n1 / n2 ))
echo $(( n1 % n2 ))


echo $(expr $n1 + $n2 )
echo $(expr $n1 - $n2 )
echo $(expr $n1 \* $n2 )
echo $(expr $n1 / $n2 )
echo $(expr $n1 % $n2 )
```

## Reading Hex

```shell
#! /bin/bash

echo "Enter Hex Number of you choice"
read Hex

echo -n "The decimal value of $Hex is : "

echo "obase=10; ibase=16; $Hex" | bc
```

# 11 - Declaring Variables

Using declare is very similar to using const, let, var

```shell
#! /bin/bash

declare -r pwdfile=/etc/passwd

echo $pwdfile

# Try changing a read-only file
pwdfile=/etc/abc.txt

echo $pwdfile
``` 

# 12 - Arrays

Working with arrays.

```shell
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
```

# 13 - Functions

Note that bash functions cannot return a value. What needs to be done is to set a global variable
and read from it. All variables are global by default in bash.

```shell
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
```

# 14 - Files and Directories
