---
title: Configuration and Dot Files
subtitle: Improving your AIX-UNIX setup
minutes: 5
---

## Intro to aliases

It is possible to customize the behavior of nearly anything you'd type at the
command line. For example the global alias in bash on Cornerstone's AIX machine
now actually calls the native AIX `df`.  The reason for this is that the GNU
`df` gets an integer overflow and displays negative values.

> - Try `\df` now and you’ll see this.
> - The alias in `/etc/bashrc` is `alias df='/usr/bin/df -g'` -- can you find
>   this line in the file?
> - We can also see the aliases in effect by typing `alias`. Try this now.

You are not stuck with these aliases. You can define your own at the command
line or in your `.bashrc` file. The same syntax is used in both cases
(remember, bash scripts are simply a file with things you might type at the
command line!).

> Create an alias now:

    $ alias ls='ls -F --color=auto'

> What happens when you type `ls` after this?

You could also override the global `ll` alias (`alias ll='ls -ltarhF
--time-style=locale'`) with something more to your liking.

A full list of aliases will be printed if you type `alias` by itself.

## A basic intro to config files

The operation of config files depends very much on the shell you are using, and
the way you log into a machine. We don't have time to discuss all the
variations here, but keep in mind that the behavior might be different in other
environments!

When we log onto our AIX machine, the "master" config file is
`~/.bash_profile`. Let's have a look at this file now. We'll see how it sources
other config files, so that we don't have to repeat ourselves (Don't Repeat
Yourself, or *DRY* is a great principle for mastering coding!).

Note in particular that we are explicitly sourcing the global configuration! If
we want to override a global configuration, we need to make sure we do it
*after* the global file is sourced.

## A particularly potent variable

The behavior of commands is also determined by the settings of *variables* (or
values that have been assigned to a given name). `PATH` is responsible for
determining what the shell does in response to *almost everything* you type.

In our environment, a good example of how this works is in the
`/opt/freeware/bin` path, which has utilities which override many of the
built-in AIX tools.

If you generally want to prefer one directory for tools, but want to override
one of them, you can use `alias`! (This is what is already done for `df`.)

## Exercise

1. Find the location where `/opt/freeware/bin` is added to `PATH`. How would
   you change things so that those programs were (temporarily) no longer
   available by default?

## Ignoring the `PATH`

Just like with the location of other files, you can also specify an *absolute*
path. Above, we used `\df` to get the old AIX version. How could we use an
absolute path?

## That's all for now folks!

We'll come back to some specific configuration items later when we focus on
Git. In particular, we'll set up git itself, and talk about how to customize
your editor.
