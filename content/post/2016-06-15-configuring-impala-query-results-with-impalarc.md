---
title: Configuring Impala Query Results with impalarc
slug: configuring-impala-query-results-with-impalarc
aliases: [/blog/2016/Jun/15/configuring-impala-query-results-with-impalarc/]
category: Today I Learned
date: 2016-06-15
---

I routinely run Impala queries on a [remote machine](http://til.tdhopper.com/notes/faster-ssh-access-to-remote-computers) and want the results to save to a CSV file on that machine.

I recently realized that I should setup an Impala config file on that machine to configure the connection to the Impala cluster and the output file format.

So I created a text file at `~/.impalarc` with the following settings:

```
[impala]
impalad=CLUSTER-ADDRESS:PORT
output_delimiter=,
verbose=true
ignore_query_failure=false
default_db=prd
write_delimited=true
print_header=true
```

Now when I run a query with `impala-shell`, I don't have to specify the address of the cluster, or the various flags required to get a CSV with a header.

Other impala-shell config options are specified [here](http://www.cloudera.com/documentation/archive/impala/2-x/2-0-x/topics/impala_shell_options.html)