---
title: Get Pykafka to work with rdkafka on Linux
slug: get-pykafka-to-work-with-rdkafka-on-linux
aliases: [/blog/2016/Nov/18/get-pykafka-to-work-with-rdkafka-on-linux/]
category: Today I Learned
date: 2016-11-18
---

My former colleague's from Parse.ly wrote the fantastic [pykafka](https://github.com/Parsely/pykafka) library with an optional c-backed using [rdkafka](https://github.com/edenhill/librdkafka). I've had trouble getting it to work, and here are a few things I've learned:

* The version of rdkafka installable with apt-get was out of data, and pykafka couldn't find the headers it need. I instead used the simple [build instructions](https://github.com/edenhill/librdkafka#building) in the rdkafka README to build it from head.
* I was getting the error `ImportError: librdkafka.so.1: cannot open shared object file: No such file or directory` when trying to use rdkafka from Pykafka. It could be set in the short term by using `LD_LIBRARY_PATH=/usr/local/lib`. However, I fixed it permanently by running [`sudo ldconfig`](https://linux.die.net/man/8/ldconfig) after building rdkafka.
* Pykafka has to be installed _after_ building rdkafka. At the moment, Pykafka tries to build a C-extension to connect to rdkafka, and if that fails, it will install without offering the rdkafka backend. Check the output of `pip install pykafka` [to see if the rdkafka extension built](https://github.com/Parsely/pykafka/blob/1b946fa288dd5eb278f397e858e887146e048e47/setup.py#L164-L172).


