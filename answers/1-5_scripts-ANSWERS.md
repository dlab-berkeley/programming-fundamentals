---
title: The Unix Shell
subtitle: Shell Scripts
ANSWERS
---

## Exercises

#### Challenge 1

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
echo "wc -l "$1"/*."$2" | sort -n | tail -2 | head -1" > longest.sh
~~~

#### Challenge 2

Joel's `data` directory contains three files: `fructose.dat`,
`glucose.dat`, and `sucrose.dat`. Each of the `.dat` files contains only the word `sugar`. Explain what a script called
`example.sh` (also in the directory!) would do when run as `bash example.sh *.dat` if it
contained the following lines:

~~~
# Script a
echo *.*
~~~

~~~
# Script b
for filename in $1 $2 $3
do
    cat $filename
done
~~~

~~~
# Script c
echo $@.dat
~~~

Now test your theory and redirect the output to `my_files/challenge_2a.txt`, `my_files/challenge_2b.txt`, and `my_files/challenge_2c.txt` respectively.

~~~
cd my_files/sugar

# Script a
echo *.* > challenge_2a.txt

# Script b
for filename in $1 $2 $3
do
    cat $filename
done > challenge_2b.txt

# Script c
echo $@.dat > challenge_2c.txt
~~~


#### Challenge 3

What happens if you rename `example.sh` to `example.R`?

It still runs because your claiming it as a bash script when you type `bash` before the name of the file.