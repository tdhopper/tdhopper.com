---
title: What&#039;s a Stigler Diet?
date: 2012-01-12
tags: ["featured"]
categories:
  - "Articles"
slug: whats-a-stigler-diet
aliases: [/blog/2012/Jan/12/whats-a-stigler-diet/]
description: A look at economist George Stigler's applied optimization problem that this blog is named after.
Thumbnail: static/ibm701.jpg
---

In 1945, Nobel Laureate economist George Stigler posed a problem:

> For a moderately active man (economist) weighing 154 pounds, how much of each of 77 foods should be eaten on a daily basis so that the man's intake of nine nutrients (including calories) will be at least equal to the recommended dietary allowances suggested by the National Research Council in 1943, with the cost of the diet being minimal[^1diet].

The foods Stigler chose include wheat flour, rice, rolled oats, eggs, cheddar cheese, peanut butter, lard, apples, bacon, and lettuce[^2diet]. For nutrients, he chose calories, protein, calcium, iron, vitamin A, thiamine, riboflavin, niacin, and ascorbic acid. Given a few minutes thought, you will realize that this problem is simply an extension of the [carrots and oatmeal diet problem](http://www.stiglerdiet.com/2012/01/09/carrots-oatmeal-operations-research/) discussed in my last post. We can identify the 77 foods by  $1, 2, 3, \ldots, 77$ and the nutrients by $1, 2, \ldots, 9$. Let $F_i\geq 0$ be the pounds of food $i$ in a given diet. Suppose that a pound of food $i$ has $a_{i,j}$ units of nutrient $j$ and the lower limit of nutrient $j$ is $m_j$. Then any diet, $(F_1, F_2, \ldots, F_{77})$, is constraint by the inequalities: $$a_{1,j}\cdot F_1+a_{2,j}\cdot F_2+\ldots+a_{77,j}\cdot F_{77}\geq m_j,$$ for $j=1,2,\ldots,9$. Because there are $9$ nutrients, there are nine constraints. Of course, we can't visualize these inequalities on a graph like we could in the last post: more variables means more dimensions, and graphing in higher than 3 dimensions is tricky! However, the inequalities for a higher dimensional shape not too different from the one we've already seen: a [convex polytope](http://en.wikipedia.org/wiki/Convex_polyhedron). The points inside of this polytope are all the possible diets that can be formed without having too little of any nutrient. Stigler asked which diet is the cheapest. To find the cheapest diet, suppose the cost of food $i$ is $c_i$. Then the cost of a given diet $(F_1, F_2, \ldots, F_{77})$ is $$c_1\cdot F_1 +c_2\cdot F_2 +\ldots+c_{77}\cdot F_{77}.$$ Stigler wanted to minimize this function (called the cost function) over all the points satisfying the 9 nutrition constraints. Although techniques for solving such optimization problems had not yet been developed, Stigler managed to find a _nearly_ optimal daily diet for the food prices of 1944: 1.6 pounds of wheat flour, 0.3 pounds of cabbage, 0.6 ounces of spinach, 0.4 pounds of pancake flour, 1.1 ounces of pork liver. All of this amounted to $0.16 (that's sixteen **cents**) per day. Cheap, but Dr. Adkins wouldn't be happy. In 1947, [George Danzig](http://en.wikipedia.org/wiki/George_Dantzig) would publish a general method for solving problems like this (called "linear programs") called the simplex algorithm.

Uncertain of the viability of the algorithm, Danzig used Stigler's diet problem as a test case as a "large-scale" problem[^3diet]. Surprisingly, Stigler's diet was almost optimal, costing only pennies more per year than the very best solution. In the comments of my last post, Clemson OR professor [Matthew Saltzman](http://www.math.clemson.edu/~mjs/), [pointed ](http://www.stiglerdiet.com/2012/01/09/carrots-oatmeal-operations-research/#comment-3)to a 1990 article where George Danzig describes trying to build a low-calorie diet that would still leave him filling full. His first linear program prescribed, among other things, 500 gallons of vinegar per day. Eliminating vinegar as an option, it then prescribed 200 bouillon cubes; he noted he wasn't even able to consume one. Limiting the number of bullion cubes, it suggested he eat two pounds of bran. After that, two pounds of molasses. Finally, Danzig's [IBM 701](http://www-03.ibm.com/ibm/history/exhibits/701/701_intro.html) computer was vetoed by another menu generator, Mrs. Danzig, who helped him lose 22 pounds.[ ](http://www-03.ibm.com/ibm/history/exhibits/701/701_intro.html)

[^1diet]: Quote from paper by [Garille and Gass](http://www.jstor.org/pss/222950)

[^2diet]: _The Cost of Subsistence_ George J. Stigler Journal of Farm Economics Vol. 27, No. 2 (May, 1945), pp. 303-314 Published by: Oxford University Press on behalf of the Agricultural & Applied Economics Association Stable URL: http://www.jstor.org/stable/1231810

[^3diet]: This is ironic. Danzig's algorithm is used today for problems of millions of variables and constraints.
