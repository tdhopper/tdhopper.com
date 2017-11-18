---
title: Speeding up Grading!
category: Tutorial
date: 2012-02-04
Author: Tim
slug: speeding-up-grading
aliases: [/blog/2012/Feb/04/speeding-up-grading/]
---

When I grade tests, I write the total score for each page at the bottom of each corner. After I have graded all the tests, I go back and add the pages to get a final score. I hate doing this, and I try to get through it as quickly as possible. However, if there are a bunch of pages (especially if the test is done in a blue book with one problem per page), speed easily leads to mistakes. Since I don't want to short my students any points, I created a small script in Mathematica:

[![](/uploads/2012/02/Screen-Shot-2012-02-04-at-11.49.23-AM.png)](/uploads/2012/02/Screen-Shot-2012-02-04-at-11.49.23-AM.png)

When I run the function "g," it pops up a dialog box where I enter the scores for each page separated by plus signs. Using a plus sign allows me to quickly type the scores on my numeric keypad, though this script could be modified for any other separating symbol. Once I enter the scores and press "Enter," Mathematica checks to see if I entered the right number of scores (i.e. one per page, as determined by the numScores parameter). If I did, it prints the score and reads it to me. If I didn't, it prints all the scores and tells me that I made a mistake. Perhaps this is easier to see rather than read:

<span class='embed-youtube' style='text-align:center; display: block;'><iframe class='youtube-player' type='text/html' width='540' height='334' src='http://www.youtube.com/embed/XP4pzYIPyIY?version=3&#038;rel=1&#038;fs=1&#038;showsearch=0&#038;showinfo=1&#038;iv_load_policy=1&#038;wmode=transparent' frameborder='0'></iframe></span>

I've found this very helpful in speeding up the adding process. Feel free to use [the code](http://pastebin.com/N1F460sB) if you'd like.
