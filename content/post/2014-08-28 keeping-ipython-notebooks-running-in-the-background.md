---
title: Keeping IPython Notebooks Running in the Background
category: Tutorial
slug: keeping-ipython-notebooks-running-in-the-background
aliases: [/blog/2014/Aug/28/keeping-ipython-notebooks-running-in-the-background/]
date: 2014-08-28
---

I spend a lot of time in [IPython Notebooks](http://ipython.org/notebook.html "The IPython Notebook &mdash; IPython") for work. One of the few annoyances of IPython Notebooks is that they require keeping a terminal window open to run the notebook server and kernel. I routinely launch a Notebook kernel in a directory where I keep my work related notebooks. Earlier this week, I started to wonder if there was a way for me to keep this kernel running all the time _without_ having to keep a terminal window open..

If you've ever tried to do chron-like automation on OS X, you've surely come across [launchd](http://launchd.info/), "a unified, open-source service management framework for starting, stopping and managing daemons, applications, processes, and script". You've probably also gotten frustated with launchd and given up.

I recently started using [LaunchControl](http://www.soma-zone.com/LaunchControl/ "soma-zone: LaunchControl") "a fully-featured launchd GUI" for launchd; it's pretty nice and worth $10. It occurred to me that LaunchControl would be a good way to keep my Notebook kernel running in the background.

I created a LaunchControl to run the following command.

```
/usr/local/bin/IPython notebook --matplotlib inline --port=9777 --browser=false
```

This launches an IPython Notebook kernel accessible on port 9777; setting the browser flag to something other than an installed browser prevents a browser window from opening when the kernel is launch.

I added three other launchd keys in LaunchControl:

* A _Working Directory_ key to tell LaunchControl to start my notebook in my desired folder.
* A _Run At Load_ key to tell it to start my kernel as soon as I load the job.
* And a _Keep alive_ key to tell LaunchControl to restart my kernel should the process ever die.

Here's how it looks in LaunchControl:

![](/uploads/2014/08/launchcontrol.png)

After I created it, I just had to save and load, and I was off to the races; the IPython kernel starts and runs in the background. I can access my Notebooks by navigating to 127.0.0.1:9777 in my browser. Actually, I added `127.0.0.1 parsely.scratch` to my hosts file so I can access my Notebooks at parsely.scratch:9777. This works nicely with Chrome's autocomplete feature. I'm avoiding the temptation to run nginx and give it an even prettier url.
