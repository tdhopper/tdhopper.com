---
title: Releasing to Anaconda.org via Travis-CI
category: Tutorial
date: 2015-08-06
slug: releasing-to-anaconda.org-via-travis-ci
aliases: [/blog/2015/Aug/06/releasing-to-anaconda.org-via-travis-ci/]
---



I've spent the last few days figuring out how to co-opt [Travis CI](https://travis-ci.org) as a build server for [Anaconda.org](https://anaconda.org/ "anaconda.org") (the package management service previously known as Binstar). I need to be able release five conda packages to Anaconda built for both Linux and OS X. Travis is not the right tool for this job, but I have managed to make it work. Since I've talked to others who are wrestling with this same problem, I am sharing my solution here.

Each of my five projects lives in a separate repository on Github. We have each of them as a submodule in [a common repository called release](https://github.com/datamicroscopes/release/tree/999b16923f6cd282b818f6edc635cc4c62332cba). Each of these projects has a `build.sh` and `meta.yaml` file (required by Anaconda.org) in [a subdirectory called `conda/PACKAGE-NAME`](https://github.com/datamicroscopes/common/tree/484ef42223608e3374a5d659837c0014986ddf2d/conda/microscopes-common).

In my release directory, I have a simple Python script called [build.py](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/build.py). It takes the name of a submodule and an Anaconda.org channel as command line arguments. It then uses the [Python sh module](http://amoffat.github.io/sh/) to [call the `conda build` and `binstar upload` commands](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/build.py#L20-L24).

`binstar upload` requires authentication at Anaconda.org. I did this by using a [Binstar token](http://docs.binstar.org/token_gen.html) which I add to the [`binstar`](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/build.py#L11-L15) command after fetching it from an [encrypted Travis environmental variable](http://docs.travis-ci.com/user/environment-variables/ "Environment Variables - Travis CI").

I call `build.py` for each of the five projects from the `script:` section of my [.travis.yml](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/travis.yml#L18-L23) file. This will build the each package on the Travis workers and then release to Anaconda.org.

There is no easy way to get Travis to build for Linux and OS X simultaneously. However, it can be tricked into building for one or the other by changing the `language:` specified in the `.travis.yml` file. (`language: objective-c` will force Travis to use an OS X work; by default, it uses a Linux worker.) I wrote a [fabric](http://www.fabfile.org/ "Welcome to Fabric! &mdash; Fabric  documentation") [script](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/fabfile.py) that provides command line commands which will [modify the `language` value](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/fabfile.py#L23) in my `.travis.yml` file and then [push the release repository](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/fabfile.py#L38-L41) to Github. Github triggers a Travis CI build which then deploys the repository to Anaconda.org!

If I want to cut a new release for OS X, I simply call `$ fab release_osx`, for Linux, I call `$ fab release_linux`. By default, this will release to the "main" channel on Anaconda.org. I can release to a different channel (e.g. "dev") with `$ fab release_linux:dev`. When specifying the channel, the fabfile will [modify my `.travis.yml` file](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/fabfile.py#L24) to set an environmental variable that is picked up [when calling `build.py`](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/travis.yml#L19-L23).

Finally, my `.travis.yml` file instructs Travis on preparing the build environment differently between operating systems by using Travis's built in `$TRAVIS_OS_NAME` environmental variable [and calling appropriate setup scripts](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/travis.yml#L8-L9).[^fabfile]

Also, to update the submodules to `origin/master`, I created a fabric command: `$ fab update`. [This command](https://github.com/datamicroscopes/release/blob/999b16923f6cd282b818f6edc635cc4c62332cba/fabfile.py#L44-L56) calls `git submodule update --remote --rebase`.

This certainly isn't a perfect solution, but it'll work for the time being. I certainly look forward to easier solutions being developed in the future![^anacondabuilds]

_Thanks to my colleague [Stephen Tu](http://www.cs.berkeley.edu/~stephentu/) who laid a lot of the groundwork for this!_

[^fabfile]: You may notice I have files called `travis.yml` and `.travis.yml`. Originally, my fabfile just modified the latter on the fly. For clarity, I started using `travis.yml` as the canonical file and `.travis.yml` is what is generated by the fabfile commands and used by Travis.
[^anacondabuilds]: Continuum is starting to provide [paid, hosted build servers](http://docs.anaconda.org/build-config.html#BuildWorkers) to do this very task