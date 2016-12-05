#!/bin/bash

echo "Challenge 1"

TEST=`diff -wBq ../my_files/nsorts.txt ../my_files/asorts.txt`
VAL="Files ../my_files/nsorts.txt and ../my_files/asorts.txt differ"

if [ "$VAL" == "$TEST" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi

echo "Challenge 2"

if [ "`cat ../my_files/unique_animals.txt`" == "`sort ../data/animals.txt | uniq`"  ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi

echo "Challenge 3"

if [ "`cat ../my_files/asia_count`" == "`wc -w ../data/articles/asia*.txt | tail -1 | cut -c 4-8`" ] ; then
	echo ...passed ;
elif [ "`cat ../my_files/asia_count`" == "`wc -w ../data/articles/asia*.txt | tail -1 | cut -c 2-6`" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi