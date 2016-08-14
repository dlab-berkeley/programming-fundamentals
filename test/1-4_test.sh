#!/bin/bash

echo "Challenge 1"

TEST=$(cat "../my_files/challenge_1.txt")
VALUE="fructose.dat
glucose.dat
sucrose.dat
fructose.dat
glucose.dat
sucrose.dat
fructose.dat
glucose.dat
sucrose.dat"

if [ "$TEST" == "$VALUE" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi


echo "Challenge 2"
TEST=$(cat "../my_files/challenge_2.txt")
VALUE="fructose.dat
glucose.dat
sucrose.dat
sugar"

if [ "$TEST" == "$VALUE" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi


echo "Challenge 3"
TEST=$(cat "../my_files/challenge_3.txt")
VALUE="4
6"

if [ "$TEST" == "$VALUE" ] ; then
	echo ...passed ;
else
	echo ...failed ;
fi