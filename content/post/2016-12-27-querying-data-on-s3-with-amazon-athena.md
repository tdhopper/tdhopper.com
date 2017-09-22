---
title: Querying data on S3 with Amazon Athena
categories:
  - "Articles"
date: 2016-12-27
slug: querying-data-on-s3-with-amazon-athena
aliases: [/blog/2016/Dec/27/querying-data-on-s3-with-amazon-athena/]
---

## Athena Setup and Quick Start

Last week, I needed to retrieve a subset of some log files stored in S3. This seemed like a good opportunity to try Amazon's new Athena service. According to [Amazon](https://aws.amazon.com/athena/):

> Amazon Athena is an interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL. Athena is serverless, so there is no infrastructure to manage, and you pay only for the queries that you run.

> Athena is easy to use. Simply point to your data in Amazon S3, define the schema, and start querying using standard SQL. Most results are delivered within seconds. __With Athena, there’s no need for complex ETL jobs to prepare your data for analysis__.

Athena uses [Presto](https://prestodb.io/) in the background to allow you to run SQL queries against data in S3. On paper, this seemed equivalent to and easier than mounting the data as Hive tables in an EMR cluster.

The Athena user interface is similar to [Hue](http://gethue.com/) and even includes an interactive tutorial where it helps you mount and query publically available data. It was easy for me to mount my private data using the same `CREATE` statement I'd run in Hive:

```
CREATE EXTERNAL TABLE IF NOT EXISTS default.logs (
    - SCHEMA HERE
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
LOCATION 's3://bucket/path/';
```

At this point, I could write SQL queries against `default.logs`. Queries run from the Athena UI run in the background; even if you close the browser window, the query continues to run. Up to 5 queries can be run simultaneously.

Query results can be downloaded from the UI as CSV files. Results are also written as a CSV file to an S3 bucket; by default, results go to `s3://aws-athena-query-results-<account-id>-region/`. You can change the bucket by clicking [Settings in the Athena UI](http://docs.aws.amazon.com/athena/latest/ug/getting-started.html).

Up to this point, I was thrilled with the Athena experience. However, after this, I started to uncover the limitations.

## Athena Limitations

First, Athena doesn't allow you to create an external table on S3 and then write to it with `INSERT INTO` or `INSERT OVERWRITE`. Thus, you can't script where your output files are placed. More [unsupported SQL statements are listed here](http://docs.aws.amazon.com/athena/latest/ug/language-reference.html#unsupported-ddl).

Next, the Athena UI only allowed one statement to be run at once. Because I wanted to load partitioned data, I had to run a bunch of statements of the form `ALTER TABLE default.logs ADD partition (d = numeric-date) LOCATION 's3://bucket/path/numeric-date/'; using the Athena UI would've required me to run these one day at a time. Thankfully, I was able to run them all at once [in SQL Workbench](https://docs.aws.amazon.com/athena/latest/ug/connect-with-jdbc.html).

Third, Athena's output format is highly limited. It strictly outputs CSV files _where every field is quoted_. This was particularly problematic for me because I hoped to later load my data into Impala, and Impala can't extract text data from quoted fields! I was told by Athena support "We do plan to make improvements in this area but I don’t have an ETA yet."

Finally, Athena fell flat on its face in the presence of bad records. I'm not sure whether I had bad GZIPs for malformed logs, but when I did, Athena stopped in its tracks. For my application, I needed my query engine to be able to ignore bad files. Adding to the frustration, even when a query failed, Athena would write partial output (up to the failure) to S3, yet the output files didn't provide any indication that they were _partial_, incomplete output.

## Conclusion

My first encounter with Athena was a flop. I ended up switching to EMR and filtering my logs with Hive. Until it offers more control over output and better error handling, Athena will be of limited value to me.