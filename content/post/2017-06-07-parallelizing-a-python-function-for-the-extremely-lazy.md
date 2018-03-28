---
title: Parallelizing a Python Function for the Extremely Lazy
date: 2017-06-07
slug: parallelizing-a-python-function-for-the-extremely-lazy
aliases: [/blog/2017/Jun/07/parallelizing-a-python-function-for-the-extremely-lazy/]
category:
  - Articles
Description: How to use a simple Python CLI and GNU Parallel to quickly run a Python process on multiple cores.
---

Do you ever want to be able to run a Python function in parallel on a set of inputs? Have you ever gotten frustrated with the GIL, the multiprocessing library, or joblib?

Try this:

#### Install Python Fire to run your command from the command line

Install [Python Fire](https://github.com/google/python-fire) with `$ pip install fire`.

Add this snippet to the bottom of your file:

```
if __name__ == '__main__':
    import fire
    fire.Fire()
```

#### Install GNU Parallel

`$ brew install parallel` or ``$ sudo apt-get install parallel`` may work for you. Otherwise, see [this](https://www.gnu.org/software/parallel/).

#### Run your function from the command line

`$ parallel -j3 "python python_file.py function_name {1} " ::: input1 input2 input3 input4 input5`

* `parallel` is the command for GNU Parallel.
* `-j3` tells Parallel to run at most 3 processes at once.
* `{1}` fills in each item after the `:::` as an argument to the `function_name`.

#### For example

```text
(lazy) ~ $ cat python_file.py
from time import sleep

def function_name(arg1):
    print("Starting to run with", arg1)
    sleep(2)
    print("Finishing to run with", arg1)

if __name__ == '__main__':
    import fire
    fire.Fire()
(lazy) ~ $ parallel -j3 --lb  "python -u python_file.py function_name {1} " ::: input1 input2 input3 input4 input5
Starting to run with input2
Starting to run with input1
Starting to run with input3
Finishing to run with input2
Finishing to run with input1
Finishing to run with input3
Starting to run with input4
Starting to run with input5
Finishing to run with input4
Finishing to run with input5
```

I added `--lb` and `-u` to keep Python and Parallel from buffering the output so you can see it being run in parallel.
