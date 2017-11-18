---
title: Operations Research and Computer Programming
category: Article
date: 2012-07-12
Author: Tim
slug: operations-research-and-computer-programming
aliases: [/blog/2012/Jul/12/operations-research-and-computer-programming/]
---

For part of my sophomore year of college, I was a computer science major. When I realized that I loved my CS theory courses while my classmates hated them, I decide to major in math instead. I enjoyed the programming classes enough, but programming is not what I wanted to spend my time doing.

The summer after my junior year, I was accepted to a _math_ REU at Rochester Institute of Technology. The first thing my adviser [Stanislaw Radziszowski](http://www.cs.rit.edu/~spr/) asked me was whether or not I could program! I spent the whole summer programming combinatorial graph theory-related algorithms in C[^1programming].

Now I, like many of my operations research classmates, spend much of my time programming. Despite the importance of writing code for solving operations research problems, I am surprised how little programming is discussed. The [admissions page for my program](http://www.or.ncsu.edu/admission/) says nothing about programming ability, but it is implicitly assumed that programming is a skill that students have.

Moreover, I suspect the operations research-specific parts of the research behind many journal articles is only a fraction of the actual work done by the authors. Much of the required work is implementation and debugging of their algorithms. Yet, articles contain little-to-no discussion of the actual code. Even worse, the code is often not published or reviewed. I can only imagine how many coding errors underly the results of peer-reviewed papers.

[Marc Kuo recently blogged](https://kuomarc.wordpress.com/2012/07/02/top-hackers-we-need-you-for-operations-research/) about how operations researchers need to get with the program (pun intended). His post kicked of tons of discussion in its [comments](https://kuomarc.wordpress.com/2012/07/02/top-hackers-we-need-you-for-operations-research/#comments), on [Google+](https://plus.google.com/110464871801965858778/posts/QDtHN7PcsCL), on [Hacker News](http://news.ycombinator.com/item?id=4191847), and on [OR-Exchange](http://www.or-exchange.com/questions/5783/which-programming-skillsexperience-are-essential-for-being-a-good-or-researcher-if-any?utm_medium=twitter&utm_source=twitterfeed).

This discussion came at a good time for me. I'm in the middle of my first big coding project of my PhD research. Despite completing a computer science minor and spending two summers doing nothing but coding, I never learned good software engineering practices. I decided at the beginning of the summer to force myself not to just write this code to get the job done but to write _good_ code.

To start, I finally started using [git](http://git-scm.com/) and [github](https://github.com/) for version control. I have tried several times before, but I have always found it rather confusing[^2programming]. [This git tutorial](http://www.vogella.com/articles/Git/article.html) finally got me over the hump. Now I can easily branch my code into different versions, and I have the ability to go back to old versions when I screw something up.

Second, I started teaching myself about [unit testing](http://en.wikipedia.org/wiki/Unit_testing). Code testing was never mentioned in any of my classes in college, and I never hear operations researchers talk about it. Again, I have no doubt that the code behind much published work is full of mistakes. Operations researchers need good testing practices?[^3programming]

Third, I'm trying to write clean, object-oriented, well-commented code. My intention is to publish this code on [github](https://github.com/tdhopper) when the corresponding paper is published. I want my results to be easily reproducible by others and open to scrutiny. I would also like my code to be reusable for future research. My design patterns might not be quite there yet, but I'm trying to move in that direction.

I realized that I've used the word _I_ as much as Stephen Wolfram blog post. I have no desire to toot my own horn here; I'm just thankful this conversation is happening, and I want to continue it. Good software is crucial to good operations research (both in the academy and out), and yet academic operations researchers, in my experience, talk very little about good software engineering practices. We can do better.

[^1programming]: I'm eternally indebted to my brilliant research partner Evan who taught me how to use bash, vim, and subversion, among other things.

[^2programming]: I feel vindicated by a [recent thread on Hacker News](http://news.ycombinator.com/item?id=4199772).

[^3programming]: Incidentally, here's a[n interesting Quora thread](http://www.quora.com/How-do-people-write-automated-tests-for-their-stochastic-algorithms) about testing stochastic algorithms.
