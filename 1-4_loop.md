---
title: The Unix Shell
subtitle: Loops
minutes: 15
---

# The Unix Shell: Loops and Repeating Things

> ## Learning Objectives
>
> *   Write a loop that applies one or more commands separately to each file in a set of files.
> *   Trace the values taken on by a loop variable during execution of the loop.
> *   Explain the difference between a variable's name and its value.
> *   Explain why spaces and some punctuation characters shouldn't be used in files' names.
> *   Demonstrate how to see what commands have recently been executed.
> *   Re-run recently executed commands without retyping them.

Wildcards and tab completion are two ways to reduce typing (and typing mistakes). Another is to tell the shell to do something over and over again.

Wildcards and tab completion are two ways to reduce typing (and typing mistakes). Another is to tell the shell to do something over and over again.

Let's go back to our programming-fundamentals/data/articles directory, where we have over 1000 text articles on different regions of the world.

Let's say we'd like to make a backup directory called 'backup' and copy our articles in there, renaming each one `original-africa1.txt` and `original-africa2.txt`.

First we can make a directory and copy our files:

~~~ {.input}
$ cd ~/programming-fundamentals/data/articles
$ mkdir backup
$ cp *.txt backup
$ ls backup
~~~

So far so good. But when we try to rename the files, we can't use:

~~~ {.input}
$ cd backup
$ mv *.txt original-*.txt
~~~

because that would expand to:

~~~ {.input}
$ mv africa1.txt africa2.txt ... west999.txt original-*.txt
~~~

This wouldn't back up our files, instead we get an error

~~~ {.error}
mv: target `original-*.txt' is not a directory
~~~

This is because there are no files matching the wildcard `original-*.txt`.
In this case, Bash passes the unexpanded wildcard as a parameter to the `mv` command.

### Loops

Instead, we can use a **loop** to do some operation once for each thing in a list. Here's a simple example that displays the word counts of each file in turn:


~~~ {.input}
$ for filename in africa1.text africa2.txt
 do
    wc -w $filename
 done
~~~
~~~ {.output}
 539 africa1.txt
 243 africa2.txt
~~~

When the shell sees the keyword `for`, it knows it is supposed to repeat a command (or group of commands) once for each thing in a list. In this case, the list is the two filenames.

### Variables

Each time through the loop, the name of the thing currently being operated on is assigned to the **variable** called `filename`. Inside the loop, we get the variable's value by putting `$` in front of it: `$filename` is `africa1.txt` the first time through the loop, `africa2.txt` the second, and so on.

By using the dollar sign we are telling the shell interpreter to treat `filename` as a variable name and substitute its value on its place, but not as some text or external command. When using variables it is also  possible to put the names into curly braces to clearly delimit the variable name: `$filename` is equivalent to `${filename}`, but is different from `${file}name`. You may find this notation in other people's programs.

Finally, the command that's actually being run is our old friend `wc`,
so this loop prints out the word count of each data file in turn.

> #### Follow the Prompt
>
> The shell prompt changes from `$` to `>` and back again as we were
> typing in our loop. The second prompt, `>`, is different to remind
> us that we haven't finished typing a complete command yet.

We have called the variable in this loop `filename` in order to make its purpose clearer to human readers. The shell itself doesn't care what the variable is called; if we wrote this loop as:

~~~ {.input}
$ for x in africa1.text africa2.txt
 do
    wc -w $x
 done
~~~

or:

~~~ {.input}
$ for temperature in africa1.text africa2.txt
 do
    wc -w $temperature
 done
~~~

it would work exactly the same way. *Don't do this.* Programs are only useful if people can understand them, so meaningless names (like `x`) or misleading names (like `temperature`) increase the odds that the program won't do what its readers think it does.

### More Loops

Here's a slightly more complicated loop:

~~~ {.input}
for filename in africa*.txt
do
    echo $filename
    tail -1 $filename | wc -w
done
~~~
~~~ {.output}
...
africa97.txt
     515
africa98.txt
     653
africa99.txt
     597
~~~

The shell starts by expanding `africa*.txt` to create the list of files it will process. The **loop body** then executes two commands for each of those files. The first, `echo`, just prints its command-line parameters to standard output. For example:

~~~ {.input}
$ echo hello there
~~~

prints:

~~~ {.output}
hello there
~~~

In this case, since the shell expands `$filename` to be the name of a file, `echo $filename` just prints the name of the file. Note that we can't write this as:

~~~ {.input}
for filename in africa*.txt
do
    $filename
    tail -1 $filename | wc -w
done
~~~

because then the first time through the loop, when `$filename` expanded to `africa1.txt`, the shell would try to run `africa1.txt` as a program. Finally, the `tail` and `wc` combination computes the word count of the last line of each file.

> #### Spaces in Names
>
> Filename expansion in loops is another reason you should not use spaces in
> filenames. Suppose our data files are named:
>
> ~~~
> basilisk.dat
> red dragon.dat
> unicorn.dat
> ~~~
>
> If we try to process them using:
>
> ~~~
> for filename in *.dat
> do
>     head -100 $filename | tail -20
> done
> ~~~
>
> then the shell will expand `*.dat` to create:
>
> ~~~
> basilisk.dat red dragon.dat unicorn.dat
> ~~~
>
> With older versions of Bash, or most other shells, `filename` will then be
> assigned the following values in turn:
>
> ~~~
> basilisk.dat
> red
> dragon.dat
> unicorn.dat
> ~~~
>
> That's a problem: `head` can't read files called `red` and `dragon.dat`
> because they don't exist, and won't be asked to read the file
> `red dragon.dat`.
>
> We can make our script a little bit more robust
> by **quoting** our use of the variable:
>
> ~~~
> for filename in *.dat
> do
>     head -100 "$filename" | tail -20
> done
> ~~~
>
> but it's simpler just to avoid using spaces (or other special characters) in
> filenames.

### A Loopy Solution

Going back to our original file renaming problem, we can solve it using this loop:

~~~ {.input}
for filename in *.txt
do
    mv $filename original-$filename
done
~~~

This loop runs the `mv` command once for each filename. The first time, when `$filename` expands to `africa1.txt`, the shell executes:

~~~ {.input}
mv africa1.txt original-africa1.txt
~~~

The second time, the command is:

~~~ {.input}
mv africa2.txt original-africa2.txt
~~~

> #### Measure Twice, Run Once
>
> A loop is a way to do many things at once --- or to make many mistakes at
> once if it does the wrong thing. One way to check what a loop *would* do
> is to echo the commands it would run instead of actually running them.
> For example, we could write our file renaming loop like this:
>
> ~~~
> for filename in *.txt
> do
>     echo mv $filename original-$filename
> done
> ~~~
>
> Instead of running `mv`, this loop runs `echo`, which prints out:
>
> ~~~
> mv africa1.txt original-africa1.txt
> mv africa2.txt original-africa2.txt
> ~~~
>
> *without* actually running those commands. We can then use up-arrow to
> redisplay the loop, back-arrow to get to the word `echo`, delete it, and
> then press "enter" to run the loop with the actual `mv` commands. This
> isn't foolproof, but it's a handy way to see what's going to happen when
> you're still learning how loops work..

### History

Another way to repeat previous work is to use the `history` command to get a list of the last few hundred commands that have been executed, and then to use `!123` (where "123" is replaced by the command number) to repeat one of those commands. For example, if Rochelle types this:

~~~
$ history | tail -5
  474  for filename in *.txt; do sed -i".bak" '1d' $filename; done
  475  cat africa1.txt
  476  rm *.bak
  477  history | tail -5
~~~

then she can re-run `cat africa1` simply by typing `!475`.

## Exercises

### Challenge 1

We've been using bash to print a lot of things to the screen. Write a script
that prints the count number of each kind of animal in data/animals.txt, and
save it in my_files/script.sh (hint: use `uniq`, but that won't be enough!).

#### Challenge 2

Write a shell script called `longest.sh` that takes the name of a directory and
a filename extension as its parameters, and prints out the number of lines and
name of the file with the most lines in that directory with that extension. For
example:

~~~
> bash my_files/longest.sh /tmp/data pdb
~~~

would print the name of the `.pdb` file in `/tmp/data` that has
the most lines.

#### Challenge 3

Joel's `data` directory contains three files: `fructose.dat`, `glucose.dat`,
and `sucrose.dat`. Explain what a script called `example.sh` would do when run
as `bash example.sh *.dat` if it contained the following lines:

~~~
# Script 1
echo *.*
~~~

~~~
# Script 2
for filename in $1 $2 $3
do
    cat $filename
done
~~~

~~~
# Script 3
echo $@.dat
~~~

#### Challenge 4

What happens if you rename `example.sh` to `example.R`?

When you feel you have met these challenges successfully, cd into test/ and
type

~~~ {.input}
. 1-5_test.sh
~~~

---

Adapted from: [Software Carpentry](http://software-carpentry.org/v5/novice/shell/05-script.html)
