#!/bin/bash

echo "Challenge 1"

TEST=`diff -wBq ../my_files/nsorts.txt ../my_files/asorts.txt`
VAL="Files my_files/nsorts.txt and my_files/asorts.txt differ"

if [ $"VAL"=$"TEST" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi

echo "Challenge 2"

if [ `cat ../my_files/asia_count` -eq 77301 ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi

echo "Challenge 3"

echo "bear\ndeer\nfox\nrabbit\nraccoon" > test

TEST=`diff -wBq test ../my_files/unique_animals.txt`
VAL="Files test and my_files/unique_animals do not differ"

if [ $"VAL"=$"TEST" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi
