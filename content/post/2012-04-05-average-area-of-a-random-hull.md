---
title: Average Area of a Random Hull
category: Article
date: 2012-04-05
Author: Tim
slug: average-area-of-a-random-hull
aliases: [/blog/2012/Apr/05/average-area-of-a-random-hull/]
---

Yesterday, someone on MathOverflow asked

> Consider $n$ points generated randomly and uniformly on a unit square. What is the expected value of the area (as a function of $n$) enclosed by the convex hull of the set of points?

Someone quickly cited [2004 paper](http://www.math.kth.se/~johanph/area12.pdf) provides an analytical result for the cases where $n=3$ and $n=4$:

> For $n=3$ the expected value is $11/144$ and for $n=4$ it is $11/72$.

This is certainly a nontrivial result. However, the value can be approximated by generating a large number of random points, finding the area of the convex hull, and averaging the areas. Of course, finding the convex hull and the area of the convex hull of a set of points requires a little work. Mathematica provides functions for generating random points and finding the area of the convex hull of a set of points quickly. As a result, I was able to perform a Monte Carlo simulation for the $n=3$ and $n=4$ case in a couple of lines of Mathematica code:

[![](/uploads/2012/04/Screen-Shot-2012-04-04-at-11.29.04-AM.png)](/uploads/2012/04/Screen-Shot-2012-04-04-at-11.29.04-AM.png)

Sampling 5000 cases for each returned results fairly close to the predicted average.
