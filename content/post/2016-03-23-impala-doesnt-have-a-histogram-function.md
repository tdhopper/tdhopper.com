---
title: Impala Doesn't Have a histogram() function
slug: impala-doesn't-have-a-histogram()-function
aliases: [/blog/2016/Mar/23/impala-doesnt-have-a-histogram-function/]
category: Today I Learned
date: 2016-03-23
---

[Impala Doesn't Have a histogram() function](https://groups.google.com/a/cloudera.org/d/msg/impala-user/O8u5JFfKJPk/V0ZR1muNBAAJ).

Ibis's histogram works by normalizing a column and rounding to integers:

```sql
WITH t0 AS
  ( SELECT *
   FROM db.`table_name`)
SELECT floor((t0.`column_name` - (t1.`min_1fe5be` - 1e-13)) / ((t1.`max_1fe5be` - (t1.`min_1fe5be` - 1e-13)) / (NUM_BINS - 1))) AS `tmp`
FROM t0
CROSS JOIN
  ( SELECT min(`column_name`) AS `min_1fe5be`,
           max(`column_name`) AS `max_1fe5be`
   FROM t0 ) t1
   ```