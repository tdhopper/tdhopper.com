---
title: Faster SSH Access to Remote Computers
slug: faster-ssh-access-to-remote-computers
aliases: [/blog/2016/Jun/15/faster-ssh-access-to-remote-computers/]
category: Today I Learned
date: 2016-06-15
---

I routinely [SSH](https://en.wikipedia.org/wiki/SSH "Wikipedia Entry: SSH") into a company machine on Openstack to do work. Until yesterday, I'd use my Bash history to find the SSH command I needed to access it. I was reading [SSH Mastery](https://www.amazon.com/SSH-Mastery-OpenSSH-PuTTY-Tunnels/dp/1470069717) in a plane yesterday and realized I've been foolish to neglect the power of `~/ssh/config`.

I added this to my SSH config file:

```
Host lab
  HostName MACHINE.IP.ADDRESS
  User tdhopper
  Port 22
  IdentityFile ~/.ssh/id_rsa
  ForwardAgent yes
  RemoteForward 52698 localhost:52698
```

Now I can connect to the machine by typing `$ ssh lab`. That's it. I don't have to provide the SSH key, username, or machine IP.

The `RemoteForward` bit also forwards a port to enable me to open files on the remote machine in my local SublimeText editor using [rsub](https://github.com/henrikpersson/rsub). This is great.
