---
title: Introduction to R and Python
subtitle: Command Line R and Python
minutes: 20
---

# R and Python

> ## Learning Objectives
>
> *   Understand the similarities, differences, strengths, and weaknesses of R and Python.
> *   Interact through the shell with the R and Python interpreters.
> *   Assign and understand variable assignment.

### Which should I learn?

While it is very important to stress that you can do nearly everything you do in one language in the other, each language certainly excels at different tasks. It is important to remember the philosophy behind each language, which is the reason for its development toward, and suitability for, different tasks.

Similarities:

* Interpreted
* High-level
* Large open-source repository (R: [CRAN](https://cran.r-project.org), Python: [PyPi](https://pypi.python.org/pypi))
* Widely used in data science and academia

| R  | Python  |
|---|---|
| - Written *by* and *for* statisticians  | - General purpose, easily written, easily read, easily learned  |
| - [R Studio](https://www.rstudio.com) GUI  | - Text Editors, IDEs, and the [Jupyter](http://jupyter.org) Notebook  |
| - Quick statistical analyses | - Easy text (string) manipulation |
| - Beautiful, easy plotting (ggplot) | - More difficult plotting (matplotlib) |
| - More difficult webscraping and API work | - Easy, streamlined webscraping and API work, build websites and apps(Flask, Django) |
| - Though changing, R has traditionally been used in academia and data science | - Python is used in all sorts of programming domains |
| - Slower than Python at scale | - Faster than R at scale |


See this [blog post](https://www.datacamp.com/community/tutorials/r-or-python-for-data-analysis#gs.S_vlpQU) for a great comparison of the two languages!

### R and Python in the shell

Let's open up two shells side-by-side, and type `R` in one and `ipython` in the other. Both can be used just like calculators, try some basic math such as `5 + 2` or `10 * 20` in either.

### Defining variables in R and Python.

We can also store information by defining a *variable*, which we can then refer to whenever we want to use that value again.

In R this is done with `<-`:

~~~
> my_var <- 5
~~~

In Python, variables are assigned with `=`:

~~~
In [1]: my_var = 5
~~~

Now try the same mathematical opertors using my_var and another number.

