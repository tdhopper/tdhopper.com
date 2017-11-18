---
title: From Nuclear Weapons to Operations Research
category: Article
date: 2012-01-25
Author: Tim
slug: from-nuclear-weapons-to-operations-research
aliases: [/blog/2012/Jan/25/from-nuclear-weapons-to-operations-research/]
---

In 1953, the eminent mathematician John Von Neumann (as they say,"Most mathematicians prove what they can, von Neumann proves what he wants") wrote a letter to T. V. Moore of Standard Oil. Apparently Moore had written Von Neumann about an operations problem he had. Eighteen tankers would transport fuel from La Salina to Las Piedras to Aruba. Moore wanted to "determine the economic value of increasing the number of berths for the loading of these tankers in La Salina from 3 to 4 or to 5."[^1nuclear]

However, due to "weather, conditions in the ports of call, etc... the comings and goings of the tankers are described in statistical terms only." Significant uncertainty existed in the time between ports and in loading and unloading times. Because of the complexity added by these uncertainties, Von Neumann speculated that the system would be very difficult to describe analytically. A few years earlier, in 1946, Von Neumann and Stanislaw Ulam were working to solve a problem of radiation shielding. And, "Despite having most of the necessary data... the problem could not be solved with analytical calculations."[^2nuclear]

In this similarly probabilistic system, Ulam and Von Neumann decided to instead approximate the results they needed through repeatedly generating possibly outcomes based on statistical manipulations and a (pseudo) random number generator. Their code name for this project was "Monto Carlo." Von Neumann suggested that Standard Oil could build a _probabilistic_ model of the tanker problem. For example, a trip from La Salina to Las Piedras might take 8 hours with probability .8 (good weather conditions), 10 hours with probability .15 (moderate weather), and 15 hours with probability 0.05 (poor weather). Based on this model and given a table of random numbers, he could simulate possible outcomes of a trip that (roughly) match reality.

> The procedure would have to be somewhat like this: Represent each tanker by some form of record, e.g. by a punch card, showing its exit time from La Salina.... Program calculations which will develop the further history of this tanker, always deriving those quantities which depend on chance..., with the use of suitable tables of random numbers.

Of course, Moore would not want to generate just one possible trip. But if the process was done repeatedly, the average benefit of having some number of berths in the simulation would be an approximation of the real benefit:

> It is thus possible to trace the history of as many days of operation as desired (say, a few years). One can then work out the behavior of sufficiently large samples for any assumed number of berths and thereby get an evaluation of the economic significance of any particular arrangement (i.e. any particular number of berths).

The same method which Ulam and Von Neumann used to understand radioactive particles (which behave probabilistically) could be used to model full shipments. Fortunately, Monte Carlo simulation now requires neither punch cards or random number tables. Von Neumann's punch card method would quickly be replaced by computer programs and [pseudo-random number generation algorithms](http://www.codeproject.com/Articles/25172/Simple-Random-Number-Generation). This early application of Monte Carlo methods to operations problems is one of many.

I have recently been looking at online stochastic scheduling problems. In these problems, a system is asked to fulfill some scheduling request while there is uncertainty (perhaps uncertainty what other requests will come or how long the job might take to complete). A common approach to these problems is to solve _deterministic_ scheduling problems based on Monte Carlo simulations of the future. The system somehow combines these various schedules to make a decision. There are many [applications of Monte Carlo methods](http://en.wikipedia.org/wiki/Monte_Carlo_method#Applications) in other fields as well.

[^1nuclear]: John von Neumann (2005). Miklós Rédei. ed. John von Neumann: Selected letters. History of Mathematics. 27. American Mathematical Society. p. 123. ISBN 0-8218-3776-1.

[^2nuclear]: [http://en.wikipedia.org/wiki/Monte_Carlo_method#History](http://en.wikipedia.org/wiki/Monte_Carlo_method#History)
