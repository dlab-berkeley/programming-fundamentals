---
title: The Unix Shell
subtitle: Pipes and Filters
ANSWERS
---

## Exercises

#### Challenge 1

Create a file under my_files called "sorts.txt" that contains these data

~~~
10
2
19
22
6
~~~

Sort it numerically and place the output in a file called "nsorts.txt". Then, sort it alphabetically and place the output in a file called "asorts.txt". Are these files the same? Why or why not?

~~~
cd my_files
touch sorts.txt
nano sorts.txt
~~~

add numbers

~~~
sort -n sorts.txt > nsorts.txt
sort sorts.txt > nsorts.txt
~~~

No, the are different because BASH will not sort the numbers if you sort alphabetically.

#### Challenge 2

How would you count all of the words contained in articles about asia found in data/articles/? Store this number under my_files/ in a file called "asia_count". (HINT: Look up `colrm` -- `man colrm` or `colrm --help`)

~~~
cd my_files
wc -w ../data/articles/asia*.txt | tail -1 | colrm 1 3 | colrm 6 > asia_count
~~~

#### Challenge 3

The command `uniq` removes adjacent duplicated lines from its input.
For example, if a file `salmon.txt` contains:

~~~
coho
coho
steelhead
coho
steelhead
steelhead
~~~

then `uniq salmon.txt` produces:

~~~
coho
steelhead
coho
steelhead
~~~

You have a file called `data/animals.txt` contains the following data:

~~~
deer
rabbit
raccoon
rabbit
deer
fox
rabbit
bear
~~~

Process this list such that there is only one value for each animal, and save it in a file under my_files/ called "unique_animals.txt"

~~~
sort ../data/animals.txt | uniq > unique_animals.txt
~~~