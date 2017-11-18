---
title: Distribution of Number of Tables in Chinese Restaurant Process
category: Article
date: 2015-09-15
slug: distribution-of-number-of-tables-in-chinese-restaurant-process
aliases: [/blog/2015/Sep/15/distribution-of-number-of-tables-in-chinese-restaurant-process/]
---

The Chinese Restaurant Process (related to the [Dirichlet process](https://github.com/tdhopper/notes-on-dirichlet-processes/)) often comes up in Bayesian nonparametrics. Some related MCMC algorithm require drawing samples from the distribution of tables created by a Chinese restaurant process with parameter after a given number of patrons are seated. Of course, you could sample from this distribution by simulating the CRP and counting tables, however [Antoniak](http://www.cis.upenn.edu/~taskar/courses/cis700-sp08/papers/antoniak.pdf) provided a closed form of the probability mass function. [Here](http://www.cs.cmu.edu/~tss/antoniak.pdf) is a helpful introduction to the "Antoniak equation".

I wrote some [quick and dirty Python code to sample from the Antoniak distribution](https://github.com/tdhopper/notes-on-dirichlet-processes/blob/master/2015-09-21-antoniak.py). It's based Matlab code [by Yee Whye Teh](http://www.stats.ox.ac.uk/~teh/software.html).