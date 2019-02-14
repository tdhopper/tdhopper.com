---
title: "Pyspark's AggregateByKey Method"
slug: pysparks-aggregatebykey-method
aliases: [/blog/2014/Oct/03/pysparks-aggregatebykey-method/]
date: 2014-10-03
category: Article
pull_quote: I create an RDD that is a short list of characters. My functions will aggregate the functions together with concatenation. I added brackets to the two types of concatenation to help give you an idea of what `aggregateByKey` is doing.
---

The [pyspark documentation](https://spark.apache.org/docs/2.2.0/rdd-programming-guide.html) doesn't include an example for the aggregateByKey RDD method. I didn't find any nice examples online, so I wrote my own.

Here's what the documentation does say:

`aggregateByKey(self, zeroValue, seqFunc, combFunc, numPartitions=None)`

> Aggregate the values of each key, using given combine functions and a neutral "zero value". This function can return a different result type, U, than the type of the values in this RDD, V. Thus, we need one operation for merging a V into a U and one operation for merging two U's, The former operation is used for merging values within a partition, and the latter is used for merging values between partitions. To avoid memory allocation, both of these functions are allowed to modify and return their first argument instead of creating a new U.

`reduceByKey` and `aggregateByKey` are much more efficient than `groupByKey` and should be used for aggregations as much as possible.

In the example below, I create an RDD that is a short list of characters. My functions will aggregate the functions together with concatenation. I added brackets to the two types of concatenation to help give you an idea of what `aggregateByKey` is doing.

```
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /__ / .__/\_,_/_/ /_/\_\   version 1.1.0
      /_/

Using Python version 2.7.5 (default, Mar  9 2014 22:15:05)
SparkContext available as sc.

In [1]: # Create rdd that is a list of characters

In [2]: sc.parallelize(list("aaaaabbbbcccdd")) \
   ...:         .map(lambda letter: (letter, {"value": letter})) \
   ...:         .aggregateByKey(
   ...:                    # Value to start aggregation (passed as s to `lambda s, d`)
   ...:                    "start",
   ...:                    # Function to join final data type (string) and rdd data type
   ...:                    lambda s, d: "[ %s %s ]" % (s, d["value"]),
   ...:                    # Function to join two final data types.
   ...:                    lambda s1, s2: "{ %s %s }" % (s1, s2),
   ...:                    ) \
   ...:         .collect()

Out[2]:
[('a', '{ { [ start a ] [ [ start a ] a ] } [ [ start a ] a ] }'),
 ('c', '{ [ start c ] [ [ start c ] c ] }'),
 ('b', '{ { [ [ start b ] b ] [ start b ] } [ start b ] }'),
 ('d', '[ [ start d ] d ]')]

```
