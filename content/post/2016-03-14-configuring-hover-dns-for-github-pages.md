---
title: Configuring Hover DNS for Github Pages
slug: configuring-hover-dns-for-github-pages
aliases: [/blog/2016/Mar/14/configuring-hover-dns-for-github-pages/]
date: 2016-03-14
category: Today I Learned
---

I'm hosting this blog on [Github Pages](https://pages.github.com/), so you can find it at [tdhopper.github.io](http://tdhopper.github.io). However, I wanted to set it up to work with [til.tdhopper.com](http://til.tdhopper.com); tdhopper.com is registered with Hover.

Setting up the DNS just required adding a [text file called CNAME in the root directory of this website](https://github.com/tdhopper/tdhopper.github.io/blob/master/CNAME) containing the text `til.tdhopper.com` and adding a CNAME DNS record on [Hover.com](https://www.hover.com/ "Domains and domain email made simple - Hover") with hostname `TIL` and value `tdhopper.github.io`.
