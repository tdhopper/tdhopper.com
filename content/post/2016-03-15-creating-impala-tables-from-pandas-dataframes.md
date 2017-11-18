---
title: Creating Impala Tables from Pandas Dataframes
slug: creating-impala-tables-from-pandas-dataframes
aliases: [/blog/2016/Mar/15/creating-impala-tables-from-pandas-dataframes/]
category: Today I Learned
date: 2016-03-15
---

[Wes Mckinney](http://wesmckinney.com/ "Wes McKinney")'s [Ibis](http://docs.ibis-project.org/index.html), a Pythonic interface to Impala, has functionality for creating [Impala](https://www.cloudera.com/products/apache-hadoop/impala.html "Apache Impala") tables from [Python Pandas](http://pandas.pydata.org/ "Python Data Analysis Library &mdash; pandas: Python Data Analysis Library") dataframes.

```python
import pandas as pd
import ibis

hdfs = ibis.hdfs_connect(host=webhdfs_host, port=webhdfs_port)
client = ibis.impala.connect(host=impala_host, port=impala_port,
                             hdfs_client=hdfs)
db = c.database('ibis_testing')
data = pd.DataFrame({'foo': [1, 2, 3, 4], 'bar': ['a', 'b', 'c', 'd']})
db.create_table('pandas_table', data)
```

[This functionality](http://docs.ibis-project.org/impala.html#creating-tables), added in Ibis 0.6.0, is _much_ easier that manually move data to HDFS and loading into Impala.