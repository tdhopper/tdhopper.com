---
title: Noisy Series and Body Weight Part 2
slug: noisy-series-and-body-weight-take-2
aliases: [/blog/2013/Nov/28/noisy-series-and-body-weight-take-2/]
date: 2013-11-28
category: Article
---

Back in July, I posted some [analysis of my attempt at weight loss](http://tdhopper.com/blog/2013/Jul/26/noisy-series-and-body-weight/). Now that I'm four months further down the line, I thought I'd post a follow-up.

I continue to be fascinated with how noisy my weight time series is. While I've continued to lose weight over time, my weight goes up two out of five mornings.

Here's a plot of the time series of my change in weight. Note how often the change is positive, i.e. I appear to have gained weight:

![](/uploads/2013/11/weight_change1.png)

This volatility can hide the fact that I'm making progress! When I put a regression line through the points, you can see that the average change slightly below zero:[^investing]

![](/uploads/2013/11/weight_change2.png)

I have wondered recently if my average change in weight is correlated with the day of the week. My hypothesis is that my weight tends to go up over the weekends, so I created a boxplot of my change in weight categorized by day.

![](/uploads/2013/11/weight_box.png)

Indeed, on Sundays and Mondays (i.e. weight change from Saturday morning to Sunday morning and Sunday morning to Monday morning) my median weight change is slightly above zero. This makes sense to me: on Saturdays, I'm more likely to be doing things with friends, and thus I have less control over my meals.[^beer]

I wish I had a good explanation for why the change on Friday is so dramatic, but I don't. Any guesses?

 [^beer]: Also, beer.
 [^investing]: I mentioned this to my college roommate who is a financial planner. He noted how similar this is to investing; it's a constant battle for him to convince his clients to look at _average_ behavior instead of daily changes.
