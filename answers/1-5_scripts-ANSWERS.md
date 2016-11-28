---
title: The Unix Shell
subtitle: Shell Scripts
ANSWERS
---

## Exercises

#### Challenge 1

Write a shell script called `backup.sh` in `my_files/` that backs up all of the files with a certain extension to a backup folder specified by the user. The user should supply two arguments, the first being the extension and the second being the name of the backup folder to use. For example, the command `bash backup.sh TXT my_backup` would copy all files ending in .TXT from the current folder to the folder my_backup.

~~~
for filename in *.$1
do
    cp $filename $2/original-$filename
done 
~~~

#### Challenge 2

Write a shell script called `longest.sh` in `my_files/` that takes the name of a
directory and a filename extension as its parameters, and prints
out the number of lines and name of the file with the most lines in
that directory with that extension. For example:

~~~
> bash my_files/longest.sh /tmp/data pdb
~~~

would print the name of the `.pdb` file in `/tmp/data` that has
the most lines.

~~~
cd myfiles
echo 'wc -l "$1"/*."$2" | sort -n | tail -2 | head -1' > longest.sh
~~~

Watch out for single and double quotes!


#### Challenge 3

What happens if you rename `example.sh` to `example.R`?

It still runs because you're claiming it as a bash script when you type `bash` before the name of the file.
