---
title: My Python Environment Workflow with Conda
category: Tutorial
tags: []
date: 2015-11-24
slug: my-python-environment-workflow-with-conda
aliases: [/blog/2015/Nov/24/my-python-environment-workflow-with-conda/, /conda/]
description: How Conda Environments for managing and reproducing dependencies have helped me streamline data science research.
Thumbnail: /uploads/conda.png
featured: True
---

Many new Python programmers rely on their system install of Python to run their scripts. There are several good reasons to stop using the system Python. First, it's probably an old version of Python. Secondly, if you install 3rd party packages with [pip](https://pypi.python.org/pypi/pip), every package is installed into the same globally accessible directory. While this may sound convenient, it causes problems if you (1) install different packages with the same name (2) need to use different versions of the same package (3) upgrade your operating system (OS X will delete all the packages you have installed).

For many years, best practice for Python developers was to use virtualenv to create a sandbox-ed environment for each project. If you use virtualenv, each project you work on can have its own version of Python with its own 3rd party packages (hopefully specified in an `requirements.txt` file). In my experience, getting started with virtualenv is cumbersome and confusing; to this day, I have to look up the command to create a Python 3 virtualenv.[^python-version]

In 2015, I have almost exclusively used Python installations provided through [Continuum Analytics's](https://www.continuum.io/ "Continuum") [Conda/Anaconda](http://conda.pydata.org/docs/intro.html "Intro to conda &mdash; Conda   documentation") platform. I have also switched from using virtualenvs to using [conda environments](http://conda.pydata.org/docs/using/envs.html "Managing environments &mdash; Conda   documentation"), and I am loving it.

Before explaining my workflow, here's a quick glossary of the similarly-named products that Continuum offers.

1. [conda](http://conda.pydata.org/docs/intro.html): "Conda is an open source package management system and environment management system for installing multiple versions of software packages and their dependencies and switching easily between them. It works on Linux, OS X and Windows, and was _created for Python programs but can package and distribute any software._"[^conda] A conda install provides a whole suite of command line tools for installing and managing packages and environments. Because conda works for any software, it can even install different versions of Python (unlike pip).
2. [Anaconda](https://www.continuum.io/downloads): "Anaconda is a completely free Python distribution (including for commercial use and redistribution). It includes more than 300 of the most popular Python packages for science, math, engineering, and data analysis." It is available across platforms and installable through a binary.
3. [Anaconda Cloud](https://anaconda.org): Also known as Anaconda.org and formerly known as Binstar, "Anaconda Cloud is a package management service where you can host software packages of all kinds." Anaconda Cloud is a package repository analogous to PyPI. Packages are installed via the conda command line tool instead of Pip. By default, the `conda install` command installs packages from a curated collection of packages (a superset of those in Anaconda). Continuum allows users to host their own packages on Anaconda Cloud; these packages can also be installed through `conda install` using the `-n` flag with the username.

Conda, Anaconda, and Anaconda cloud are distinct but interrelated tools; keeping them straight can be hard, but is helpful.

Conda (the package manager) can be installed in two ways. Through the [Miniconda](http://conda.pydata.org/miniconda.html) installer or the [Anaconda](https://www.continuum.io/downloads) installer. Both install the package manager, but the latter also installs the 300+ packages for scientific Python. (Installing Anaconda is equivalent to installing Miniconda and then running `conda install anaconda`.)

## Conda Environment Files

It has become standard for pip users to create a `requirements.txt` file for specifying dependencies for a particular project. Often, a developer working a project will (1) create and activate a virtual environment (2) run `pip install -r requirements.txt` to build an isolated development environment with the needed packages.

Conda provides an analogous (but more powerful) file: `environment.yml`.[^requirements-conda]

A simple `environment.yml` file might look like this:

```yml
name: numpy-env
dependencies:
- python=3
- numpy
```

If you are in a directory containing this file, you can run `$ conda env create` to create a Conda environment named `numpy-env` that runs Python 3 and has [numpy](http://www.numpy.org/ "NumPy &mdash; Numpy") installed[^numpy]. Run `$ source activate numpy-env` to activate this environment. Once activated, running `$ python` will run Python 3 from your environment instead of the globally installed Python for your system. Moreover, you will be able to `import numpy` but not any of the 3rd party packages installed globally.

`environment.yml` can also install packages via pip with this syntax:

```yml
name: pip-env
dependencies:
- python
- pip
- pip:
    - pypi-package-name
```

I see `environment.yml` files as a positive development from `requirements.txt` files for several reasons. Foremost, they allow you to specify the version of Python you want to use. At Pydata NYC 2015, many presenters provided their code in Github repositories without specifying anywhere whether they were using Python 2 or 3. Because I [included a YAML file](https://github.com/tdhopper/pydata-nyc-2015/blob/55b9d2892b18e1d191325fc1890740901723dcfd/environment.yml), attendees could see exactly what version I was using and quickly install it with `conda env create`. I also like being able to specify the name of the environment in the file; this is particularly helpful when working with others. Finally, because conda can install from PyPI via pip, `environment.yml` files provide no less functionality than a `requirements.txt` file provides.

## My Python Environment Workflow

Lately, whenever I am working on a new project (however big or small), I follow the following steps:

1. Create a project folder in the `~/repos/` directory on my computer.
2. Create an `environment.yml` file in the directory. Typically the environment name will be the same as the folder name. At minimum, it will specify the version of Python I want to use; it will often include `anaconda` as a dependency.[^conda-env-file]
3. Create the conda environment with `$ conda env create`.
4. Activate the conda environment with `$ source activate ENV_NAME`.
5. Create a `.env` file containing the line `source activate ENV_NAME`. Because I have [autoenv](https://github.com/kennethreitz/autoenv) installed, this file will be run every time I navigate to the project folder in the Terminal. Therefore, my conda environment will be activated as soon as I navigate to the folder.
6. Run `$ git init` to make the folder a Git repository. I then run `$ git add environment.yml && git commit -m 'initial commit'` to add the YAML file to the repository.
7. If I want to push the repository to Github, I use `$ git create` using Github's [hub](https://github.com/github/hub) commands. I then push the master branch with `$ git push -u origin master`.

As I add dependencies to my project, I try to be sure I add them to my `environment.yml` file.

A major benefit of all this is how easily reproducible a development environment becomes. If a colleague or conference attendee wants to run my code, they can setup the dependencies (_including_ Python version) by (1) cloning the repository, (2) running `$ conda env create`, (3) running `$ source activate ENV_NAME`. It's easy enough for me to drop those instructions and further instructions for running the code in a README file. If I'm feeling especially helpful, I'll create a [Makefile](http://mrbook.org/blog/tutorials/make/ "Makefiles &#8211; Mrbook&#039;s Stuff") or [Fabfile](http://www.fabfile.org/ "Welcome to Fabric! &mdash; Fabric  documentation") to encapsulate commands for core functionality of the code.

An even larger benefit is that I can return to a project after, days, months, or years and quickly start developing without first having to hunt for `print` statements to figure out whether I was using Python 2 or 3.

I've come to love `environment.yml` files, and I think you might too.

[^python-version]: virtualenv also provides no helping in actually managing Python versions. You have to install each version yourself and then tell virtualenv to use it.
[^conda]: From the [conda docs](http://conda.pydata.org/docs/).
[^requirements-conda]: Though there is currently a pull request for adding `requirements.txt` support to conda: [https://github.com/conda/conda-env/pull/172](https://github.com/conda/conda-env/pull/172).
[^numpy]: Numpy will be installed from a binary from Anaconda Cloud, not built from source.
[^conda-env-file]: I created a bash command [`conda-env-file`](https://github.com/tdhopper/dotfiles/blob/f319aca85d034488d2a37f43e2ee7c49c057cef6/bash_functions#L119-L139) to automatically create an `environment.yml` file named after the current directory.
