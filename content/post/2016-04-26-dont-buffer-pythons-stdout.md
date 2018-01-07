---
title: Don't Buffer Python's stdout
slug: don't-buffer-python's-stdout
aliases: [/blog/2016/Apr/26/dont-buffer-pythons-stdout/]
category: Today I Learned
date: 2016-04-26
---

I was using `[tee](http://man7.org/linux/man-pages/man1/tee.1.html)` with a long running Python process, but I wasn't seeing any output. This is a result of Python buffering the stdout stream. You can run force Python to run in [unbuffered mode](https://docs.python.org/2/using/cmdline.html#cmdoption-u) using the `-u` flag at the command line.

> Force stdin, stdout and stderr to be totally unbuffered. On systems where it matters, also put stdin, stdout and stderr in binary mode.


