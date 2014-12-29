---
title: The Unix Shell
subtitle: Files & Directories
minutes: 5
---

> ## Learning Objectives
>
> *   Explain the similarities and differences between a file and a directory.
> *   Translate an absolute path into a relative path and vice versa.
> *   Construct absolute and relative paths that identify specific files and directories.
> *   Explain the steps in the shell's read-run-print cycle.
> *   Identify the actual command, flags, and filenames in a command-line call.
> *   Demonstrate the use of tab completion, and explain its advantages.

The part of the operating system responsible for managing files and directories is called the **file system**. It organizes our data into files, which hold information, and directories (also called "folders"), which hold files or other directories.

Several commands are frequently used to create, inspect, rename, and delete files and directories. To start exploring them, let's open a shell window:

~~~ {.input}
$
~~~

The dollar sign is a **prompt**, which shows us that the shell is waiting for input; your shell may show something more elaborate.

Type the command `whoami`, then press the Enter key (sometimes marked Return) to send the command to the shell.

The command's output is the ID of the current user, i.e., it shows us who the shell thinks we are:

~~~ {.input}
$ whoami
~~~
~~~ {.output}
oski
~~~

More specifically, when we type `whoami` the shell:

1.  finds a program called `whoami`,
2.  runs that program,
3.  displays that program's output, then
4.  displays a new prompt to tell us that it's ready for more commands.

Next, let's find out where we are by running a command called `pwd` (which stands for "print working directory").

At any moment, our **current working directory** is our current default directory, i.e., the directory that the computer assumes we want to run commands in  unless we explicitly specify something else.

Here, the computer's response is `/home/oski`, which is the **home directory**:

~~~ {.input}
$ pwd
~~~
~~~ {.output}
/home/oski
~~~

> #### Alphabet Soup
> 
> If the command to find out who we are is `whoami`, the command to find
> out where we are ought to be called `whereami`, so why is it `pwd`
> instead? The usual answer is that in the early 1970s, when Unix was
> first being developed, every keystroke counted: the devices of the day
> were slow, and backspacing on a teletype was so painful that cutting the
> number of keystrokes in order to cut the number of typing mistakes was
> actually a win for usability. The reality is that commands were added to
> Unix one by one, without any master plan, by people who were immersed in
> its jargon. The result is as inconsistent as the roolz uv Inglish
> speling, but we're stuck with it now. 
> 
> The good news is: because these basic commands were so integral to the 
> development of early Unix, they have stuck around, and appear (in some form) 
> in almost all programming languages.

To understand what a "home directory" is, let's have a look at how the file system as a whole is organized. At the top is the **root directory** that holds everything else.

We refer to it using a slash character `/` on its own; this is the leading slash in `/home/oski`.

Inside that directory are several other directories: `bin` (which is where some built-in programs are stored), `data` (holding miscellaneous data files) `etc` (where local configuration files are stored), `tmp` (for temporary files that don't need to be stored long-term), and so on.

> If you're working on a Mac, the file structure will look similar, but not 
> identical. The following image shows a file system graph for the typical Mac.

![File Directory](https://swcarpentry.github.io/shell-novice/fig/home-directories.svg)

We know that our current working directory `/home/oski` is stored inside `/home` because `/home` is the first part of its name. Similarly, we know that `/home` is stored inside the root directory `/` because its name begins with `/`.

> Notice that there are two meanings for the `/` character.
> When it appears at the front of a file or directory name,
> it refers to the root directory. When it appears *inside* a name,
> it's just a separator.

Let's see what's in Oski's home directory by running `ls`,
which stands for "listing":

~~~ {.input}
$ ls
~~~
~~~ {.output}
data       Downloads  Pictures  setup_ipython_notebook.sh
Desktop    file.txt  Public    Templates
Documents  Music      R         Videos
~~~

`ls` prints the names of the files and directories in the current directory in alphabetical order, arranged neatly into columns.

We can make its output more comprehensible by using the **flag** `-F`, which tells `ls` to add a trailing `/` to the names of directories:

~~~ {.input}
$ ls -F
~~~
~~~ {.output}
data/       Downloads/  Pictures/  setup_ipython_notebook.sh*
Desktop/    file.txt   Public/    Templates/
Documents/  Music/      R/         Videos/
~~~

Here,
we can see that `/home/home` contains nine **sub-directories**.
The names that don't have trailing slashes, like `file.txt` are plain old files.

And note that there is a space between `ls` and `-F`: without it, the shell thinks we're trying to run a command called `ls-F`, which doesn't exist.

> #### What's In A Name?
> 
> You may have noticed that all of our's files' names are "something dot
> something". This is just a convention: we can call a file `file` or
> almost anything else we want. However, most people use two-part names
> most of the time to help them (and their programs) tell different kinds
> of files apart. The second part of such a name is called the
> **filename extension**, and indicates what type of data the file holds: 
> `.txt` signals a plain text file, `.pdf` indicates a PDF document, `.cfg` is 
> a configuration file full of parameters
> for some program or other, and so on.
>
> This is just a convention, albeit an important one. Files contain
> bytes: it's up to us and our programs to interpret those bytes
> according to the rules for PDF documents, images, and so on.
>
> Naming a PNG image of a whale as `whale.mp3` doesn't somehow
> magically turn it into a recording of whalesong, though it *might*
> cause the operating system to try to open it with a music player
> when someone double-clicks it.

Now let's take a look at what's in Oski's `data` directory by running `ls -F data`, i.e., the command `ls` with the **arguments** `-F` and `data`. The second argument --- the one *without* a leading dash --- tells `ls` that
we want a listing of something other than our current working directory:

~~~ {.input}
$ ls -F data
~~~
~~~ {.output}
articles.txt  bar.txt  foo.txt  logs/  recipes/  smile.txt
~~~

The output shows us that there are four text files and two sub-sub-directories.Organizing things hierarchically in this way helps us keep track of our work: it's possible to put hundreds of files in our home directory, just as it's possible to pile hundreds of printed papers on our desk, but it's a self-defeating strategy.

Notice, by the way that we spelled the directory name `data`. It doesn't have a trailing slash: that's added to directory names by `ls` when we use the `-F` flag to help us tell things apart. And it doesn't begin with a slash because it's a **relative path**, i.e., it tells `ls` how to find something from where we are, rather than from the root of the file system.

> #### Parameters vs. Arguments
>
> According to [Wikipedia](https://en.wikipedia.org/wiki/Parameter_(computer_programming)#Parameters_and_arguments),
> the terms **argument** and **parameter** mean slightly different things.
> In practice, however, most people use them interchangeably or inconsistently,
> so we will too.

If we run `ls -F /data` (*with* a leading slash) we get a different answer,
because `/data` is an **absolute path**:

~~~ {.input}
$ ls -F /data
~~~
~~~ {.output}
access.log    backup/    hardware.cfg
network.cfg
~~~

The leading `/` tells the computer to follow the path from the root of the filesystem, so it always refers to exactly one directory, no matter where we are when we run the command.

What if we want to change our current working directory? Before we do this, `pwd` shows us that we're in `/home/oski`, and `ls` without any arguments shows us that directory's contents:

~~~ {.input}
$ pwd
~~~
~~~ {.output}
/home/oski
~~~
~~~ {.input}
$ ls
~~~
~~~ {.output}
data     Documents  file.text  Pictures  R                          Templates
Desktop  Downloads  Music      Public    setup_ipython_notebook.sh  Videos
~~~

We can use `cd` followed by a directory name to change our working directory. `cd` stands for "change directory", which is a bit misleading: the command doesn't change the directory, it changes the shell's idea of what directory we are in.

~~~ {.input}
$ cd data
~~~

`cd` doesn't print anything, but if we run `pwd` after it, we can see that we are now in `/home/oski/data`.

If we run `ls` without arguments now, it lists the contents of `/home/oski/data`, because that's where we now are:

~~~ {.input}
$ pwd
~~~
~~~ {.output}
/home/oski/data
~~~
~~~ {.input}
$ ls -F
~~~
~~~ {.output}
articles.txt  bar.txt  foo.txt  logs/  recipes/  smile.txt
~~~

We now know how to go down the directory tree: how do we go up? We could use an absolute path:

~~~ {.input}
$ cd /home/oski/
~~~

but it's almost always simpler to use `cd ..` to go up one level:

~~~ {.input}
$ pwd
~~~
~~~ {.output}
/home/oski//data
~~~
~~~ {.input}
$ cd ..
~~~

`..` is a special directory name meaning "the directory containing this one",
or more succinctly, the **parent** of the current directory. Sure enough, if we run `pwd` after running `cd ..`, we're back in `/home/oski/`:

~~~ {.input}
$ pwd
~~~
~~~ {.output}
/home/oski/
~~~

The special directory `..` doesn't usually show up when we run `ls`. If we want to display it, we can give `ls` the `-a` flag:

~~~ {.input}
$ ls -a
~~~
~~~ {.output}
.              .gnome              setup_ipython_notebook.sh
..             .ICEauthority       .subversion
.bash_history  .ipynb_checkpoints  Templates
.bash_logout   .ipython            .thumbnails
.bashrc        .local              .vboxclient-clipboard.pid
.cache         .mozilla            .vboxclient-display.pid
.config        Music               .vboxclient-draganddrop.pid
data           Pictures            .vboxclient-seamless.pid
.dbus          .pip                .vbox_version
Desktop        .pki                Videos
Documents      .profile            .Xauthority
Downloads      Public              .xsession-errors
file.txt       R                   .xsession-errors.old
.gconf         .Rhistory
.gitconfig     .rstudio-desktop
~~~

`-a` stands for "show all"; it forces `ls` to show us file and directory names that begin with `.`, such as `..` (which, if we're in `/users/nelle`, refers to the `/users` directory).

> #### Hidden Files: For Your Own Protection
> 
> As you can see, a bunch of other items just appeared when we enter `ls -a`. 
> These files and directories begin with `.` followed by a name. These are 
> usually files and directories that hold important programmatic information,
> not usually edited by the casual computer user. They are kept hidden so that
> users don't accidentally delete or edit them without knowing what they're
> doing.

As you can see, it also displays another special directory that's just called `.`, which means "the current working directory". It may seem redundant to have a name for it, but we'll see some uses for it soon.

> #### Phone Home
> 
> If you ever want to get to the home directory immediately, you can use the 
> shortcut `~`. For example, type `cd ~` and you'll get back home in a jiffy. 
> `~` will also stand in for your home directory in paths, so for instance 
> `~/data` is the same as `/home/oski/data`


### Rochelle's Pipeline: Organizing Files

Knowing just this much about files and directories, Rochelle is ready to organize the files that the protein assay machine will create. First, she creates a directory called `north-pacific-gyre` (to remind herself where the data came from). Inside that, she creates a directory called `2012-07-03`, which is the date she started processing the samples. She used to use names like `conference-paper` and `revised-results`, but she found them hard to understand after a couple of years. (The final straw was when she found herself creating a directory called `revised-revised-results-3`.)

> Nelle names her directories "year-month-day", with leading zeroes for months 
> and days, because the shell displays file and directory names in 
> alphabetical order. If she used month names, December would come before July;
> if she didn't use leading zeroes, November ('11') would come before July 
> ('7').

Each of her physical samples is labelled according to her lab's convention
with a unique ten-character ID, such as "NENE01729A". This is what she used in her collection log to record the location, time, depth, and other characteristics of the sample, so she decides to use it as part of each data file's name. Since the assay machine's output is plain text, she will call her files `NENE01729A.txt`, `NENE01812A.txt`, and so on. All 1520 files will go into the same directory.

If she is in her home directory, Nelle can see what files she has using the command:

~~~ {.input}
$ ls north-pacific-gyre/2012-07-03/
~~~

This is a lot to type, but she can let the shell do most of the work. If she types:

~~~ {.input}
$ ls nor
~~~

and then presses tab, the shell automatically completes the directory name for her:

~~~ {.input}
$ ls north-pacific-gyre/
~~~

If she presses tab again, Bash will add `2012-07-03/` to the command, since it's the only possible completion. Pressing tab again does nothing,
since there are 1520 possibilities; pressing tab twice brings up a list of all the files, and so on.

This is called **tab completion**, and we will see it in many other tools as we go on.

If you quickly need the path of a file or directory, you can also copy the file/directory in the GUI (in BCE: click on file, type `CTRL + c`) and paste it into your shell (in BCE: `CTRL + Shift + v`). The full path of the file or directory will appear. 

## Exercises

#### Challenge 1

If `pwd` displays `/users/thing`, what will `ls ../backup` display?

1.  `../backup: No such file or directory`
2.  `2012-12-01 2013-01-08 2013-01-27`
3.  `2012-12-01/ 2013-01-08/ 2013-01-27/`
4.  `original pnas_final pnas_sub`

#### Challenge 2

If `pwd` displays `/users/backup`, and `-r` tells `ls` to display things in reverse order, what command will display:
~~~
pnas-sub/ pnas-final/ original/
~~~

1.  `ls pwd`
2.  `ls -r -F`
3.  `ls -r -F /users/backup`
4.  Either \#2 or \#3 above, but not \#1.

#### Challenge 3

What does the command `cd` without a directory name do?

1.  It has no effect.
2.  It changes the working directory to `/`.
3.  It changes the working directory to the user's home directory.
4.  It produces an error message.

#### Challenge 4

What does the command `ls` do when used with the -s arguments?

#### Challenge 5

If the command `ls -a` works, and `ls -F` works, what do you think will happen if you enter `ls -a -F`? What about `ls -aF`


## Summary and Cheat Sheets

### Commands

#### 1. `pwd`

**Sumary**: Prints working directory.

**Syntax**: `pwd`

#### 2. `ls`

**Sumary**: Lists the contents of a directory.

**Syntax**: `ls [OPTION] ARGUMENT]`

**Common Flags**: To see all, click [here](http://linuxcommand.org/man_pages/ls1.html) or type `man ls` for the Linux help page. *Hint: type `q` to escape the help page and return to the shell.*

| flag | description |
| ---- | ----------- |
| -l | long format, displaying Unix file types, permissions, number of hard links, owner, group, size, last-modified date and filename |
| -f | do not sort. Useful for directories containing large numbers of files. |
| -F | appends a character revealing the nature of a file, for example, * for an executable, or / for a directory. Regular files have no suffix.|
| -a | lists all files in the given directory, including those whose names start with "." (which are hidden files in Unix). By default, these files are excluded from the list. |
| -R | recursively lists subdirectories. The command ls -R / would therefore list all files. |
| -d | shows information about a symbolic link or directory, rather than about the link's target or listing the contents of a directory. |
| -t | sort the list of files by modification time. |
| -h | print sizes in human readable format. (e.g., 1K, 234M, 2G, etc.) (may not be available on all systems) |
| -1 | show only 1 file per line. |

You can combine them, so for example `ls -a -p -t` is valid, and `ls -apt` is also valid, and shorter.

#### 3. `cd`

**Summary**: Change working directory

**Syntax**: `cd [OPION] [DIRECTORY]`

### Shortcuts

Four Shortcuts:

1. **Tab Complete**: If you type enough letters of your command or argument, then you can press tab to have it automatically completed.

2. **Up Arrow**: Pressing the up arrow will bring your last command back to the command line. Try it!

3. **`~`**: stands for your home directory.

4. **Copy + Paste Paths**: copy a directory or file in your GUI, and paste it into your shell. The full path of the directory or file will appear. 
