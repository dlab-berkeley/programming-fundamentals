---
title: Running SAS
subtitle: On the command line and the web
minutes: 5
---

## I won't belabor the point

You can run `sas` from the command line. This is how Justin McCrary, director
of the D-Lab does things (and he is super-pro with SAS). Let's have a look at
that now. If you don't have a simple SAS program handy, try this one:

```
data _null_;
file print;
put "Hello World!";
```

If we call that `hello.sas` and run `sas hello` or `sas hello.sas`, we get some
output files.

But what if we run `sas` by itself... ick! But now we know that's not a big
deal if it happens.

If you want a GUI, use the web interface. I'm not posting the URL here, but let
me know if you need it.
