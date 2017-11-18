---
title: iOS's Launch Center Pro, Auphonic, and RESTful APIs
category: Article
slug: ioss-launch-center-pro-auphonic-and-restful-apis
aliases: [/blog/2014/Sep/27/ioss-launch-center-pro-auphonic-and-restful-apis/]
date: 2014-09-27
---

Lately I've been using [Auphonic's](http://www.auphonic.com) web service for automating audio post-production and distribution. You can provide Auphonic with an audio file (via Dropbox, FTP, web upload, and more), and it will perform any number of tasks for you, including

* Tag the track with metadata (including chapter markings)
* Intelligently adjust levels
* Normalize loudness
* Reduce background noise and hums
* Encode the audio in numerous formats
* Export the final production to a number of services (including Dropbox, FTP, and Soundcloud)

I am very pleased with Auphonic's product, and it's replaced a lot of post-processing tools I tediously hacked together with [Hazel](http://www.noodlesoft.com/hazel.php), Bash, and Python.

Among its many other features, API has a [robust RESTful API](https://auphonic.com/developers) available to all users. I routinely create Auphoic productions that vary only in basic metadata, and I have started using this API to automate creation of productions from my iPhone.

[Launch Center Pro](http://contrast.co/launch-center-pro/) is a customizable iOS app that can trigger all kinds of actions in other apps. You can also create input forms in LCP and send the data from them elsewhere. I created a LCP action with a form for entering title, artist, album, and track metadata that will eventually end up in a new Auphonic production.

The LCP action settings looks like this [^xcallback]:

![](/uploads/2014/09/lcp1.png)

When I launch that action in LCP, I get four prompts like this:

![](/uploads/2014/09/lcp2.png)

After I fill out the four text fields, LCP uses the [x-callback URL](http://x-callback-url.com/) I defined to send that data to [Pythonista](http://omz-software.com/pythonista/), a masterful "integrated development environment for writing Python scripts on iOS."

In Pythonista, I have a script called _New Production_. LCP passes the four metadata fields I entered as `sys.argv` variables to my Python script. The Python script adds these variables to a metadata dictionary that it then POSTs to the Auphonic API using the Python [_requests_](http://docs.python-requests.org/en/latest/) library. After briefly displaying the output from the Auphonic API, Pythonista returns me to LCP.

Here's my Pythonista script[^pythonista-script]:

```python
username = "AUPHONIC_USERNAME"
password = "AUPHONIC_PASSWORD

import sys
import requests
import webbrowser
import time
import json
import datetime as dt

# Read input from LCP
title = sys.argv[1]
artist = sys.argv[2]
album = sys.argv[3]
track = sys.argv[4]

d = {
        "metadata": {
            "title": title,
            "artist": artist,
            "album": album,
            "track": track
            }
    }

# POST production to Auphonic API
r = requests.post("https://auphonic.com/api/productions.json",
          auth=(username,password),
          data=json.dumps(d),
          headers={"content-type": "application/json"}).json()

# Display API Response
print "Response", r["status_code"]
print "Error:", r["error_message"]
for key, value in r.get("data",{}).get("metadata",{}).iteritems():
if value:
    print key, ':', value

time.sleep(2)
# Return to LCP
webbrowser.open("launch://")
```

After firing my LCP action, I can log into my Auphonic account and see a incomplete[^incomplete] production with the metadata I entered!

![](/uploads/2014/09/auphonic.png)

While I just specified some basic metadata with the API, Auphonic allows every parameter that can be set on the web client to be configured through the API. For example, you can [specify exactly what output files you want Auphonic to create](https://auphonic.com/api-docs/details.html#output-files) or [create a production using one of your presets](https://auphonic.com/api-docs/simple_usage.html). These details just needed to be added to the `d`
dictionary in the script above. Moreover, this same type of setup could be used with any RESTful API, not just Auphonic.

[^pythonista-script]: If you want to use this script, you'll have to provide your own Auphonic username and password.

[^xcallback]: Here is that x-callback URL of you want to copy it: `pythonista://{{New Production}}?action=run&args={{"[prompt:Title]" "[prompt:Artist]" "[prompt:Album]" "[prompt:Track]"}}`

[^incomplete]: It doesn't have an audio file and hasn't been submitted.
