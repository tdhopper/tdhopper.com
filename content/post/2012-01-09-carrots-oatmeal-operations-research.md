---
title: Carrots, Oatmeal, Operations Research
date: 2012-01-09
Author: Tim
slug: carrots-oatmeal-operations-research
aliases: [/blog/2012/Jan/09/carrots-oatmeal-operations-research/]
category: Article
---

A former grad school classmate of mine lived largely off of oatmeal and carrots. Suppose he wanted to be sure to get 2000 calories/day, 60 milligrams of vitamin C per day, and no more than 40 grams of fat per day. How should he balance his intake of oatmeal and carrots while minimizing his expense at the grocery store? Suppose he eats \\(S\\) pounds of carrots per day and \\(Q\\) pounds of dry oatmeal. A pound of carrots contains 172 calories; a pound of oatmeal contains 1742 calories[^1what]. The total number of calories he gets in a day is \\(172\cdot C+1732\cdot Q.\\) To be sure he gets the adequate number of calories, he needs $$172\cdot C+1732\cdot Q\geq 2000.$$ A pound of carrots contains 0.839 grams of fat, and a pound of oatmeal contains 25 grams of fat. For the total amount of fat has to be less than 40: $$0.839\cdot C+25\cdot Q\leq 40.$$ A pound of carrots contains 19 milligrams of vitamin C, and a pound of oatmeal contains 15 milligrams of vitamin C. Since the total amount of vitamin C must be at least 60: $$19\cdot C+15\cdot Q\geq 60.$$ If  you graph these three inequalities, you get the blue region shown below. Any point in the blue region represents a combination of carrots and oatmeal that would provide sufficient nutrients without giving too much fat. What we want to know is which combination is least expensive.

[![](/uploads/2012/01/Whats-a-Stigler-Diet-Feasible1.gif)](/uploads/2012/01/Whats-a-Stigler-Diet-Feasible1.gif)

A pound of carrots and a pound of oatmeal both cost about $0.50. So, we want _to minimize_ the function \\(\$0.5\cdot C+\$0.5\cdot Q\\) while still staying inside the blue region. We can write all of these things in a form that operations researchers call a "linear program."[^2what]

<div>
\begin{align*}\text{minimize }\;\; & 0.5\cdot C+0.5\cdot Q\\ \text{subject to }\;\; &172\cdot C+1742\cdot Q\geq 2000\\&0.839\cdot C+25\cdot Q\leq 40\\&19\cdot C+15\cdot Q\geq 60\\&C\geq 0, \;Q\geq 0\end{align*}
</div>

It turns out, the optimal solution is that my friend should eat 2.44 pounds of carrots per day and 0.91 pounds of oatmeal. With that combination, he'll get all his nutrients, restrict his fat, and keep his grocery store bill as low as possible (about $1.73 per day!). Below, I show another graph of the possible carrot-oatmeal combinations. This time, the color of a point represents the cost of that diet. The optimal diet occurs at the black dot, i.e. where the graph is most red. The most expensive diet occurs at the bottom right corner, where the graph is most blue. That diet corresponds to eating nearly 48 pounds of carrots per day!

[![](/uploads/2012/01/Whats-a-Stigler-Diet-Temp.gif)](/uploads/2012/01/Whats-a-Stigler-Diet-Temp.gif)

Operations researchers use this sort of linear programming mathematical model to solve all kinds of problems. While I don't know of anyone who uses linear programming to fix their diet, the economist George Stigler suggested many years ago it is possible. I will follow up with another post talking about [Stigler's Diet problem](http://en.wikipedia.org/wiki/Stigler_diet).

[^1what]: See http://www.wolframalpha.com/input/?i=pound+of+carrots%2C+pound+of+oatmeal

[^2what]: _Program_ doesn't refer to computer programming. It actually goes back to an older use of the word related to planning something out.
