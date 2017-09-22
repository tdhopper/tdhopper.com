---
title: Fitting a Mixture Model with Gibbs Sampling
categories:
  - "Tutorials"
date: 2015-09-09
slug: fitting-a-mixture-model-with-gibbs-sampling
aliases: [/blog/2015/Sep/09/fitting-a-mixture-model-with-gibbs-sampling/]
---

In attempt to clarify my own understanding of how Gibbs samplers are derived for Bayesian models, I collected [some notes on the sampler for a finite mixture model into an IPython notebook](https://github.com/tdhopper/notes-on-dirichlet-processes/blob/master/2015-09-02-fitting-a-mixture-model.ipynb).

I think most of the literature on Bayesian computation is terrible. There's lots of handwaving with cavalier appeals to conjugacy and "integrating out". There aren't a lot of clear derivations of the equations needed for doing sampling in MCMC. As I have tried to write about it myself, I have a better appreciation of why that might be: this is complex math with a lot of moving parts. Given that, I would appreciate constructive feedback on how I could make this more clear or helpful. Even better, [fork my repo and submit a pull request](https://github.com/tdhopper/notes-on-dirichlet-processes/pulls).