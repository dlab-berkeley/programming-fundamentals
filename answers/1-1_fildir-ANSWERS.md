---
title: The Unix Shell
subtitle: Files & Directories
ANSWERS
---

## Exercises

#### Challenge 1

If `pwd` displays `/home/oski/Desktop/programming-fundamentals/data/articles`, what will `ls ../downloads` display?

2.  `human-rights-2000.TXT  	human-rights-2004.TXT  	human-rights-2008.TXT
     human-rights-2001.TXT  	human-rights-2005.TXT  	human-rights-2009.TXT
     human-rights-2002.TXT  	human-rights-2006.TXT  	split_ln.py
     human-rights-2003.TXT  	human-rights-2007.TXT`


#### Challenge 2

If `pwd` displays `/home/oski/Desktop/programming-fundamentals`, and `-r` tells `ls` to display things in reverse order, what command will display:

~~~
test/  			      1-5_scripts.md 		1-0_shell.md
resource.md    		  1-4_loop.md    		0-2_help.md
data/  			      1-3_pipe.md    		0-1_BCE.md
README.md      		  1-2_create.md  		0-0_Introduction.md
LICENSE			      1-1_fildir.md
~~~

4.  Either \#2 or \#3 above, but not \#1.

#### Challenge 3

What does the command `cd` without a directory name do?

3.  It changes the working directory to the user's home directory.

#### Challenge 4

What does the command `ls` do when used with the `-s` arguments? What about `-l`?

`ls -s`: From `man ls`: Display the number of file system blocks actually used by each file, in units of 512 bytes, where partial units are rounded up to the next integer value.  If the output is to a terminal, a total sum for all the file sizes is output on a line before the listing. The environment variable BLOCKSIZE overrides the unit size of 512 bytes.

`ls -l`: From `man ls`: (The lowercase letter ``ell''.)  List in long format. (See below.)  If the output is to a terminal, a total sum for all the file sizes is output on a line before the long listing. If the -l option is given, the following information is displayed for each file: file mode, number of links, owner name, group name, number of bytes in the file, abbreviated month, day-of-month file was last modified, hour file last modified, minute file last modified, and the pathname.  In addition, for each directory whose contents are displayed, the total number of 512-byte blocks used by the files in the directory is displayed on a line by itself, immediately before the information for the files in the directory.  If the file or directory has extended attributes, the permissions field printed by the -l option is followed by a '@' character.  Otherwise, if the file or directory has extended security information (such as an access control list), the permissions field printed by the -l option is followed by a '+' character.
