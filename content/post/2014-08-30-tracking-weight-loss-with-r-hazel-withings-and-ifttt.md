---
title: Tracking Weight Loss with R, Hazel, Withings, and IFTTT
slug: tracking-weight-loss-with-r-hazel-withings-and-ifttt
aliases: [/blog/2014/Aug/30/tracking-weight-loss-with-r-hazel-withings-and-ifttt/]
date: 2014-08-30
category: Article
---

As I have [noted](http://tdhopper.com/blog/2013/Jul/26/noisy-series-and-body-weight/) [before](http://tdhopper.com//blog/2013/Nov/28/noisy-series-and-body-weight-take-2/), body weight is a noisy thing. Day to day, your weight will probably fluctuate by several pounds. If you're trying to lose weight, this noise can cause unfounded frustration and premature excitement.

When I started a serious weight loss plan a year and a half ago, I bought a wifi-enabled [Withings Scale](http://www.withings.com). The scale allows me to automatically sync my weight with [Montior Your Weight](http://www.bustan.net/), [MyFitnessPal](http://www.myfitnesspal.com), [RunKeeper](http://runkeeper.com/home "RunKeeper"), and other fitness apps on my phone. IFTTT also has [great Withings support](https://ifttt.com/withings "Withings Channel - IFTTT") allowing me to push my weight to various other web services.

One IFTTT rule I have appends my weight to a text file in Dropbox. This file looks like this:

```
263.86 August 21, 2014 at 05:56AM
264.62 August 22, 2014 at 08:27AM
264.56 August 23, 2014 at 09:41AM
263.99 August 24, 2014 at 08:02AM
265.64 August 25, 2014 at 08:08AM
267.4 August 26, 2014 at 08:16AM
265.25 August 27, 2014 at 09:08AM
264.17 August 28, 2014 at 07:21AM
264.03 August 29, 2014 at 08:43AM
262.71 August 30, 2014 at 08:47AM
```

For a few months, I have been experimenting with using this time series to give myself a less-noisy update on my weight, and I've come up with a decent solution.

This [R script](http://www.r-project.org/) will take my weight time series, resample it, smooth it with a rolling median over the last month, and write summary stats to a text file in my Dropbox. It's not the prettiest script, but it gets the job done for now.[^format]

```R
INPUT_PATH <- "~/Dropbox/Text Notes/Weight.txt"
OUTPUT_PATH <- "~/Dropbox/Text Notes/Weight Stats.txt"

library(lubridate)
library(ggplot2)
library(zoo)

# READ FILE
con <- file(INPUT_PATH, "rt")
lines <- readLines(con)
close(con)

# PARSE INTO LISTS OF WEIGHTS AND DATES
parse.line <- function(line) {
  s <- strsplit(line, split=" ")[[1]]
  date.str <- paste(s[2:10][!is.na(s[2:10])], collapse=" ")
  date <- mdy_hm(date.str, quiet=TRUE)
  l <- list(as.numeric(s[1]), date)
  names(l) <- c("weight", "date")
  l
}
list.weight.date <- lapply(lines, parse.line)
weights <- lapply(list.weight.date, function(X) X$weight)
dates <- lapply(list.weight.date, function(X) X$date)

# BUILD DATA FRAME
df <- data.frame(weight = unlist(weights), date = do.call("c", dates) )

# CREATE TIME SERIES AND RESAMPLE
ts <- zoo(c(df$weight), df$date)
ts <- aggregate(ts, time(ts), tail, 1)
g <- round(seq(start(ts), end(ts), 60 * 60 * 24), "days")
ts <- na.approx(ts, xout = g)

# FUNCTION TO GET WEIGHT N-DAYS AGO IF WEIGHT IS SMOOTHED BY ROLLING MEDIAN
# OVER A GIVEN (smooth.n) NUMBER OF DAYS
days.ago <- function(days, smooth.n) {
  date <- head(tail(index(ts),days + 1),1)
  smoothed <- rollmedianr(ts, smooth.n)
  as.numeric(smoothed[date])
}

# SMOOTH WEIGHT BY 29 DAYS AND GENERATE SOME SUMMARY STATS
days = 29
current.weight <- days.ago(0, days)
x <- c(current.weight,
       current.weight-days.ago(7, days),
       current.weight-days.ago(30, days),
       current.weight-days.ago(365, days),
       current.weight-max(ts))
x = round(x, 1)
names(x) = c("current", "7days", "30days", "365days", "max")


fileConn<-file(OUTPUT_PATH)
w <- c(paste("Weight (lbs):", x["current"]),
       paste("Total Δ:", x["max"]),
       paste("1 Week Δ:", x["7days"]),
       paste("1 Month Δ:", x["30days"]),
       paste("1 Year Δ:", x["365days"]))
writeLines(w,fileConn)
close(fileConn)
```
The output looks something like this:

```
Weight (lbs): 265.7
Total Δ: -112
1 Week Δ: -0.8
1 Month Δ: -4.8
1 Year Δ: -75
```

I want this script to be run every time my weight is updated, so I created a second IFTTT rule that will create a new file in my Dropbox, called _new\_weight\_measurement_, every time I weigh in. On my Mac Mini, I have a [Hazel](http://www.noodlesoft.com/hazel.php "Noodlesoft | Hazel") rule to watch for a file of this name to be created. When Hazel sees the file, it runs my R script and deletes that file.

My Hazel rule looks like this:

![](/uploads/2014/08/hazel-weight-1.png)

The 'embedded script' that is run is the R script above; I just have to tell Hazel to use the `Rscript` shell.[^install-R]

![](/uploads/2014/08/r-script-from-hazel.png)

At this point, every time I step on my scale, a text file with readable statistics about my smoothed weight appear in my Dropbox folder.

Of course, I want this updated information to be pushed directly too me. Hazel is again the perfect tool for the job. I have a second Hazel rule that watches for _Weight Stats.txt_ to be created. Hazel can pass the path of the updated file into any script of your choice. You could, for example, use [Mailgun](http://www.mailgun.com/ "Transactional Email API Service for Developers - Mailgun") to email it to yourself or [Pushover](https://pushover.net/ "Pushover: Simple Notifications for Android, iOS, and Desktop") to push it to your mobile devices. Obviously, I want to tweet mine.

I have a Twitter account called [@hopsfitness](https://twitter.com/hopsfitness) where I've recently been tracking my fitness progress. On my Mac Mini, I have [t](https://github.com/sferik/t "t GitHub") configured to access @hopsfitness from the command line. Thus, tweeting my updated statistics is just a matter of a little shell script executed by Hazel:

![](/uploads/2014/08/hazel-weight-2.png)

Since this data goes to Twitter, I can get it painlessly pushed to my phone: Twitter still allows you subscribe to accounts via text message, which I've done with @hopsfitness. A minute or so after I step on my scale, I get a text with useful information about where I am and where I'm going; this is much preferable to the noisy weight I see on my scale.

__Update__ (2014-12-06): I replaced my R script with a Python/pandas script. It requires Python 3 (to render the delta characters).

```python
import dateutil
import pandas as pd
import random
from os.path import expanduser, join
home = expanduser("~")


with open(join(home, "Dropbox/Text Notes/Weight.txt"), "r") as f:
    lines = f.readlines()


def parse_line(line):
    s = line.split(" ")
    weight = float(s[0])
    date = dateutil.parser.parse(' '.join(s[1:4]))
    return date, weight

weight = pd.DataFrame([parse_line(l) for l in lines], columns=["date", "weight"]) \
    .set_index("date") \
    .resample("1D", how="mean")
weight["missing"] = weight.weight.isnull()
weight.weight = weight.weight.interpolate(method="linear")
std = weight.weight.diff().dropna().std()
noise = weight.missing.map(lambda missing: random.normalvariate(0, std) if missing else 0)
weight.weight = weight.weight + noise

smoothed = pd.ewma(weight.weight, span=30)
current = smoothed[-1]
stats = """
Weight (lbs): %(weight).1f
Total Δ: %(total).1f
1 Week Δ: %(week).1f
1 Month Δ: %(month).1f
1 Year Δ: %(year).1f
""".strip() % {"weight": current,
               "total": current - smoothed[0],
               "week": current - smoothed[-8],
               "month": current - smoothed[-32],
               "year": current - smoothed[-366],
               }

with open(join(home, "Dropbox/Text Notes/Weight Stats.txt"), "wb") as f:
    f.write(bytes(stats, 'UTF-8'))

```

 [^format]: This assumes your input file is formatted like mine, but you could easily adjust the first part of the code for other formats.
 [^install-R]: You can [download R here](http://www.r-project.org/ "The R Project for Statistical Computing"); installing it should add `Rscript` to your system path.
