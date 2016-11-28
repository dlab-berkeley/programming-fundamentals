---
title: The Unix Shell
subtitle: Loops
ANSWERS
---

## Exercises

#### Challenge 1

The `expr` does simple arithmetic using command-line parameters:

~~~
$ expr 3 + 5
8
$ expr 30 / 5 - 2
4
~~~

Try to create an arithmetic expression that uses variables. First, create a variable called `x1` assigned the value `1`. Then create a variable called `x2` with value `2`. (In other words, instead of creating a filename variable with the name of a text file, we're creating a variable that just stores a number.)

Then use those two variables and the `expr` command to calculate the sum of 1 + 2. Redirect the output to `programming-fundamentals-master/my_files/challenge_1.txt`.

~~~
x1=1
x2=2
expr $x1 + $x2 > my_files/challenge_1.txt
~~~

#### Challenge 2

Now create a for loop that iterates through a list of numbers from 1 through 5, and calculates the first five even numbers. (You can add each number to itself, or use the multiplication symbol `\*`.)

Redirect the output to `programming-fundamentals-master/my_files/challenge_2.txt`. (You can redirect output line-by-line and append it to the end of an existing file using `>>`, or redirect all output from the entire for loop by using `>` right after `done`.)

~~~
for x in 1 2 3 4 5
do
    expr $x \* 2
done > my_files/challenge_2.txt
~~~


#### Challenge 3

What is the output of:

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
done > my_files/challenge_3.txt
~~~
