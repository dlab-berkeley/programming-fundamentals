#Setup

To participate in this workshop, you will need access to the software described below.  

Once you've installed all of the software below, test your installation by following the instructions at the bottom on this page.

## 1. The Bash Shell
Bash is a commonly-used shell that gives you the power to do simple tasks more quickly.

#### Windows

Install Git for Windows by downloading and running the [installer](http://msysgit.github.io/). This will provide you with both Git and Bash in the Git Bash program. **NOTE**: on the ~6th step of installation, you will need to select the option "Use Windows' default console window" rather than the default of "Use MinTTY" in order for nano to work correctly.

After the installer does its thing, it leaves the window open, so that you can play with the "Git Bash".

Chances are that you want to have an easy way to restart that Git Bash. You can install shortcuts in the start menu, on the desktop or in the QuickStart bar by calling the script /share/msysGit/add-shortcut.tcl (call it without parameters to see a short help text).

#### Mac OS X

The default shell in all versions of Mac OS X is bash, so no need to install anything. You access bash from the Terminal (found in `/Applications/Utilities`). You may want to keep Terminal in your dock for this class.

#### Linux

The default shell is usually Bash, but if your machine is set up differently you can run it by opening a terminal and typing bash. There is no need to install anything.

##2. Text Editors
When you're writing code, it's nice to have a text editor that is optimized for writing code, with features like automatic color-coding of key words. The default text editor on Mac OS X and Linux is usually set to Vim, which is not famous for being intuitive. if you accidentally find yourself stuck in it, try typing the escape key, followed by `:q!` (colon, lower-case 'q', exclamation mark), then hitting Return to return to the shell.

For this class, we use **nano** as a default in the terminal. But I also really like [Sublime Text](https://www.sublimetext.com/) to write markdown and other basic text files. I recommend you download both.

####Windows

nano is a basic editor and the default that we use in this class. To install it, download the `Software Carpentry Windows installer`[http://files.software-carpentry.org/SWCarpentryInstaller.exe] and double click on the file to run it. **This installer requires an active internet connection.**

Sublime Text is a more advanced editor. Download Sublime Text 3 [here](https://www.sublimetext.com/3).

####Mac OS X

nano is a basic editor and the default that we use in this class. It should be pre-installed.

Sublime Text is a more advanced editor. Download Sublime Text 3 [here](https://www.sublimetext.com/3).

####Linux

nano is a basic editor and the default that we use in this class. It should be pre-installed.

Sublime Text is a more advanced editor. Download Sublime Text 3 [here](https://www.sublimetext.com/3).

##Testing your installation

If you have trouble with installation, please come to the Installfest [TBD].

Open a command line window ('terminal' or, on windows, 'git bash'), and enter the following commands (without the $ sign): 

```bash
$ nano --version
```

Those commands *should* print output version information.

Software Carpentry maintains a list of common issues that occur during installation may be useful for our class here: [Configuration Problems and Solutions wiki page.](https://github.com/swcarpentry/workshop-template/wiki/Configuration-Problems-and-Solutions)

Credit: Thanks to [Software Carpentry](http://software-carpentry.org/workshops/) for providing installation guidelines.
