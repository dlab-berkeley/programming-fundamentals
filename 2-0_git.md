---
layout: lesson
root: ../..
title: Quick 'n' Dirty Git
---
> ## Learning Objectives
> 
> *   Explain which initialization and configuration steps are required once per machine, and which are required once per repository.
> *   Go through the modify-add-commit cycle for single and multiple files and explain where information is stored at each stage.
> *   Identify and use Git revision numbers.
> *   Compare files with old versions of themselves.
> *   Restore old versions of files.
> *   Configure Git to ignore specific files, and explain why it is sometimes useful to do so.

We'll start by exploring how version control can be used to keep track of what one person did and when. Even if you aren't collaborating with other people,
version control is much better for this than this:

<div>
  <a href="http://www.phdcomics.com"><img src="fig/phd101212s.gif" alt="Piled Higher and Deeper by Jorge Cham, http://www.phdcomics.com" /></a>
  <p>"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com</p>
</div>

Git is powerful and complicated. We can do a full day workshop on git alone. But it is also quite possible to harness it's powers by cycing through three commands: `add`, `commit`, `push`. So even if you don't understand what's going on underneath the hood, knowing just these three commands can get you very far. 

### Setting Up

The first time we use Git on a new machine, we need to configure a few things.
Here's how Dracula sets up his new laptop:

~~~ {.input}
$ git config --global user.name "Vlad Dracula"
$ git config --global user.email "vlad@tran.sylvan.ia"
$ git config --global color.ui "auto"
$ git config --global core.editor "nano"
~~~

(Please use your own name and email address instead of Dracula's, and please use the same email as you used to make your GitHub account. Make sure you choose an editor that's actually on your system, such as `gedit` on BCE.)

Git commands are written `git verb`, where `verb` is what we actually want it to do. In this case, we're telling Git:

*   our name and email address,
*   to colorize output,
*   what our favorite text editor is, and
*   that we want to use these settings globally (i.e., for every project),

The four commands above only need to be run once: the flag `--global` tells Git to use the settings for every project on this machine.

### Checking the status of a Repository

Once Git is configured, we can start using it.

If you wanted to start using Git from scratch on a new project, you can create a directory and tell Git to make it a **repository** -- a place where
Git can store old versions of our files:

~~~ {.input}
$ git init
~~~

But we don't have to do this because we already have a repository we're working with - the `programming-fundamentals` directory!

~~~ {.input}
$ cd ~/programming-fundamentals
~~~

If we use `ls -a` to show the directory's contents, we can see a hidden directory called `.git`:

~~~ {.input}
$ ls -a
~~~
~~~ {.output}
.                   1-0_shell.md        2-0_git.md
..                  1-1_fildir.md       LICENSE
.DS_Store           1-2_create.md       README.md
.git                1-3_pipe.md         data
.gitignore          1-4_loop.md         madlib.py
0-0_Introduction.md 1-5_scripts.md      resource.md
0-1_BCE.md          1-6_python.md
~~~

Git stores information about the project in this special sub-directory.
If we ever delete it, we will lose the project's history.

We can check that everything is set up correctly by asking Git to tell us the status of our project:

~~~ {.input}
$ git status
~~~

You'll see that some files have been modified and others are 'untracked.' This is from all the work we've done in the training.

### Tracking Files

`git add` tracks new files. When we typed in `git status`, we saw something like this:

~~~ {.input}
$ git status
~~~
~~~{.output}
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
# 
~~~

The "untracked files" message means that there's a file in the directory that Git isn't keeping track of. We can tell Git that it should do so using `git add`: 

To add new files, you can either type `git add [file name]` like so:

~~~ {.input}
$ git add file.txt
~~~

OR, if you want to add ALL the new files in a repository, you can use the `.` shortcut:

~~~ {.input}
$ git add .
~~~

Now if we use `git status` we should no longer see any untracked files.

**2. `git commit`: saves files**

Git now knows that it's supposed to keep track of all the files in your repo,but it hasn't yet recorded any changes you've made to those files. To get it to do that, we need to run one more command:

~~~ {.input}
$ git commit -am "Completed Shell Trainings"
~~~
~~~ {.output}
[master (root-commit) f22b25e] Completed Shell Trainings
 1 file changed, 1 insertion(+)
 create mode 100644 ...
~~~

When we run `git commit`, Git takes everything we have told it to save by using `git add` and stores a copy permanently inside the special `.git` directory. This permanent copy is called a **revision** and its short identifier is `f22b25e`. (Your revision may have another identifier.)

We use the `-a` flag (for 'all') to tell Git that we want to commit all the changes we've made to every file. If we just run the `git commit` without the `-a` option, Git will expect us to specify which file's changes we want saved.

We use the `-m` flag (for "message") to record a comment that will help us remember later on what we did and why. If we just run `git commit` without the `-m` option, Git will launch `nano` (or whatever other editor we configured at the start) so that we can write a longer message.

If we run `git status` now:

~~~ {.input}
$ git status
~~~
~~~ {.output}
# On branch master
nothing to commit, working directory clean
~~~

it tells us everything is up to date.

If we want to know what we've done recently, we can ask Git to show us the project's history using `git log`:

~~~ {.input}
$ git log
~~~
~~~ {.output}
commit f22b25e3233b4645dabd0d81e651fe074bd8e73b
Author: Vlad Dracula <vlad@tran.sylvan.ia>
Date:   Thu Aug 22 09:51:46 2013 -0400

    Completed Shell Trainings
~~~

`git log` lists all revisions  made to a repository in reverse chronological order. The listing for each revision includes the revision's full identifier
(which starts with the same characters as the short identifier printed by the `git commit` command earlier), the revision's author, when it was created, and the log message Git was given when the revision was created.

### `git push` pushes changes from one branch to another.

Systems like Git allow us to move work between any two repositories. In practice, though, it's easiest to use one copy as a central hub, and to keep it on the web rather than on someone's laptop. This is where GitHub comes in: it holds the master copy of a repository, and allows us to copy changes from one repository to another.

To copy our changes from our laptop to our GitHub repo, we can use `git push`:

~~~
$ git push origin master
~~~
~~~
Counting objects: 9, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (9/9), 821 bytes, done.
Total 9 (delta 2), reused 0 (delta 0)
To https://github.com/vlad/planets
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
~~~

This tells git to push our changes to the repository's "origin".

Now open up a web browser and navigate to your GitHub repository. What do you see?

### Collaborating

Version control really comes into its own when we begin to collaborate with other people.

To see this, let's all collaborate on one file: the resource.md file. 

~~~
$ nano resource.md
~~~

Files with the extension .md are called **markdown** files. Markdown is a markup language used to convert plain text to HTML and many other formats. It's basically a way to add markup to a text (making things bold, lists, links, etc) using very simple syntax. It is often used in README files in software packages. You may have also noticed that all of the lessons for this course are written in markdown, as is many of the text files on GitHub. You can learn more about how to write GitHub-flavored markdown [here](https://help.github.com/articles/markdown-basics/).

Now scroll down and look at the glossery. Pick a term that you learned today and add a brief definition of it. Save the file and escape back to bash.

Now if we type `git status`, we should see that resource.md is modified. To see specifically what has changed, we can use `git diff`:

### Ignoring Things

What if we have files that we do not want Git to track for us, like backup files created by our editor or intermediate files created during data analysis.
Let's create a few dummy files:

~~~ {.input}
$ mkdir results
$ touch a.dat b.dat c.dat results/a.out results/b.out
~~~

and see what Git says:

~~~ {.input}
$ git status
~~~
~~~ {.output}
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	a.dat
#	b.dat
#	c.dat
#	results/
nothing added to commit but untracked files present (use "git add" to track)
~~~

Putting these files under version control would be a waste of disk space.
What's worse, having them all listed could distract us from changes that actually matter, so let's tell Git to ignore them.

We do this by creating a file in the root directory of our project called `.gitignore`.

~~~ {.input}
$ nano .gitignore
$ cat .gitignore
~~~
~~~ {.output}
*.dat
results/
~~~

These patterns tell Git to ignore any file whose name ends in `.dat`
and everything in the `results` directory. (If any of these files were already being tracked, Git would continue to track them.)

Once we have created this file, the output of `git status` is much cleaner:

~~~ {.input}
$ git status
~~~
~~~ {.output}
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#	.gitignore
nothing added to commit but untracked files present (use "git add" to track)
~~~

The only thing Git notices now is the newly-created `.gitignore` file.
You might think we wouldn't want to track it, but everyone we're sharing our repository with will probably want to ignore the same things that we're ignoring. Let's add and commit `.gitignore`:

~~~ {.input}
$ git add .gitignore
$ git commit -m "Add the ignore file"
$ git status
~~~
~~~ {.output}
# On branch master
nothing to commit, working directory clean
~~~

As a bonus, using `.gitignore` helps us avoid accidentally adding files to the repository that we don't want.

~~~ {.input}
$ git add a.dat
~~~
~~~ {.output}
The following paths are ignored by one of your .gitignore files:
a.dat
Use -f if you really want to add them.
fatal: no files added
~~~

If we really want to override our ignore settings, we can use `git add -f` to force Git to add something. We can also always see the status of ignored files if we want:

~~~ {.input}
$ git status --ignored
~~~
~~~ {.output}
# On branch master
# Ignored files:
#  (use "git add -f <file>..." to include in what will be committed)
#
#        a.dat
#        b.dat
#        c.dat
#        results/

nothing to commit, working directory clean
~~~
