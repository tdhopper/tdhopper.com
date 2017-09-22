---
title: Column binding two Panda's Dataframes
slug: column-binding-two-panda's-dataframes
aliases: [/blog/2016/Apr/11/column-binding-two-panda's-dataframes/]
categories:
  - "Today I Learned"
date: 2016-04-11
---

Joining two Pandas DataFrames with an equal number of rows is slightly harder than it appears. In R, you just use the `cbind` function.

As [this](http://stackoverflow.com/questions/33088010/pandas-column-bind-cbind-two-data-frames) StackOverflow question shows, in Pandas it's easy to end up with something like this:

```
    unique_id lacet_number    latitude  longitude
0         NaN          NaN  -93.193560  31.217029
1         NaN          NaN  -93.948082  35.360874
2         NaN          NaN -103.131508  37.787609
15    5570613  TLA-0138365         NaN        NaN
24    5025490  EMP-0138757         NaN        NaN
36    4354431  DXN-0025343         NaN        NaN
```

This results from the indices not being identical. Frustratingly (to me) the `ignore_index` argument doesn't give the 3-rowed DataFrame I'd hope it gives.

As the [accepted answer](http://stackoverflow.com/a/33088410/982745) on that question shows, the thing to do is reset the indices on the DataFrames before concatenating:

```python
pd.concat([df_a.reset_index(drop=True), df_b.reset_index(drop=True)], axis=1)
```