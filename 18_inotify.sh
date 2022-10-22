#! /bin/bash

dirpath=./18_inotifydir
if [ ! -d dirpath ]
then
    mkdir "$dirpath"
fi
inotifywait -m "$dirpath" >> "$dirpath/log.txt"


