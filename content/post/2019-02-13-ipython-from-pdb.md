---
title: Access a IPython repl from pdb
date: 2019-02-13
slug: ipython-pdb
category: Article
description: How to drop into an IPython repl from the Python debugger
---

I'm a big fan of using [pdb](https://docs.python.org/3/library/pdb.html), the Python interactive debugger in conjunction with Pytest as I'm writing code.[^pdbpp] With the `--pdb` flag, you can have Pytest drop into pdb when a test fails. With `pytest.set_trace()`, you can selectively enter pdb while running your tests. (I use this where I might've just added print statements in the past.)

A colleague uses IPython for most of his interactive development and asked me for help with some of the friction in his workflow. I recommended pdb, but he wanted to stick with the familiar IPython repl for much of his work.[^ipdb] He figured how to [drop into an IPython repl](https://ipython.readthedocs.io/en/stable/interactive/reference.html#embedding) from pdb with `from IPython import embed; embed()`. You can't move up and down the call stack until you exit the repl, but you have access to all the local state you have in pdb.[^ipdb]

To simplify this, I recommended leveraging two little-known pdb features: `alias` and `.pdbrc`. [`alias`](https://docs.python.org/3/library/pdb.html#debugger-aliases) allows you to set alias for statements in pdb; in this case `ipy` as an alias that drops into IPython:

```
alias ipy from IPython import embed; embed()
```

pdb also as the ability to load a config file from the user's home directory or the current working directory. Each line in the file is just a pdb statement. Thus, if you can create `~/.pdbrc` and add the alias statement above, the `ipy` command becomes available in every pdb session for your user.

[^pdbpp]: I highly recommend pip installing [pdbpp](https://pypi.org/project/pdbpp/), which replaces the default pdb with an enhanced debugger with syntax highlighting, tab completion, and more.
[^ipdb]: There's also an alternative debugger for Python based on IPython: [ipdb](https://pypi.org/project/ipdb/).
