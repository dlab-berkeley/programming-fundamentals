#!/bin/bash

echo "Challenge 1"

if [ $VARIABLE -eq 48 ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi

echo "Challenge 2"

TEST=`. ../my_files/script.sh | tail -1`
VALUE=6

if [ $TEST=$VALUE  ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi
