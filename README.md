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

Use **`-d`** to check if dir exists. Use **`-f`** to check if file exists.

```shell
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
```

# 15 - Sending emails

We need to use ssmtp

    sudo apt install ssmtp

Create a ssmtp.conf file with the following parameters

**`ssmtp.conf`**
```
root=testingemail438@gmail.com
mailhub=smtp.gmail.com:587
AuthUser=testingemail438@gmail.com
AuthPass=securepass
UseSTARTTLS=yes
```

# 16 - Curl in Scripts

Downloading stuff.

When using curl, use the **`-O`** option to inherit the filename.
We can change the filename by using the **`-o <filename>`** 
Look at the file header by using th **`-I`** flag.

```shell
#! /bin/bash

url="http://speedtest.ftp.otenet.gr/files/test100k.db"
curl -I ${url}
curl ${url} -O
curl ${url} -o 16_test100k.db
```

# 17 - Professional Menus

Use **`select <varname> in <space separatedlist>`**.

```shell
#! /bin/bash

select car in BMW MERCEDESE TESLA ROVER TOYOTA
do
    case $car in
    BMW)
        echo "BMW SELECTED";;
    MERCEDESE)
        echo "MERCEDESE SELECTED";;
    TESLA)
        echo "TESLA SELECTED";;
    ROVER)
        echo "ROVER SELECTED";;
    TOYOTA)
        echo "TOYOTA SELECTED";;
    *)
        echo "ERROR PLEASE SELECT THE CORRECT ONE";;
    esac
done
```

# 18 - Inotify-tools

To use inotify, we need to install inotify-tools. When stuff happens inside the 
directory then we will be notified what happens.

    sudo apt install inotify-tools

Do not open log.txt while inotifywait is running or else there will be some sort
of infinite loop.

```shell
#! /bin/bash
dirpath=./18_inotifydir
if [ ! -d dirpath ]
then
    mkdir "$dirpath"
fi
inotifywait -m "$dirpath" >> "$dirpath/log.txt"
```

# 19 - Grep

You need to escape most of the characters **`\+`**, **`\?`**, **`\{<num>\}`**

Use **`-n`** to print out the line numbers

```shell
#! /bin/bash
echo "input filename: "
read filename

if [ -f $filename ]
then
    # Get the emails
    echo "----------------------------------------"
    echo "All of the emails"
    grep -n "^[a-zA-Z0-9]\+@[a-zA-Z0-9]\+.\(com\|ca\|co.jp\)" "$filename"

    echo "----------------------------------------"

    # All of the phone numbers
    echo "All of the phone numbers"
    grep "(\?[0-9]\{3\})\?-\?[0-9]\{3\}-\?[0-9]\{4\}" "$filename"
else
    echo "Error: File does not exist"
fi
```




