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



