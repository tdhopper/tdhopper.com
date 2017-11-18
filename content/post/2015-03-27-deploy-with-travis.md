---
title: Auto Deploying Stigler Diet with Travis CI
slug: auto-deploying-stigler-diet-with-travis-ci
aliases: [/blog/2015/Mar/27/auto-deploying-stigler-diet-with-travis-ci/]
date: 2015-03-27
category: Article
---

I've been using Travis CI for automated testing at work for the last year. It never occurred to me that it could be used
to deploy a static website.

[Greg Reda](https://twitter.com/gjreda) wrote [a great post](http://www.gregreda.com/2015/03/26/static-site-deployments/)
on using Travis to automatically build his site and deploy it to S3 every time he pushes to Github. I borrowed his brilliance
to implement the same technique here.
