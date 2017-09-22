---
title: Install Apache Storm with Conda
categories:
  - "Today I Learned"
date: 2016-05-13
slug: install-apache-storm-with-conda
aliases: [/blog/2016/May/13/install-apache-storm-with-conda/]
---

I'm looking into using [Apache Storm](http://storm.apache.org/ "Apache Storm") for a project, and I've been fiddling with several different versions in my local testing environment.

I made this easier for myself by adding binaries for Storm 0.10.1 and Storm 1.0.1 to my [Anaconda.org](http://www.anaconda.org) channel. That means you can add the Storm binary to your path with

```
conda install -c tdhopper apache-storm=1.0.1
```

or

```
conda install -c tdhopper apache-storm=0.10.1
```