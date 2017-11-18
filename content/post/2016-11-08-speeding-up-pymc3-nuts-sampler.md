---
title: Speeding up PyMC3 NUTS Sampler
slug: speeding-up-pymc3-nuts-sampler
aliases: [/blog/2016/Nov/08/speeding-up-pymc3-nuts-sampler/]
category: Today I Learned
date: 2016-11-08
---

I'm trying to use the [NUTS sampler](https://pymc-devs.github.io/pymc3/api.html?highlight=nuts#module-pymc3.step_methods.nuts) in [PyMC3](https://github.com/pymc-devs/pymc3 "GitHub - pymc-devs/pymc3: Probabilistic Programming in Python. Uses Theano as a backend, supports NUTS and ADVI.")

However, it was running at 2 iterations per second on my model, while the Metropolis Hastings sampler ran 450x faster.

I showed my example to some of the PyMC3 devs on Twitter, and [Thomas Wiecki](https://de.linkedin.com/in/thomas-wiecki-46339244 "Thomas Wiecki") showed me this trick:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/tdhopper">@tdhopper</a> <a href="https://twitter.com/Springcoil">@Springcoil</a> You need pm.NUTS(scaling=np.power(model.dict_to_array(v_params.stds), 2), is_cov=True) (terrible syntax, I know).</p>&mdash; Thomas Wiecki (@twiecki) <a href="https://twitter.com/twiecki/status/796007019941462016">November 8, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

It resulted in a 25x speedup of the NUTS sampler. The code looks like this

```python
with pm.Model() as model:
    # SETUP MODEL HERE
    mu, sds, elbo = pm.variational.advi(n=200000)
    step = pm.NUTS(scaling=np.power(model.dict_to_array(sds), 2))
    return pm.sample(niter,
                     step=step,
                     is_cov=True,
                     start=mu,
                     )
```