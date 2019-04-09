---
title: Web Development and Design for the Backend Developer
category: Tutorial
date: 2017-03-31
slug: web-development-and-design-for-the-backend-developer
aliases: [/blog/2017/Mar/31/web-development-and-design-for-the-backend-developer/]
description: An overview of the front-end development technologies I've realized I need to learn more about and links to the resources I've found valuable in learning about them.
pull_quote: I still have a lot of learning and a lot of practicing ahead of me, but I'm starting to feel confident that I could make headway on some of my projects. The modern frontend development landscape is massive, varied, and ever changing, but that shouldn't prohibit you from diving in if you want to.
---

I've been tinkering with websites for nearly 20 years. My friend Hunter and I were big into making terrible Angelfire sites as pre-teens. In high school, my dad paid me to make him a webpage for his doctor's office (I used Frontpage). A year or two after that, I read Kevin Yank's "Build Your Own Database Driven Website Using PHP & MySQL" and hacked together a PHP back-end for a Lord of the Rings fan site.

In recent years, I've put together this blog, [shouldigetaphd.com](http://shouldigetaphd.com), and a [few other simple web-based side projects](http://tdhopper.com/about-me/). However, I haven't kept up with modern web development, and my projects have been hacked together from boilerplate or templates. I've programmed professionally since 2011, I've spent very little of that writing anything close to graphical user interfaces.

I have a number of other side projects that I'd like to do at some point, and most of them would require some sort of graphical interface. While I could work on app development, I think web-based implementations would be a great starting place.

A few months back, I decided to stop watching Netflix on the treadmill and instead use those 45 minutes each morning to learn; in particular, I've been trying to learn more about modern(ish) web design and development. My work has a subscription to [Safari Books Online](http://safaribooksonline.com) which gives me access to copious technical books and video tutorials.

The number of resources available on Safari (along with YouTube, blog posts, etc) is astounding. I started many video tutorials on Safari that I quickly realized weren't going to be useful. Yet there many gems to be found, which I share here with you.

What follows is an overview of the technologies I've realized I need to learn more about and links to the resources I've found valuable in learning about them. If you think there are gaps I haven't yet filled or better resources than I've listed below, I'd love your feedback.

### What I Knew Going In

I've been a professional software developer and data scientist since 2012. I mostly write Python, but I've programmed in a number of different languages.

I have a pretty good grasp on how HTML and CSS work. I've used enough Javascript over the years to be dangerous; I understood how it runs in the browsers. I understand what a DOM is and how it relates to the page source.

I've used the [Python Flask web framework](http://flask.pocoo.org/) for several projects. I understand how to repond to HTTP requests with server-generated content. I had some idea of how to run my own web server on AWS.

I've used [Jekyll](https://jekyllrb.com/), [Hugo](http://gohugo.io/), and [Pelican](http://docs.getpelican.com/) to create statically generated sites.

I understood DNS at a high level, but never really learned what all the different DNS types were, and I didn't understand why name server changes take so long to propagate.

I had some idea of what [node.js](https://nodejs.org/en/ "Node.js") and [npm](https://www.npmjs.com/ "npm") are.

I'm a committed Sublime Text user.

### A Meta Tutorial on Web Development

A great place to start is Andrew Montalenti's lengthy tutorial on using Python, Flask, Bootstrap, and Mongo to rapidly prototype a website. The tutorial is out of date, but the principles still stand.

<div class="embed-responsive embed-responsive-16by9">
<iframe class="embed-responsive-item" width="640" height="360" src="https://www.youtube.com/embed/muMRNYPmQxE?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
</div>


Another great resource is Cody Lindley's free [Front-End Developer's Handbook](https://frontendmasters.com/books/front-end-handbook/). This is a substantial list meta-resource that organizes links for learning all angles of front-end development. "It is specifically written with the intention of being a professional resource for potential and currently practicing front-end developers to equip themselves with learning materials and development tools."

#### Chrome Developer Tools

One of the most important tools for me in learning more about web development has been the [Chrome Developer Tools](https://developer.chrome.com/devtools). You can live edit the DOM elements and style sheets and watch how a website changes. I've mostly learned Developer Tools through exploring it myself, but there are lots of tutorials for it on Youtube.

<div class="embed-responsive embed-responsive-16by9">
<iframe class="embed-responsive-item" width="640" height="360" src="https://www.youtube.com/embed/uRw4-yyvMAQ?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
</div>

#### HTML, CSS, and Bootstrap

Many modern websites are [responsive](https://en.wikipedia.org/wiki/Responsive_web_design): they automatically adapt to various size screens and devices, from phones to desktops. Writing responsive websites from scratch requires deep knowledge of HTML, CSS, Javascript, and browsers. Unless you're doing this professionally, you probably don't want to write a responsive site from scratch.

For several projects, I've used the lightweight [Skeleton](http://getskeleton.com/) project to create simple, responsive pages.

Recently, I decide to dive deep into the more robust [Bootstrap framework](http://getbootstrap.com/) originally developed at Twitter.

I watched Brock Nunn's [Building a Responsive Website with Bootstrap
](http://shop.oreilly.com/product/110000475.do) ([Safari](https://www.safaribooksonline.com/library/view/building-a-responsive/9781782164982/)), a two hour tutorial on getting started with Bootstrap. The [documentation for Bootstrap](http://getbootstrap.com/getting-started/) is clear (if terse) and worth reading through.

Once you have a basic idea of how Bootstrap works, the best thing you can do is start playing with it. Since I was familiar with the Pelican static site generator, I decided to switch this blog to Bootstrap theme starting with [pelican-bootstrap3](https://github.com/getpelican/pelican-themes/tree/master/pelican-bootstrap3).

I've worked with Bootstrap 3 until now. Bootstrap 4 is about to come out. [Bootstrap 4 moves the style sheets from LESS to SASS and adds Flexbox functionality](https://v4-alpha.getbootstrap.com/migration/
). Unless you understand what those mean (more below), you'd be fine using version 3.

I wanted to get a better grasp on CSS Selectors, so I read Eric Meyer's brief [Selectors, Specificity, and the Cascade: Applying CSS3 to Documents](https://www.amazon.com/Selectors-Specificity-Cascade-Applying-Documents/dp/1449342493/ref=as_li_ss_il?ie=UTF8&qid=1490966101&sr=8-3&linkCode=li2&tag=dothopper-20&linkId=260c71eee0317cf531ad099db4c8a816) ([Safari](https://www.safaribooksonline.com/library/view/selectors-specificity-and/9781449358334/))

<a href="https://www.amazon.com/Selectors-Specificity-Cascade-Applying-Documents/dp/1449342493/ref=as_li_ss_il?ie=UTF8&qid=1490966101&sr=8-3&linkCode=li2&tag=dothopper-20&linkId=260c71eee0317cf531ad099db4c8a816" target="_blank"><img border="0" class="pull-right" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1449342493&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=dothopper-20" ></a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=dothopper-20&l=li2&o=1&a=1449342493" width="1" height="1" border="0" alt="" class="pull-right" style="border:none !important; margin:0px !important;" />

I watched Marty Hall's [JavaScript, jQuery, and jQuery UI](http://www.coreservlets.com/javascript-jquery-tutorial/) tutorial ([Safari](https://www.safaribooksonline.com/library/view/javascript-jquery-and/9780134433950/)). I was able to skip big chunks where I already understood certain parts, but it helped me fill in lots of gaps.



#### Advanced Stylesheets (LESS, SASS, and Flexbox)

There are several alternatives to writing raw CSS. Two popular ones are [Less](http://lesscss.org/) and [SASS](http://sass-lang.com/). These "preprocessors" allow you to write CSS-like stylesheets but with constructs such as variables, nesting, inheritance, and mathematical operators.

I found this [brief tutorial on Less](http://shop.oreilly.com/product/0636920051213.do) ([Safari](https://www.safaribooksonline.com/library/view/learning-less/9781783989867/)) helpful, and I've enjoyed Less a lot. I haven't used SASS yet, but it's very similar. I'll probably switch to SASS when I start using Bootstrap 4.

Another modern innovation is the [Flexbox layout model](https://en.wikipedia.org/wiki/CSS_Flex_Box_Layout) for CSS. Stone River Learning has a great [tutorial](http://stoneriverelearning.com/p/css-flexbox) on Flexbox ([Safari](https://www.safaribooksonline.com/library/view/css-flexbox/100000006A0444/)). It seems that Flexbox is the future of CSS-based layouts, and it's worth learning about.

#### Advanced JavaScript (Elm, React, Angular, Backbone, Ember)

The JavaScript web framework space has exploded. Many of these are implementations of the [Model, View, Controller pattern](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller "Model-view-controller - Wikipedia"), including React, Angular, and Ember. These tools allow the creation of complex web apps (as well as mobile apps).

#### Web Server Operations and DNS

I learned a ton form [Linux Web Operations](http://shop.oreilly.com/product/0636920006066.do) ([Safari](https://www.safaribooksonline.com/library/view/linux-web-operations/9780133927757/)) by Ben Whaley. "The videos discuss the relationship between web and application servers, load balancers, and databases and introduce configuration management, monitoring, containers, cryptography, and DNS."

I've struggled with DNS configuration over the years, so I watched Cricket Liu's [Learning DNS](http://shop.oreilly.com/product/0636920040088.do) series ([Safari](https://www.safaribooksonline.com/library/view/learning-dns/9781771373692/)). I still wouldn't want to be responsible for a company's complex DNS infrastructure, but I can now configure my own sites DNS with a little more understanding.

#### Development Automation

##### Package Managers

It's likely that any modern web project will have some external Javascript dependencies. Package managers (analogous to Pypi or Anaconda.org on Python) have emerged to help support this. Node.js comes with the npm package manager, but [Bower](https://bower.io/) seems to make more sense for front-end development.[^yarn] [Cody Lindley has a nice introduction to npm and Bower](http://codylindley.com/techpro/2013_04_12__package-managers-an-introducto/). Bower is [well documented](https://bower.io) and easy to start using. There is a nice [Flask extension](https://pypi.python.org/pypi/Flask-Bower/) to help you integrate Bower with your Python project.

##### Task Automation

Web development comes with lots of build-style tasks that have to happen repeatedly. For example, before you can render a webpage in the browser, you might need to convert the Less to CSS and start a local web server. Before deploying to production, you might want to also run tests and minify your Javascript.

There's a GUI application called [Codekit](https://codekitapp.com/) that can do a lot of these tasks. You can also do it through a Node.js program called [Grunt](https://gruntjs.com/). I haven't used it yet, but it looks like following the documentation would be the best way to get started.

[Gulp](http://gulpjs.com/) is a popular alternative to Grunt.

#### Design

##### Visual Design

Design has never been my strong point. One way to compensate for that is to rely on the work of others. There are copious [Bootstrap themes available](https://www.google.com/search?q=bootstrap+theme), and some are even [free](https://bootswatch.com/).

I enjoyed [Software Engineering Daily's interview with Tracy Osborn on Design for Non-designers](https://softwareengineeringdaily.com/2016/02/18/design-non-designers-tracy-osborn/). She has some [blog posts](https://medium.com/@limedaring/design-for-non-designers-part-1-6559ed93ff91) on the topic. Tracy recommends [COLOURLovers](http://www.colourlovers.com/
) for color ideas and [Font Pair](http://fontpair.co/) for selecting fonts from [Google Fonts](https://fonts.google.com/about).

##### User Experience Design

On the topic of UX, I finally read Steve Krug's classic [Don't Make Me Think](http://amzn.to/2opg3ZG) ([Safari](https://www.safaribooksonline.com/library/view/dont-make-me/0321344758/)); it's great. Ginny Redish's [Letting Go of Words](http://amzn.to/2oDl0NY) ([Safari](https://www.safaribooksonline.com/library/view/letting-go-of/9780123859303/)) is similarly excellent.

<a href="https://www.amazon.com/Dont-Make-Think-Revisited-Usability/dp/0321965515/ref=as_li_ss_il?ie=UTF8&qid=1490967104&sr=8-1&keywords=don't+make+me+think&linkCode=li2&tag=dothopper-20&linkId=e1d12e035c29f2144ffa34f1b3d24307" target="_blank"><img border="0" class="pull-right" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=0321965515&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=dothopper-20" ></a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=dothopper-20&l=li2&o=1&a=0321965515" width="1" height="1" border="0" alt="" class="pull-right" style="border:none !important; margin:0px !important;" /> <a href="https://www.amazon.com/Letting-Words-Second-Interactive-Technologies/dp/0123859301/ref=as_li_ss_il?ie=UTF8&qid=1490967157&sr=8-1&keywords=letting+go+of+words&linkCode=li2&tag=dothopper-20&linkId=4d39c396b95150b934f8f9e77943b066" target="_blank"><img border="0" class="pull-right" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=0123859301&Format=_SL160_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=dothopper-20" ></a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=dothopper-20&l=li2&o=1&a=0123859301" width="1" height="1" border="0" alt="" class="pull-right" style="border:none !important; margin:0px !important;" />

### Conclusion

I've learned a lot in the past few months. I've filled in some gaps about how CSS works. I've gotten a better grasp on the Javascript prototype model. I've learned that I can start with higher level tools (e.g. Bootstrap and JQuery) to rapidly build my side projects with some amount of visual appeal. I'm learning how to use available tools to reduce the boilerplate I have to write, automate tedious tasks, and reduce my personal technical debt.

I still have a lot of learning and a lot of practicing ahead of me, but I'm starting to feel confident that I could make headway on some of my projects. The modern [frontend development landscape](https://medium.com/@withinsight1/the-front-end-spectrum-c0f30998c9f0) is massive, varied, and ever changing, but that shouldn't prohibit you from diving in if you want to.

[^yarn]: The recent buzz in package management has been about [Yarn](https://yarnpkg.com/en/), a replacement for npm.
