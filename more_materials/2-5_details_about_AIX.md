---
title: Details about your AIX Environment
subtitle: Unique commands and accessing GUIs
minutes: 5
---

## Introduction

AIX has a vast array of commands that enable you to do a multitude of tasks.
Depending on what you need to accomplish, you use only a certain subset of
these commands. While many commands will be familiar (or identical) from a
GNU/Linux environment, there are important differences (we already encountered
one at the beginning of our config file lesson).

Another important feature of connecting to the Cornerstone AIX machine is that
you can access it not only through the command line, but also using X Windows
to enable graphical applications, and SAS Studio will allow connecting for SAS
workflows via a web browser.

## Using a GUI

For those of you who are terrified about whether you really need to use Vi,
note that you actually have access to graphical editors via MobaXterm as well.

To see this in action, choose a file and type `vs <filename>`.

## Getting details about the AIX system

Sometimes you might be curious what's going on with the system resources. This
can be a quick sanity check to figure out if it's your code or the machine
that's causing a slowdown.

### How many processors does my system have?

To display the number of processors on your system, type:

~~~
lscfg | grep proc
~~~

### How many hard disks does my system have and which ones are in use?

To display the number of hard disks on your system, type:

~~~
lspv
~~~

### How do I list information about a specific physical volume?

To find details about hdisk1, for example, run the following command:

~~~
lspv hdisk1
~~~

**How do I display statistics for all TTY, CPU, and disks?**

To display a single set of statistics for all TTY, CPU, and disks since boot, type:

~~~
iostat
~~~

To display a continuous disk report at 2-second intervals for the disk with the
logical name `disk1`, type:

~~~
iostat -d disk1 2
~~~

**How do I display local and remote system statistics?**

Type the following command:

~~~
topas
~~~

To go directly to the process display, enter:

~~~
topas -P
~~~

To go directly to the logical partition display, enter:

~~~
topas -L
~~~

To go directly to the disk metric display, enter:

~~~
topas -D
~~~

To go directly to the file system display, enter:

~~~
topas -F
~~~

To go directly to WPAR monitoring mode `abc`, enter the following command:



~~~
topas -@ abc
~~~



To go directly to the `topas` WPAR mode, enter the following command:



~~~
topas -@
~~~



**How do I report system unit activity?**

Type the following command:

~~~
sar
~~~

To report current TTY activity for each 2 seconds for the next 40 seconds,
enter the following command:

~~~
sar -y -r 2 20
~~~

To report processor activity for the first two processors, enter:

~~~
sar  -u  -P 0,1
~~~

This produces output similar to the following:

~~~
cpu  %usr  %sys  %wio  %idle
0      45    45     5      5
1      27    65     3      5
~~~

## Conclusion

Admittedly, a list such as this can be helpful in quickly answering some of
your own questions. What is the system busy doing? Is it me, or is it someone
else making things slow? However, it does not cover everything that you might
need.  You can extend the usefulness of such a list by adding other commands
that answer additional questions not addressed here.

## Resources

**Learn**

* [AIX Information
  Center](https://publib16.boulder.ibm.com/pseries/en_US/infocenter/base/):
  This website provides the latest documentation on AIX.
* [AIX Wiki](https://www.ibm.com/collaboration/wiki/display/WikiPtype/Home):
  Visit this collaborative environment for technical information related to
  AIX.
