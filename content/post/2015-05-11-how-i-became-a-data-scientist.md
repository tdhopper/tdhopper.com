---
title: How I Became a Data Scientist Despite Having Been a Math Major
categories:
  - "Articles"
tags: ["featured"]
slug: how-i-became-a-data-scientist
aliases: [/blog/2015/May/11/how-i-became-a-data-scientist/]
date: 2015-05-11
description: An overview of my round-about journey from studying math as an undergrad to the world of data science.
Thumbnail: static/abacus.jpg
pull_quote: On a meta-level, training in mathematics forces students to think carefully and solve hard problems; these skills are valuable in many fields, including data science.
---

Caution: the following post is laden with qualitative extrapolation of anecdotes and impressions. Perhaps ironically (though perhaps not), it is not a data driven approach to measuring the efficacy of math majors as data scientists. If you have a differing opinion, I would greatly appreciate you to carefully articulate it and share it with the world.

I recently started my third "real" job since finishing school; at my first and third jobs I have been a "data scientist". I was a math major in college (and pretty good at it) and spent a year in the math Ph.D. program at the University of Virginia (and performed well there as well). These two facts alone would not have equipped me for a career in data science. In fact, it remains unclear to me that those two facts alone would have prepared me for any career (with the possible exception of teaching) without significantly more training.

## "There has never been a better time to be a mathematician"?

When I was in college [Business Week published an article](http://www.bloomberg.com/bw/stories/2006-01-22/math-will-rock-your-world) declaring "There has never been a better time to be a mathematician." At the time, I saw an enormous disconnect between the piece and what I was being taught in math classes (and thus what I considered to be a "mathematician"). I have come across other pieces lauding this as the age of the mathematicians, and more often than not, I've wondered if the author knew what students actually studied in math departments.

### Background on Me

The math courses I had as an undergraduate were:

* Linear algebra
* Discrete math
* Differential equations (ODEs and numerical)
* Theory of statistics 1
* Numerical analysis 1 (numerical linear algebra) and 2 (quadrature)
* Abstract algebra
* Number theory
* Real analysis
* Complex analysis
* Intermediate analysis (point set topology)

My program also required a one semester intro to C++ and two semesters of  freshman physics. In my year as a math Ph.D. student, I took analysis, algebra, and topology classes; had I stayed in the program, my future coursework would have been similar: pure math where homework problems consistent almost exclusively of proofs done with pen and paper (or in LaTeX).

## What is Data Science?

Though my current position occasionally requires mathematical proof, I suspect that is rare among data scientist. While the "data science" demarcation problem is challenging (and I will not seek to solve it here), it seems evident that my curriculum lacked preparation in many essential areas of data science. Chief among these are programming skill, knowledge of experimental statistics, and experience with math modeling.

### Data Science Requires Programming and Engineering

Few would argue that programming ability is not a key skill of data science. As Drew Conway [has argued](http://drewconway.com/zia/2013/3/26/the-data-science-venn-diagram), a data scientist need not have a degree in computer science, but "Being able to manipulate text files at the command-line, understanding vectorized operations, thinking algorithmically; these are the hacking skills that make for a successful data hacker." Many of my undergrad peers, having briefly seen C++ freshman year and occasionally used Mathematica to solve ODEs for homework assignments, would have been unaware that manipulation of a file from the command-line was even possible, much less have been able to write a simple sed script; there was little difference with my grad school classmates.

Many data science positions require even more than the ability to solve problems with code. As [Trey Causey has recently explained](http://treycausey.com/software_dev_skills.html), many positions require understanding of _software engineering_ skills and tools such as writing reusable code, using version control, software testing, and logging. Though I gained a fair bit of programming skill in college, these skills, now essential in my daily work, remained foreign to me until years later.

### Data Science Requires Applied Statistics

My math training had a lack of statistics courses. Though my brief exposure to mathematical statistics has been valuable in picking up machine learning, experimental statistics was missing altogether. Many data science teams are interested in questions of causal inference and design and analysis of experiments; some would make these _essential_ skills for a data scientist. I learned nothing about these topics in math departments. Moreover, machine learning, also a cornerstone of data science, is not a subject I could have even defined until after I was finished with my math coursework; at the end of college, I would have said artificial intelligence was mostly about rule-based systems in Lisp and Prolog.

### Data Science Involves _Very Applied Math_

Even if statistics had play a more prominent role in my coursework, those who have studied statistics know there is often a gulf between understanding textbook statistics and being able to effectively apply statistical models and methods to real world problems. This is only an aspect of a bigger issue: mathematical (including statistical) modeling is an extraordinarily challenging problem, but instruction on effectively model real world problems is absent from many math programs. To this day, defining my problem in mathematical terms one of the hardest problems I face; I am certain that I am not alone on this. Though I am now armed with a wide variety of mathematical models, it is rarely clear exactly which model can or should be applied in a given situation.

I suspect that many people, even technical people, are uncertain as to what academic math is beyond undergraduate calculus. Mathematicians mostly work in the logical manipulation of abstractly defined structures. These structures rarely bear any necessary relationship to physical entities or data sets outside the abstractly defined domain of discourse. Though some might argue I am speaking only of "pure" mathematics, this is often true of what is formally known as "applied mathematics". [John D. Cook has made similar observations](http://www.johndcook.com/veryappliedmath.html) about the limitations of pure and applied math (as proper disciplines) in dubbing himself a "very applied mathematician". Very applied mathematics is "an interest in the grubby work required to see the math actually used and a willingness to carry it out. This involves not just math but also computing, consulting, managing, marketing, etc." These skills are conspicuously absent from most math curricula I am familiar with.

## Math → Data Science

Given this description of how my schooling left me woefully unprepared for a career in data science, one might ask how I have had two jobs with that title. I can think of several (though probably not all) reasons.

__First, the academic study of mathematics provides much of the theoretical underpinnings of data science.__ Mathematics underlies the study of machine learning, statistics, optimization, data structures, analysis of algorithms, computer architecture, and other important aspects of data science. Knowledge of mathematics (potentially) allows the learner to more quickly grasp each of these fields. For example, learning how [principle component analysis](http://en.wikipedia.org/wiki/Principal_component_analysis)—a math model that can be applied and interpreted by someone without formal mathematical training—works will be significantly easier for someone with earlier exposure linear algebra. On a meta-level, training in mathematics forces students to think carefully and solve hard problems; these skills are valuable in many fields, including data science.

__My second reason is connect to the first: I unwittingly took a number of courses that later played important roles in my data science toolkit.__ For example, my current work in Bayesian inference has been made possible by my knowledge of linear algebra, numerical analysis, stochastic processes, measure theory, and mathematical statistics.

__Third, I did a minor in computer science as an undergraduate.__ That provided a solid foundation for me when I decided to get serious about building programming skill in 2010. Though my academic exposure to computer science lacked any software engineer skills, I left college with a solid grasp of basic data structures, analysis of algorithms, complexity theory, and a handful of programming languages.

__Fourth, I did a masters degree in operations research (after my year as a math PhD student convinced me pure math wasn't for me).__ This provided me with experience in math modeling, a broad knowledge of mathematical optimization (central to machine learning), and the opportunity to take graduate-level machine learning classes.[^ortraining]

__Fifth, my insatiable curiosity in computers and problem solving has played a key role in my career success.__ Eager to learn something about computer programming, I taught myself PHP and SQL as a high school student (to make Tolkien fan sites, incidentally). Having been given small Mathematica-based  homework assignments in freshman differential equations, I bought and read a book on programming Mathematica. Throughout college and grad school, I often tried—and sometimes succeeded—to write programs to solve homework problems that professors expected to be solved by hand. This curiosity has proven valuable time and time again as I've been required to learn new skills and solve technical problems of all varieties. I'm comfortable jumping in to solve a new problem at work, because I've been doing that on my own time for fifteen years.

__Sixth, I have been been fortunate enough to have employers who have patiently taught me and given me the freedom to learn on my own.__ I have learned an enormous amount in my two and a half year professional career, and I don't anticipate slowing down any time soon. As [Mat Kelcey](https://twitter.com/mat_kelcey/status/328179275893207042) has said: always be sure you're not the smartest one in the room. I am very thankful for three jobs where I've been surrounded by smart people who have taught me a lot, and for supervisors who trust me enough to let me learn on my own.

__Finally,[^remaining] it would be hard for me to overvalue the four and a half years of participation in the data science community on Twitter.__ Through Twitter, I have the ear of some of data science's brightest minds (most of whom I've never met in person), and I've built a peer network that has helped me find my current and last job. However, I mostly want to emphasize the pedagogical value of Twitter. Every day, I'm updated on the release of new software tools for data science, the best new blog posts for our field, and the musings of of some of my data science heros. Of course, I don't read every blog post or learn every software tool. But Twitter helps me to recognize which posts are most worth my time, and because of Twitter, I know _something_ instead of _nothing_ about Theano, Scalding, and dplyr.[^interviews]

## Conclusions

I don't know to what extent my experience generalizes[^planning], in either the limitations of my education or my analysis of my success, but I am obviously not going to let that stop me from drawing some general conclusions.

### Hiring Data Scientists

For those hiring data scientists, recognize that mathematics as taught might not be the same mathematics you need from your team. Plenty of people with PhDs in mathematics would be unable to define linear regression or bloom filters. At the same time, recognize that math majors are taught to think well and solve hard problems; these skills shouldn't be undervalued. Math majors are also experienced in reading and learning math! They may be able to read academic papers and understand difficult (even if new) mathematical more quickly than a computer scientist or social scientist. Given enough practice and training, they would probably be excellent programmers.

### Studying Math

For those studying math, recognize that the field you love, in its formal sense, may be keeping you away from enjoyable and lucrative careers. Most of your math professors have spent their adult lives solving math problems on paper or on a chalkboard. They are inexperienced and, possibly, unknowledgeable about _very applied mathematics_. A successful career in pure mathematics will be very hard and will require you to be very good. While there seem to be lots of jobs in teaching, they will rarely pay well.

If you're still an student, you have a great opportunity to take control of your career path. Consider taking computer science classes (e.g. data structures, algorithms, software engineering, machine learning) and statistics classes (e.g. experimental design, data analysis, data mining).

For both students and graduates, recognize your math knowledge becomes very marketable when combined skills such as programming and machine learning; there are a wealth of good books, MOOCs, and blog posts that can help you learn these things. More over, the barrier to entry for getting started with production quality tools has never been lower. Don't let your coursework be the extent of your education. There is so much more to learn![^ipython]

[^ortraining]: At the same time, my academic training in operations research failed me, in some aspects, for a successful career in operations research. For example, practical math modeling was not sufficiently emphasized and the skills of computer programming and software development were undervalued.
[^interviews]: I have successfully answered more than one interview question by regurgitating knowledge gleaned from tweets.
[^planning]: Among other reasons, I didn't really plan to get where I am today. I changed majors no fewer than three times in college (physics, CS, and math) and essentially dropped out of two PhD programs!
[^remaining]: Of course, I have plenty of data science skills left to learn. My knowledge of experimental design is still pretty fuzzy. I still struggle with effective mathematical modeling. I haven't deployed a large scale machine learning system to production. I suck at software logging. I have no idea
how deep learning works.
[^ipython]: For example, install  [Anaconda](https://store.continuum.io/cshop/anaconda/) and start playing with some of [these IPython notebooks](https://github.com/ipython/ipython/wiki/A-gallery-of-interesting-IPython-Notebooks).


<script type="text/javascript" src="//s3.amazonaws.com/downloads.mailchimp.com/js/signup-forms/popup/embed.js" data-dojo-config="usePlainJson: true, isDebug: false"></script><script type="text/javascript">require(["mojo/signup-forms/Loader"], function(L) { L.start({"baseUrl":"mc.us15.list-manage.com","uuid":"8d66a62ca6b0823dfc767de63","lid":"f1c0e59e9b"}) })</script>