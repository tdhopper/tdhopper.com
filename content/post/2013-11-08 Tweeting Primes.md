---
title: Tweeting Primes
category: Article
slug: tweeting-primes
aliases: [/blog/2013/Nov/08/tweeting-primes/]
date: 2013-11-08
---

I recently discovered the Twitter account [@_primes_](https://twitter.com/_primes_). Every hour, they tweet the subsequent prime number. This made me wonder two things. First, what is the largest prime that you can tweet (in base-10 encoding in 140 characters).[^mersenne] Second, how long until they get there.

Doing some quick calculations in Mathematica, I believe the largest 140 digit prime is the following:

9999999999999999999999999999999999999999999999</br>
9999999999999999999999999999999999999999999999</br>
999999999999999999999999999999999999999999999997

Wolfram Alpha [confirms that this is prime](http://www.wolframalpha.com/input/?i=IsPrime%5B99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999997) and that the [next prime is 141 characters](http://www.wolframalpha.com/input/?i=Length%5BIntegerDigits%5BNextPrime%5B99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999997%5D%5D%5D).

As for how long it would take, recall that the number of primes less than $n$ [is approximately](http://en.wikipedia.org/wiki/Prime_number_theorem) $\frac{n}{\ln n}$. The number of primes less than $10^{141}$ is approximately

$$\pi(10^{140}) = \frac{10^{140}}{140\cdot \ln 10} = 3.1\cdot 10^{137}.$$

That's $3\cdot 10^{57}$ times the estimated number of atoms in the universe. Looks like [@_primes_](https://twitter.com/_primes_) should be able to tweet for a while.

[^mersenne]: The [largest known prime](http://en.wikipedia.org/wiki/Mersenne_primes) is $2^{57,885,161} − 1$ and has 17,425,170 digits.
