---
title: Filter by date in a Pandas MultiIndex
slug: filter-by-date-in-a-pandas-multiindex
aliases: [/blog/2016/Nov/08/filter-by-date-in-a-pandas-multiindex/]
category: Today I Learned
date: 2016-11-08
---

I always forget how to do this.

The pandas `DataFrame.loc` method allows for _label_-based filtering of data frames. The [Pandas docs](http://pandas.pydata.org/pandas-docs/stable/advanced.html#advanced-indexing-with-hierarchical-index) show how it can be used to filter a `MultiIndex`:

```
In [39]: df
Out[39]:
                     A         B         C
first second
bar   one     0.895717  0.410835 -1.413681
      two     0.805244  0.813850  1.607920
baz   one    -1.206412  0.132003  1.024180
      two     2.565646 -0.827317  0.569605
foo   one     1.431256 -0.076467  0.875906
      two     1.340309 -1.187678 -2.211372
qux   one    -1.170299  1.130127  0.974466
      two    -0.226169 -1.436737 -2.006747

In [40]: df.loc['bar']
Out[40]:
               A         B         C
second
one     0.895717  0.410835 -1.413681
two     0.805244  0.813850  1.607920

In [41]: df.loc['bar', 'two']
Out[41]:
A    0.805244
B    0.813850
C    1.607920
Name: (bar, two), dtype: float64
```

It turns out you can easily use it to filter a `DateTimeIndex` level by a single date with `df['2016-11-07']` or a range of dates with `df['2016-11-07:2016-11-11']`. This applies whether or not its a `MultiIndex`.

If you get an error like `KeyError: 'Key length (1) was greater than MultiIndex lexsort depth (0)'`, it's because "MultiIndex Slicing requires the index to be fully lexsorted". You may fix your problem by calling `df = df.sort_index()`.