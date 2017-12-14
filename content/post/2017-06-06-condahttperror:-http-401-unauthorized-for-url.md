---
title: "CondaHTTPError: HTTP 401 UNAUTHORIZED for url"
date: 2017-06-06
slug: condahttperror:-http-401-unauthorized-for-url
aliases: ["/blog/2017/Jun/06/condahttperror:-http-401-unauthorized-for-url/"]
Tags:
category: Article
Description: A Conda error I found and how I solved it.
---

I was getting this message when I tried to install packages from [conda-forge](https://conda-forge.github.io/ "conda-forge | community driven packaging for conda") with [Conda](https://conda.io/docs/intro.html "Intro to conda &mdash; Conda documentation"):

```
Fetching package metadata ...
CondaHTTPError: HTTP 401 UNAUTHORIZED for url <https://conda.anaconda.org/conda-forge/osx-64/repodata.json>
Elapsed: 00:00.920954
CF-RAY: 36ad7cbd5d1c23d8-IAD

The remote server has indicated you are using invalid credentials for this channel.

If the remote site is anaconda.org or follows the Anaconda Server API, you
will need to
  (a) remove the invalid token from your system with `anaconda logout`, optionally
      followed by collecting a new token with `anaconda login`, or
  (b) provide conda with a valid token directly.

Further configuration help can be found at <https://conda.io/docs/config.html>.
```

I tried to do `$ anaconda logout` but didn't have a program called `anaconda` installed.

You can install the [Anaconda Cloud Client](https://docs.continuum.io/anaconda-cloud/user-guide/getting-started#cloud-install-client) with `$ conda install anaconda-client`.

After that, I was able to do `$ anaconda logout` followed by `$ anaconda login` where I used my old Binstar credentials (now anaconda.org).

[I'm not the only one having this problem.](https://github.com/conda-forge/ulmo-feedstock/issues/5)
