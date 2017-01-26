#!/bin/bash

echo "Challenge 1"

if [ -d ../my_files ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi

echo "Challenge 2"

if [ -e ../my_files/script.sh ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi

echo "Challenge 3"

if [ -e ../my_files/backup/script.sh ] ; then
        echo ...passed ;
else
        echo ...failed ;
fi

echo "Challenge 4"

FOUR="`cat ../my_files/my_script.R`"

if [ "$FOUR" == "print('I love programming!')" ] ; then
        echo ...passed ;
else
        echo ...failed ;
fi

