---
title: A Markdown Syllabus
category: Article
date: 2012-05-09
Author: Tim
slug: a-markdown-syllabus
aliases: [/blog/2012/May/09/a-markdown-syllabus/]
---

Instead of maintaining my syllabus in HTML this semester, I decided to try Markdown, a "a text-to-HTML conversion tool for web writers."[^1markdown] Markdown provides simple, readable formatting syntax for plain text files which can then be converted to various other formats, in particular, HTML. Markdown allowed me to keep my syllabus clean and readable while also having various formatting (italics, bold, links, etc). [Take a look for yourself](http://www4.ncsu.edu/~tdhopper/stiglerdiet/MultimarkdownSyllabus.txt). I actually used an extension called [Multimarkdown](http://fletcherpenney.net/multimarkdown/) which permits, among other things, tables. With a few keystrokes in [Textmate](http://macromates.com/), I can convert the Markdown file to an HTML file ready to be uploaded [to the web](http://www4.ncsu.edu/~tdhopper/stiglerdiet/MultimarkdownSyllabus.html). Notice the fourth line in the Markdown file says _style: style.css_. That tells the Markdown interpreter to add a line of HTML that calls the stylesheet _style.css. _You can see [my simple CSS file here](http://www4.ncsu.edu/~tdhopper/stiglerdiet/style.css). With Multimarkdown, you can also convert Markdown formatted files to PDF and LaTeX. If you're going to use tables in Multimarkdown, check out this [Python script](http://www.leancrew.com/all-this/2008/08/tables-for-markdown-and-textmate/) that automagically reformats the table to fit the contents. That's how I got my table looking so pretty with a few keystokes in Textmate.

    |:-----|:------|:----------------------------|:---------------------|
    | Week | Class | Lecture Topic               | Book Sections        |
    | 1    | 1     | Substitution Rule           | 5.5, 5.6             |
    | -    | 2     | Partial Fractions           | 5.7, 5.8, Appendix G |
    | 2    | 1     | Approximate Integration     | 5.9                  |
    | -    | 2     | Improper Integrals          | 5.10                 |
    | 3    | 1     | Areas, Volumes              | 6.1, 6.2             |
    | -    | 2     | Volumes                     | 6.2, 6.3, 6.4        |
    | 4    | 1     | Average Value of a Function | 6.5, Page 429-430    |
    | -    | 2     | **Test 1**                  | 6.6                  |

I won't be teaching again for a while, so it's hard to say if I'd use Markdown again. If I do, I need to figure out how to streamline my upload process. I'd like to be able to save, convert to HTML, and upload with a single command. Laura McLay just [posted about using Google Docs in teaching](http://punkrockor.wordpress.com/2012/05/04/google-docs-are-a-great-teaching-tool/). A Google Doc shared with the whole class might be an even easier way to maintain a syllabus.

[^1markdown]: http://daringfireball.net/projects/markdown/
