#! /bin/bash

url="http://speedtest.ftp.otenet.gr/files/test100k.db"
curl -I ${url}
curl ${url} -O
curl ${url} -o 16_test100k.db

