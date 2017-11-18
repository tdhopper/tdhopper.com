---
title: Concatenate MP3 Files
slug: concatenate-mp3-files
aliases: [/blog/2015/Mar/15/concatenate-mp3-files/]
category: Today I Learned
date: 2015-03-15
---

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">TIL `cat` will correctly join MP3 files <a href="http://t.co/mmc4NN2Kmp">http://t.co/mmc4NN2Kmp</a></p>&mdash; Tim Hopper (@tdhopper) <a href="https://twitter.com/tdhopper/status/577149891077619713">March 15, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

From Stackoverflow:

> An MP3 file is nothing more than the raw MPEG2-Layer 3 (audio) stream data, there is no file level header structure with, for example, duration, original source, encoding info.

Thus

```bash
cat file1.mp3 file2.mp3 > out.mp3
```

can join MP3 files.