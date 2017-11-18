---
title: Using rbenv for Ruby Versions
slug: using-rbenv-for-ruby-versions
aliases: [/blog/2016/Mar/11/using-rbenv-for-ruby-versions/]
category: Today I Learned
date: 2016-03-11
---

I don't use Ruby much, but I wanted to use Jekyll for this blog. I kept getting this error when running `gem install jekyll`:


```
Fetching: colorator-0.1.gem (100%)
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions for the /Library/Ruby/Gems/2.0.0 directory.
```

I installed rbenv with `brew install rbenv` and added

```bash
[[ -s $HOME/.rbenv/bin ]] && export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"
```

to my `.bashrc` file. Then I changed the default ruby interpreter from the system interpreter to one managed by rbenv with `rbenv install 2.2.3 && rbenv global 2.2.3`.