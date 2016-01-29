---
title: Networked Environments
subtitle: Terminal-based text editors
minutes: 5
---

# Terminal environs create some unexpected constraints

## Notepad++ won't help you here

In a shared server setting, managing hundreds of graphical user login sessions
is a lot of overhead that could be spend on computation instead. That's okay
though - unless you are processing images, a windowed (not Windows) environment
is not really necessary.

However, this means we need a way to edit files that exists in a terminal. We
can use a simple editor like `nano`, though we can be more productive by using
a powerful program like `vi`. There is good news and bad news about this.

## The good news

1. Vi is everywhere

    Just about every Unix system on the planet comes with Vi pre-installed. If
    you keep using Unix, you will end up in a Vi session at some point. You
    should at least know how to make minor edits and exit cleanly!

2. Vi is customizable

    The auto-linting (style and error checking), tab-completion, and syntax
    highlighting that you love about your favorite IDE all started in Vi.

3. Vi is fast

    Your hands never need to leave the keyboard in Vi, and complex tasks like
    cutting three lines of code and moving them to beginning of the last line
    in the document is **only five** keystrokes.

## The bad news

1. Vi has a very steep learning curve

    For example, the first thing that happens when you enter the Vi text editor
    is that you are unable to type.

## This is counterintuitive

But there is a logic behind it. Most of what you do in a text editor is not
inserting text character by character (also called typing). It's a lot of
cutting and pasting, and moving things around. These take a long time in
windowed text editors but you have to move your hands, search through the
document, click and drag, right click, select cut, search through the document
again, right click again, and select paste. Vi (and other terminal editors)
have put all kinds of useful functions like this in other `modes`, like
`command` and `ex`. If you want to type, you need to go into `insert mode`.

Another way to think about this is that your windowed text editor is like a Vi
that you can't command because it is permanently stuck in `insert mode`.

# A brief guide to Vi

## Starting the editor

You start Vi (or Vim, the modern Vi), with:

~~~{ .input}
vi
~~~

You should see something like this:

~~~{ .output}
~                              VIM - Vi IMproved                                
~                                                                               
~                                 version 7.3                                   
~                           by Bram Moolenaar et al.                            
~                 Vim is open source and freely distributable                   
~                                                                               
~                        Sponsor Vim development!                          
~                type  :help sponsor<Enter>       for information                  
~                                                                               
~                type  :q<Enter>               to exit                          
~                type  :help<Enter>  or  <F1>  for on-line help                 
~                type  :help version7<Enter>   for version info                 
~                                                              
~~~

## Quitting the editor

Because Vi is the defualt terminal editor on most systems, you'll frequently
find yourself in a situation where you need to quit Vi, even if you don't know
how to use/quit Vi.

If you take nothing else from this lesson, remember that you quit Vi with:

~~~{ .input}
:q<enter>
~~~

And you rage-quit (or force-quit, if you are feeling like a Jedi) with:

~~~{ .input}
:q!<enter>
~~~

## Changing your mode

To enter `insert mode`, use:

~~~{ .input}
i
~~~

Now Vi is the kind of text editor you are used to. Use the keys to enter text,
<enter> to start a new line, etc. Try entering a few lines of code, just for
fun.

In Vi, you'll spend most of your time in command mode. To get back, simply hit
the `ESC` key.

## Writing to disk

When you enter text in Vi, it exists in a buffer in memory. If you rage-quit
Vi, you'll lose all the work you've done. To move your work from memory into
disk, make sure you are in command mode, and then type:

~~~{ .input}
:w <filename><enter>
~~~

The `:` puts you in `ex` mode, where you can do things like write to disk and
quit the editor.

You should see something like:

~~~{ .outptu}
"<filename>" [New] 1L, 15C written
~~~

## Getting around in command mode

Quit Vi (do you remember how?)

Now, we are going to open it again, but this time with a filename.

~~~{ .input}
vi day_one/1-0_shell.md
~~~

This is the day one lesson on how to use the shell.

To move the cursor one space in any direction, use the keys `h`,`j`,`k`, and
`l`. We'll let you figure out how each one moves the cursor. Or, if you prefer
to read, you can always invoke the following:

~~~{ .input}
:h<enter>
~~~

This is short for `:help`, and will tell you what a bare `h` does (in command
mode) in addition to how to close the help window!

## Deleting Things

In `insert mode`, characters can be deleted using the `backspace` key

In `command mode`, there are two ways to delete text.

1. Use `x` to delete only the character under the cursor
2. Use `dd` to delete an entire line

## Challenge 1

Look at the yaml header of this file. It says that the lesson takes 5 minutes.
How would you delete that line in command mode? What if you didn't want that
key:value pair to show up at all?

## Dancing around words in Vi

What makes Vi really cool is the commands for navigating to specific parts of a
line

* To get to the start of a line, use `0`. `$` is the end of the line.
* `w` gets you to the first char of the next word
* `b` gets you to the first char of the last word
* `e` gets you to the last char of the next word

Try these out in your terminal. How does Vi define *word*?

By anything that isn't a `[a-zA-z]`! This means that punctuation counts as a
separate word. To include puncts in words, use capped versions of those
commands. E.g. `W` gets you to the next word+punct, like an entire URL.

## Dancing around documents in Vi

Vi also gives you ways to navigate to specific parts of a document.

* `(` and `)` move you to the previous or next sentence, respectively
* `{` and `}` move you to the previous or next paragraph, respectively
* `G` moves you to the end of the document
* `1G` moves you to the first line of your document
* `/dillon` moves you to the first occurrence of 'dillon'
* `n` moves you to the next 'dillon', and `N` moves you to the previous 'dillon'

*Many of these idioms transfer over to `less`, which is what you'll often find
yourself in for, e.g., man pages. For example, you can type a number to
multiply a press of the spacebar, or search with `/`.*

## Repeating and combining commands

One of the things that makes Vi really powerful is the ability to repeat and combine commands.

You can repeat commands by prepending a number in front of the command. What do you think this does?

~~~{ .input}
10w
~~~

It should move you ten little words forward.

Commands can be combined by concatenating them. What do you think this does?

~~~{ .input}
d{
~~~

## Challenge 2

How would you jump to line 98, and delete the second sentence?  What about the
image link at the start of the document?

---

Adapted from: [Gentoo Wiki](https://wiki.gentoo.org/wiki/Vim/Guide)
