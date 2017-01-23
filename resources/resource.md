---
title: Programming Fundamentals
subtitle: Reference
---

# Summaries and Resources

## [Introducing the Shell](1-0_shell.md)

*   A shell is a program whose primary purpose is to read commands and run other programs.
*   The shell's main advantages are its high action-to-keystroke ratio,
    its support for automating repetitive tasks,
    and that it can be used to access networked machines.
*   The shell's main disadvantages are its primarily textual nature
    and how cryptic its commands and operation can be.

## [Files and Directories](1-1_filedir.md)

*   The file system is responsible for managing information on the disk.
*   Information is stored in files, which are stored in directories (folders).
*   Directories can also store other directories, which forms a directory tree.
*   `cd path` changes the current working directory.
*   `ls path` prints a listing of a specific file or directory;
    `ls` on its own lists the current working directory.
*   `pwd` prints the user's current working directory.
*   `whoami` shows the user's current identity.
*   `/` on its own is the root directory of the whole filesystem.
*   A relative path specifies a location starting from the current location.
*   An absolute path specifies a location from the root of the filesystem.
*   Directory names in a path are separated with '/' on Unix, but '\\' on Windows.
*   '..' means "the directory above the current one";
    '.' on its own means "the current directory".
*   Most files' names are `something.extension`.
    The extension isn't required,
    and doesn't guarantee anything,
    but is normally used to indicate the type of data in the file.
*   Most commands take options (flags) which begin with a '-'.
*   `~` stands for the user's home directory. Use it at the beginning of a path, like `~/path/to/file`
*   If you type enough letters of your command or argument, then you can press tab to have it automatically completed. 
	Double tab displays all the available options.
*	Up Arrow displays last command in the command line.
*	Copy a file/directory in the GUI and paste them into the command line to give the file/directory's full path.


## [Creating Things](1-2-create.md)

*   `cp old new` copies a file.
*   `mkdir path` creates a new directory.
*   `mv old new` moves (renames) a file or directory.
*   `rm path` removes (deletes) a file.
*   `rmdir path` removes (deletes) an empty directory.
*   `echo "hello!"` prints the text between quotes to the shell.
*   `>` redirects the output of a command to a file.
*   `touch path` creates an empty file if it doesn't already exist.
*   Unix documentation uses '^A' to mean "control-A".
*   The shell does not have a trash bin: once something is deleted, it's really gone.
*   Nano is a very simple text editor --- please use something else for real work.
*   `*` is a wildcard. It matches zero or more characters
*   Naming/structuring your files and directories in a systematic way is important. 


## Glossary

absolute path
:   FIXME

argument
:   FIXME

command shell
:   FIXME

command-line interface
:   FIXME

comment
:   FIXME

current working directory
:   FIXME

file system
:   FIXME

filename extension
:   FIXME

filter
:   FIXME

flag
:   FIXME

graphical user interface
:   FIXME

home directory
:   FIXME

loop
:   FIXME

loop body
:   FIXME

orthogonal
:   FIXME

parent
:   FIXME

pipe
:   FIXME

process
:   FIXME

prompt
:   FIXME

quoting
:   FIXME

read-evaluate-print loop
:   FIXME

redirect
:   FIXME

regular expressions
:   FIXME

relative path
:   FIXME

root directory
:   FIXME

shell script
:   FIXME

standard input
:   FIXME

standard output
:   FIXME

sub-directories
:   FIXME

tab completion
:   FIXME

variable
:   FIXME

wildcard
:   FIXME
