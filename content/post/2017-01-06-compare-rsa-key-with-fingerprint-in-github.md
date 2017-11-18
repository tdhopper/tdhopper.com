---
title: Compare RSA Key with Fingerprint in Github
slug: compare-rsa-key-with-fingerprint-in-github
aliases: [/blog/2017/Jan/06/compare-rsa-key-with-fingerprint-in-github/]
category: Today I Learned
date: 2017-01-06
---

When you add an SSH key to your Github account, Github shows you the hexadecimal form of the MD5 hash of your public key.

If you ever need to compare that against a key file on your computer, you can run:

```
ssh-keygen -E md5 -lf ~/.ssh/id_rsa.pub
```

I learned this from [StackOverflow](http://stackoverflow.com/a/32130465/982745).