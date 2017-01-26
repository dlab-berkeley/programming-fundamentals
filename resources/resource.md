---
title: Programming Fundamentals
subtitle: Reference
---

## [Files and Directories](1-1_filedir.md)

*   The file system is responsible for managing information on the disk.
*   Information is stored in files, which are stored in directories (folders).
*   Directories can also store other directories, which forms a directory tree.
*   `man command` or `command --help` returns information about the command. 
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
*   Most commands take options (flags) which begin with a '-'.
*   `~` stands for the user's home directory. Use it at the beginning of a path, like `~/path/to/file`
*   If you type enough letters of your command or argument, then you can press tab to have it automatically completed. 
	Double tab displays all the available options.
*	Up Arrow displays last command in the command line.

## [Creating Things](1-2-create.md)

*   `cp old new` copies a file.
*   `mkdir path` creates a new directory.
*   `mv old new` moves (renames) a file or directory.
*   `rm path` removes (deletes) a file.
*   `rmdir path` removes (deletes) an empty directory.
*   `echo "hello!"` prints the text between quotes to the shell.
*   `>` redirects the output of a command to a file.
*   `touch path` creates an empty file if it doesn't already exist.
