---
title: Installing Python on Mohave with pyenv
date: 2019-05-30
slug: installing-python
category: Article
description: How to install Python with pyenv on MacOS Mohave
---

I use [pyenv](https://github.com/pyenv/pyenv) to manage Python versions on my Mac. I recently have gotten errors like

```
WARNING: The Python sqlite3 extension was not compiled. Missing the SQLite3 lib?
```

and

```
zipimport.ZipImportError: can't decompress data; zlib not available
```

The solution seems to be setting `LDFLAGS` and `CPPFLAGS` to point to the sqlite3 and zlib libraries, e.g.:

```bash
brew install sqlite3
brew install zlib

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"
pyenv install 3.7.0
```

