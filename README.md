# Welcome to Learning How to Bash Script

Follows the course on https://www.youtube.com/watch?v=e7BufAVwDiM&t=10058s

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



