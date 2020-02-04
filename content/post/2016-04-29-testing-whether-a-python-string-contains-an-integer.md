---
title: Testing whether a Python string contains an integer
slug: testing-whether-a-python-string-contains-an-integer
aliases: [/blog/2016/Apr/29/testing-whether-a-python-string-contains-an-integer/]
category: Today I Learned
date: 2016-04-29
---

If you want to check whether a Python string is an integer, you can try casting to an int with `int()` and catching the `ValueError` if it's not an integer:

```python
def is_integer(value: int, *, base: int=10) -> bool:
    try:
        int(value, base=base)
        return True
    except ValueError:
        return False
```

To check for _nonnegative_ integers, you can use the [`str.is_digit()` method](https://docs.python.org/3.8/library/stdtypes.html#str.isdigit). It will "return true if all characters in the string are digits and there is at least one character, false otherwise:

```python
>>> "123".isdigit()
True
>>> "-123".isdigit()
False
```

<small>Thanks to [Jeremy Kahn for reminding me](https://twitter.com/trochee/status/726162607460114433) that `isdigit` only detects positive integers.</small>

