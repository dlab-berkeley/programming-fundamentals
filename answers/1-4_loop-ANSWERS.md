---
title: The Unix Shell
subtitle: Loops
ANSWERS
---

## Exercises

#### Challenge 1

Suppose that `ls` initially displays:

~~~
fructose.dat    glucose.dat   sucrose.dat
~~~

What is the output of:

~~~
for datafile in *.dat
do
    ls *.dat
done
~~~

Now test your theory and redirect your answer to `programming-fundamentals/my_files/challenge_1.txt`!

~~~
cd my_files
mkdir sugar
touch sugar/fructose.dat    sugar/glucose.dat   sugar/sucrose.dat
for datafile in sugar/*.dat
do
    ls *.dat
done > challenge_1.txt
~~~

#### Challenge 2

What is the effect of this loop if each .dat file contains only the word `sugar`?

~~~
for sugar in fructose.dat glucose.dat sucrose.dat
do
    echo $sugar
    cat $sugar > xylose.dat
done
~~~

Now test your theory and redirect the output to `programming-fundamentals/my_files/challenge_2.txt`, use `nano` to edit the file and append the contents of `xylose.dat` to your `challenge_2.txt`.

~~~
cd my_files/sugar
for filename in *.dat
do
    echo "sugar" > $filename
done
for sugar in fructose.dat glucose.dat sucrose.dat
do
    echo $sugar
    cat $sugar > xylose.dat
done > ../challenge_2.txt
cat ../challenge_2 xylose.dat > ../challenge_2.txt
~~~


#### Challenge 3

The `expr` does simple arithmetic using command-line parameters:

~~~
$ expr 3 + 5
8
$ expr 30 / 5 - 2
4
~~~

Given this, what is the output of:

~~~
for left in 2 3
do
    for right in $left
    do
        expr $left + $right
    done
done
~~~

Now test your theory and redirect your answer to `programming-fundamentals/my_files/challenge_3.txt`!

~~~
cd my_files
for left in 2 3
do
    for right in $left
    do
        expr $left + $right
    done
done > challenge_3.txt
~~~
