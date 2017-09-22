---
title: Data Scientists Need More Automation
categories:
  - "Articles"
date: 2016-11-15
slug: data-scientists-need-more-automation
aliases: [/blog/2016/Nov/15/data-scientists-need-more-automation/]
description: An appeal for training to help data scientists take control of their their system management, configuration, and operations.
---

Many data scientists aren't lazy enough.

Whether we are managing production services or running computations on AWS machines, many data scientists are working on computers besides their laptops.

For me, this often takes the form of SSH-ing into remote boxes[^ssh], manually configuring the system with a combination of apt installs, [Conda environments](http://conda.pydata.org/docs/using/envs.html "Managing environments &mdash; Conda   documentation"), and bash scripts.

To run my service or scripts, I open a [tmux](https://tmux.github.io/ "tmux") window, activate my virtual environement, and start the process.[^tmux]

When I need to check my logs or see the output, I SSH back into each box, reconnect to tmux (after I remember the name of my session), and tail my logs. When running on multiple boxes, I repeat this process N times. If I need to restart a process, I flip through my tmux tabs until I find the correct process, kill it with a Ctrl-C, and use the up arrow to reload the last run command.

All of this works, of course. [And as we all know](https://xkcd.com/1319/), [a simple solution that works](http://xkcd.com/974/) [can be preferable](https://xkcd.com/1445/) to a fragile solution that requires constant maintenance. That said, I suspect many of us aren't lazy enough. We don't spend enough time automating tasks and processes. Even when we don't save time by doing it, we may save [mental overhead](http://www.johndcook.com/blog/2015/12/22/automate-to-save-mental-energy-not-time/).

I recently introduced several colleagues to some Python-based tools that can help. [Fabric](http://www.fabfile.org/) is a "library and command-line tool for streamlining the use of SSH for application deployment or systems administration tasks." Fabric allows you to encapsulate sequences of commands as you might with a Makefile. It's killer feature is the ease with which it lets you execute those commands on remote machines over SSH. With Fabric, you could tail all the logs on all your nodes with a single command executed in your local terminal. There are [a number of talks about Fabric on Youtube](https://www.youtube.com/results?search_query=python+fabric) if you want to learn more. One of my colleagues reduced his daily workload by writing his system management tasks into a Fabric file.

Another great tool is [Supervisor](http://supervisord.org/). If you run long running processes in tmux/screen/nohup, Supervisor might be for you. It allows you to define the tasks you want to run in an INI file and "provides you with one place to start, stop, and monitor your processes". Supervisor will log the stdout and stderr to a log location of your choice. It can be a little confusing to set up, but will likely make your life easier in the longer run.

A tool I want to learn but haven't is [Ansible](https://www.ansible.com/), "a free-software platform for configuring and managing computers which combines multi-node software deployment, ad hoc task execution, and configuration management". Unlike Chef and Puppet, Ansible doesn't require an agent on the systems you need to configure; it does all the configuration over SSH. You can use Ansible to configure your systems and install your dependencies, even [Supervisor](https://github.com/zenoamaro/ansible-supervisord)! Ansible is written in Python and, mercifully, doesn't require learning a Ruby-based DSL (as does Chef).

Recently I've been thinking that Fabric, Supervisor, and Ansible combined become a powerful toolset for management and configuration of data science systems. Each tool is also open source and can be installed in a few minutes. Each tool is well documented and offers helpful tutorials on getting started; however, learning to use them effectively may require some effort.

I would love to see someone create training materials on these tools (and others!) focused on how data scientists can take improve their system management, configuration, and operations. A screencast series may be the perfect thing. Someone please help data scientists be lazier, do less work, and reduce the mental overhead of dealing with computers!

[^ssh]: Thankfully I recently started taking better advantage of [aliases in my ssh config](http://til.tdhopper.com/notes/faster-ssh-access-to-remote-computers).
[^tmux]: When I have to do this on multiple machines, I'm occasionally clever enough to use tmux to broadcast the commands to multiple terminal windows.