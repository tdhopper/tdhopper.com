---
title: New Post Function for Bash
categories:
  - "Today I Learned"
date: 2015-07-21
slug: new-post-function-for-bash
aliases: [/blog/2015/Jul/21/new-post-function-for-bash/]
---

On of the things I don't like about using a static site generator is the friction required for creating a new post. I've often end up posting things to Twitter that I would prefer to be more permanent simply because of the ease of tweeting.

To that end, I created a quick Bash function [to create a new post for me](https://github.com/tdhopper/dotfiles/blob/cfd46e96d4981f5c136ecd4528b94d9414c87564/bash_functions#L1-L28). Creating this post in my Pelican directory only requires typing

```
$ new-post "New Post Function for Bash"
```

Combined with Greg Reda's [Travis CI](http://stiglerdiet.com/blog/2015/Mar/27/auto-deploying-stigler-diet-with-travis-ci/) trick, the friction in getting a new post online is greatly reduced.

