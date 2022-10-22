#! /bin/bash

declare -r pwdfile=/etc/passwd

echo $pwdfile

# Try changing a read-only file
pwdfile=/etc/abc.txt

echo $pwdfile
 
