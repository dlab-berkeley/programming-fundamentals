#!/bin/bash

echo "Challenge 1"

if [ `../my_files/script.sh`=`sort ../data/animals.txt | uniq -c` ] ; then
	echo ...passed
else
	echo ...failed
fi

echo "Challenge 2"

if [ `longest.sh ../data/articles TXT` -eq `wc -l ../data/downloads/*.TXT| sort -n | head -1` ] ; then
	echo ...passed
else
	echo ...failed
fi
