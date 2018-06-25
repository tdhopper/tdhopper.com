---
title: Your Old Tweets from This Day
category: Personal Update
date: 2017-01-24
slug: your-old-tweets-from-this-day
aliases: [/blog/2017/Jan/24/your-old-tweets-from-this-day/]
portfolio: true
description: Twitter bot that shows you your old tweets from this date in previous years.
tags:
 - Twitter
Thumbnail: /projects/tweets.png
external: https://twitter.com/your_old_tweets
---

A while ago, I [published a Bash script](https://gist.github.com/tdhopper/fccc4ab00a07cb290f1812d8ac5cc5f3) that will open a Twitter search page to show your old tweets from this day of the year. I have enjoyed using it to [see](https://twitter.com/tdhopper/status/559005293808746497) [what](https://twitter.com/tdhopper/status/426718234461872130) I was [thinking](https://twitter.com/tdhopper/status/691088342499381250) [about](https://twitter.com/tdhopper/status/426702495361269760) in [days](https://twitter.com/tdhopper/status/294300532770738176) [gone](https://twitter.com/tdhopper/status/29641415810088961) by.

So I turned this into a Twitter account.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Follow me to have a link tweeted @ you each day that will show your old tweets from that day of the year. <a href="https://twitter.com/hashtag/experimental?src=hash">#experimental</a></p>&mdash; On This Day (@your_old_tweets) <a href="https://twitter.com/your_old_tweets/status/819196698044014592">January 11, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

If you follow [@your_old_tweets](https://twitter.com/your_old_tweets), it'll tweet a link at you each day that will show you your old tweets from the day. It attempts to send it in the morning (assuming you have your [timezone set](https://twitter.com/settings/account)).

This runs on Amazon Lambda. The code is [here](https://github.com/tdhopper/your_old_tweets).
