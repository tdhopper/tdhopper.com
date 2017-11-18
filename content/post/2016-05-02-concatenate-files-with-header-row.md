---
title: Concatenate files with header row
slug: concatenate-files-with-header-row
aliases: [/blog/2016/May/02/concatenate-files-with-header-row/]
category: Today I Learned
date: 2016-05-02
---

I needed to concatenate a bunch of CSV files while skipping the header row. There was a nice solution on [Stack Overflow](http://stackoverflow.com/questions/10103619/unix-merge-many-files-while-deleting-first-line-of-all-files):

```
find . -name "*.csv" | xargs -n 1 tail -n +2
```

With the GNU version of `tail` (sadly not the one installed on OS X by default), you can just use

```
tail -q -n +2 *.csv
```

or

```
awk 'FNR != 1' *.csv
```