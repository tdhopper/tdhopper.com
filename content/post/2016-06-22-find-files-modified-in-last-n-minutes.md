---
title: Find Files Modified in last N Minutes
slug: find-files-modified-in-last-n-minutes
aliases: [/blog/2016/Jun/22/find-files-modified-in-last-n-minutes/]
category: Today I Learned
date: 2016-06-22
---

I've been using Bash's [`find`](http://www.freebsd.org/cgi/man.cgi?find(1)) command a lot more regularly lately. I've always been scared off by its syntax, but it's great once you've learned it.

Today I learned how to filter the results by files changed in the last N minutes: the `cmin` flag:

```
 -cmin [-|+]n
 True if the difference between the time of last change of file
 status information and the time find was started, rounded up to
 the next full minute, is more than n (+n), less than n (-n), or
 exactly n minutes ago.
```

For example:

```
find . -cmin +5 # Files modified more than 5 minutes ago
find . -cmin -5 # Files modified less than than 5 minutes ago
find . -cmin  5 # Files modified exactly 5 minutes ago
```