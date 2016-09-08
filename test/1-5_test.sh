#!/bin/bash

echo "Challenge 1"

if [ "`bash ../my_files/longest.sh ../data/articles txt`" == "`wc -l ../data/articles/*.txt| sort -n | tail -2 | head -1`" ] ; then
	echo ...passed
else
	echo ...failed
fi


echo "Challenge 2a"

TEST=$(cat "../my_files/challenge_2a.txt")
VALUE="example.sh fructose.dat glucose.dat sucrose.dat xylose.dat"

if [ "$TEST" == "$VALUE" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi

echo "Challenge 2b"

TEST=$(cat "../my_files/challenge_2b.txt")
VALUE="sugar
sugar
sugar"

if [ "$TEST" == "$VALUE" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi


echo "Challenge 2c"

TEST=$(cat "../my_files/challenge_2c.txt")
VALUE="fructose.dat glucose.dat sucrose.dat xylose.dat.dat"

if [ "$TEST" == "$VALUE" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi


echo "Challenge 3"
echo "If you guessed it would run as a regular shell script, you're right! Why?"
