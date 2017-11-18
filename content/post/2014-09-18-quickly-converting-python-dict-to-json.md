---
title: Quickly Converting Python Dict to JSON
category: Article
slug: quickly-converting-python-dict-to-json
aliases: [/blog/2014/Sep/18/quickly-converting-python-dict-to-json/]
date: 2014-09-18
---

Recently, I've spent a lot of time going back and forth between Python dicts and JSON. For some reason, I decided last week that I'd be useful to be able to quickly convert a Python dict to pretty printed JSON.

I created a [TextExpander](http://smilesoftware.com/TextExpander/index.html) snippet that takes a Python dict from the clipboard, converts it to JSON, and pastes it.

Here are the details:

![](/uploads/2014/09/textexpander.png)

```python
#!/usr/bin/env python
import os, json
import subprocess

def getClipboardData():
 p = subprocess.Popen(['pbpaste'], stdout=subprocess.PIPE)
 retcode = p.wait()
 data = p.stdout.read()
 return data

cb = eval(getClipboardData())

print json.dumps(cb, sort_keys=True, indent=4, separators=(',', ': '))
```
