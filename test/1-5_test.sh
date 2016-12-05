#!/bin/bash

echo "Challenge 1"

mkdir my_backup

if [ "`bash ../my_files/backup.sh sh my_backup`" == "`for filename in *.sh; do     cp $filename my_backup/original-$filename; done`" ] ; then
	echo ...passed
else
	echo ...failed
fi

rm -r my_backup


echo "Challenge 2"

if [ "`bash ../my_files/longest.sh ../data/articles txt`" == "`wc -l ../data/articles/*.txt| sort -n | tail -2 | head -1`" ] ; then
	echo ...passed
else
	echo ...failed
fi


echo "Challenge 3"
echo "If you guessed it would run as a regular shell script, you're right! Why?"
