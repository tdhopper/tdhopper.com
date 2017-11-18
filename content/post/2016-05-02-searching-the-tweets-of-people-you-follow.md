---
title: Searching the tweets of people you follow
slug: searching-the-tweets-of-people-you-follow
aliases: [/blog/2016/May/02/searching-the-tweets-of-people-you-follow/]
category: Today I Learned
date: 2016-05-02
---

This is more of a Today I Taught.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Turns out, it is actually possible to search my timeline. Thanks <a href="https://twitter.com/tdhopper">@tdhopper</a> for the tip. <a href="https://t.co/7IsD76qszD">pic.twitter.com/7IsD76qszD</a></p>&mdash; Ole Zorn (@olemoritz) <a href="https://twitter.com/olemoritz/status/727148272675115008">May 2, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I have a quick search in [Alfred](https://www.alfredapp.com/) to search the tweets of people I follow. I launch Alfred with ⌘-Space and type `following {query}`. Restricting a Twitter search to people you follow only requires adding the `s=follows` query string to a search url:

```
https://twitter.com/search?s=follows&q={query}
```