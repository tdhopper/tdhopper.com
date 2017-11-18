---
title: Mathematicians, Engineers, and Businessmen on NPC Problems
category: Article
date: 2012-02-02
Author: Tim
slug: mathematicians-engineers-and-businessmen-on-npc-problems
aliases: [/blog/2012/Feb/02/mathematicians-engineers-and-businessmen-on-npc-problems/]
---

I assume most people who are nerdy enough to read this blog are nerdy enough to know about the [$\mathcal{P}$ vs $\mathcal{NP}$ problem](http://www.claymath.org/millennium/P_vs_NP/)[^1engineers]. I first learned about this problem taking computer science classes in college, and it all seemed very theoretical at the time. Now that I study operations research, the problem is very real. Operations researchers are often limited in their pursuits by the challenges of $\mathcal{NP}$-hard [problems](http://en.wikipedia.org/wiki/Integer_program), and many operations researchers spend their careers trying to solve hard problems. Last semester, I came across [Laurence Wolsey](http://www.core.ucl.ac.be/~wolsey/)'s beautiful description of how various people might view this problem. (Of course, the inimitable Randall Munroe has offered [a similar look](http://xkcd.com/664) at the issue.)

> A _pessimist_ might say that as most problems appear to be hard (i.e., their decision version lies in $\mathcal{NPC}$), we have no hope of solving instances of large size (because in the worst case we cannot hope to do better than enumeration), and so we should give up. A _mathematician (optimist)_ might set out to become famous by proving that $\mathcal{P=NP}$. A _mathematician (pessimist)_ might set out to become famous by proving that $\mathcal{P\neq NP}$. A _mathematician (thoughtful)_ might decide to ask a different question: Can I find an algorithm that is guaranteed to find a solution "close to optimal" in polynomial time in all cases[^2engineers]. A _probabilist (thoughtful)_ might also ask a different question: Can I find an algorithm that runs in polynomial time with high probability and that is guaranteed to find an optimal or "close to optimal" solution with high probability? An _engineer_ would start looking for a heuristic algorithm that produces practically usable solutions. Your _boss_ might say: I don't care a damn about integer programming theory. You just worry about our scheduling problem. Give me a feasible production schedule for tomorrow in which William Brown and Daughters' order is out of the door by 4 P.M. A _struggling professor_ might say: Great. Previously I was trying to develop one algorithm to solve all integer programs, and publishing one paper every two years explaining why I was not succeeding. Now I know that I might as well study each $\mathcal{NP}$ problem individually. As there are thousands of them, I should be able to write twenty papers a year. Needless to say they are all right. There is no easy and rapid solution, but the problems will not go away, and more and more fascinating and important practical problems are being formulated as integer programs. So in spite of the $\mathcal{NP}$-completeness theory, using an appropriate combination of theory, algorithms, experience, and intensive calculation, verifiably good solutions for large instances can and must be found[^3engineers].

[^1engineers]: If that's not the case, you might check out this page: http://simple.wikipedia.org/wiki/P_versus_NP.

[^2engineers]: See http://en.wikipedia.org/wiki/Polynomial_approximation_scheme.

[^3engineers]: From [Integer Programming](http://books.google.com/books/about/Integer_programming.html?id=x7RvQgAACAAJ), Page 87.
