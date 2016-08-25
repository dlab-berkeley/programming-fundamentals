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

Within that directory, create a file called `script.sh`. 

~~~
cd my_files
touch script.sh
~~~

#### Challenge 3

Copy script.sh into `my_files/backup/`

~~~
mkdir backup
cp script.sh backup
~~~ 

#### Challenge 4

The command `ls -t` returns a listing arranged by time of last edit. Add this command to `script.sh`.

~~~
echo "ls -t" > backup/script.sh
~~~

or

~~~
nano backup/script.sh
~~~

Add the command, and type `CTRL + O` to write, press `ENTER` to save the file, and `CTRL + X` to exit.