### [Files and Directories](1-1_filedir.md)
*   `man command` displays the manual page for a given command.
*   `cd path` changes the current working directory.
*   `ls path` prints a listing of a specific file or directory;
*   `pwd` prints the user's current working directory.
*   `whoami` shows the user's current identity.
*   `/` on its own is the root directory of the whole filesystem.
*   '..' means "the directory above the current one";
    '.' on its own means "the current directory".
*   Most commands take options (flags) which begin with a '-'.
*   `~` stands for the user's home directory.
*   You can press tab for autocompletion. Double tab displays all the available options.
*	Up Arrow displays last command in the command line.

### [Creating Things](1-2-create.md)
*   `cp old new` copies a file.
*   `mkdir path` creates a new directory.
*   `mv old new` moves (renames) a file or directory.
*   `rm path` removes (deletes) a file.
*   `rmdir path` removes (deletes) an empty directory.
*   `touch path` creates an empty file if it doesn't already exist.
*   `*` is a wildcard. It matches zero or more characters

### [Pipes and Filters](1-3_pipe.md)
*   `cat` displays the contents of its inputs.
*   `head` displays the first few lines of its input.
*   `tail` displays the last few lines of its input.
*   `sort` sorts its inputs.
*   `wc` counts lines, words, and characters in its inputs.
*   `cut` cuts out selected portions of each line, `-c` for character range
*   `command > file` redirects a command's output to a file.
*   `first | second` is a pipe: the output of first is used as the input to second.

### [Loops](1_4-loop.md)
*   `history` displays recent commands, and `!number` to repeat a command by number.
*   A `for` loop repeats commands once for every thing in a list.
*   Use `$name` to expand a variable (i.e., get its value).

### [Shell Scripts](1-5-script.md)
*   `bash filename` runs the commands saved in a file.
*   `$*` refers to all of a shell script's command-line parameters.
*   `$1`, `$2`, etc., refer to specified command-line parameters.
*   `$@` refer to all command-line parameters. Especially helpful for wildcards.
*   Place variables in quotes if the values might have spaces in them.