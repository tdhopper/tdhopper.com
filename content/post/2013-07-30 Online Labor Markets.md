---
title: Online Labor Markets and Static Site Generators
categories:
  - "Articles"
slug: online-labor-markets-and-static-site-generators
aliases: [/blog/2013/Jul/30/online-labor-markets-and-static-site-generators/]
date: 2013-07-30
Author: Tim
---

Several months ago, I decided to move this site from Wordpress to a [static site generator](http://www.mickgardner.com/2012/12/an-introduction-to-static-site.html). I've never loved the Wordpress  backend, and I'd prefer to deal more directly with text files.

For those who don't know, static site generators create _static_ HTML pages to be loaded to the web. Unlike a service like Wordpress, they don't call a database to load the post when you go to a URL. This has several advantages: it's harder to bring down, it can be hosted _very_ cheaply on [Amazon S3](http://aws.amazon.com/s3/), and you don't deal with the security risks (and constant security updates) that are a liability with Wordpress.

My blogposts exist on my computer as a folder of text documents (specifically [Markdown](http://en.wikipedia.org/wiki/Markdown) documents). To update my site, I run a script that compiles the text documents into the HTML files (that's the site generation part) you see here and then pushes the updates files to S3. At some point, I'm going to put the posts in a git repo and use a post-commit hook to do the updating.

Because I know Python and it seems to be an active project, I decided to go with the [Pelican site generator](http://docs.getpelican.com/en/3.2/). Unfortunately, Pelican's Wordpress conversion tool crashed on my site. After several attempts to reconcile the problems, I gave up.

A few weeks ago on a Saturday night, it occurred to me that someone else could probably sort out my problems and would be willing to do it for reasonable compensation. I signed up for an account on the freelancer marketplace [oDesk](https://www.odesk.com/). I described the problem and put out an offer to hire someone to convert my 21 extant posts to Pelican-formatted Markdown. Within 24 hours, I had three offers to do it at a very reasonable price.

I ended up hiring [@abdullahkhalids](https://twitter.com/abdullahkhalids), who is a physicist and programmer in Pakistan. He'd used Pelican before and was eager to take on the task. Within two days, he sent me a first draft of the Markdown posts. By the following Saturday, I made my payment and we were done. We'd have been done sooner except that I delayed in getting back to him.

Using oDesk was an incredible experience. I'm a big believer in trade and markets, and this experience validated those beliefs. I'm impressed at how well Odesk is able to breakdown national and geographic barriers to hiring workers. As far as I can tell, Abdullah and I both came out ahead in this transaction.

I can't promise that I'll keep up the blogging habit, but I'm going to work on making the task of writing and upload posts as easy as possible. For example, I'm hoping to setup a system that will allow me to write a post in [Drafts](http://agiletortoise.com/drafts/) on iOS and have it pushed live with only a single click.