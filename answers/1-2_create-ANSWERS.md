---
title: The Unix Shell
subtitle: Creating Things
ANSWERS
---

## Exercises

#### Challenge 1

`cd` into `programming-fundamentals`. Create a directory called `my_files`. 

~~~
cd Desktop/programming-fundamentals
mkdir my_files
~~~

#### Challenge 2

Within that directory, create a file called `my_script.R`. 

~~~
cd my_files
touch my_script.R
~~~

#### Challenge 3

Create a directory `my_files/backup/` and copy `my_script.R` into `my_files/backup/`.

~~~
mkdir backup
cp script.sh backup
~~~ 

#### Challenge 4

Have the script in `my_files` print "I love programming!" to the command line.

~~~
echo "print('I love programming!')" > my_script.R
~~~

or

~~~
vim my_script.R
~~~

Add the command, and type `Esc` and `:wq` to write and quit.