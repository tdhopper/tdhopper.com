---
title: TeXing with Textmate Changed my Life
date: 2012-01-20
Author: Tim
slug: texing-with-textmate-change-my-life
aliases: [/blog/2012/Jan/20/texing-with-textmate-change-my-life/]
category: Article
---

I spend a lot of time writing in $\LaTeX$. Two years ago, I started typesetting of my homework assignments in it. Though I originally would do the problems on paper then type them, I now do a lot of my thinking right into $\LaTeX$ code. During my spring break in the Spring 2010 semester, I discovered [Textmate](http://macromates.com/). This rocked my $\TeX$ing world. Textmate allows live syncing with the open source PDF-viewer Skim: I can "watch" a $\LaTeX$ document so that every time I save it, the document quickly recompiles and Skim updates. The typesetting isn't entirely real-time, but a quick ⌘-S will give me an updated view of the final product. This has a side benefit. If you save a watched document that has errors it in, it won't compile and you get an annoying error message. This inspires the writing of cleaner code. I generally work with Textmate and Skim open side-by-side[^1dtextmate].

[![](/uploads/2012/01/Screen-Shot-2012-01-20-at-9.05.52-AM-1024x640.png)](/uploads/2012/01/Screen-Shot-2012-01-20-at-9.05.52-AM.png)

Another way which Textmate improved my $\LaTeX$ writing experience is its powerful keyboard shortcuts and customizable macros. For example, highlighting text and pressing Command-Control-Shift-W wraps the text in a \begin{}\end{} environment. Even better, the cursor goes straight to the {} after begin, **and** whatever you type there is automatically copied to the end. Tab completion is a beautiful feature for writing $\LaTeX$ quickly. Since starting grad school in operations research, I find myself typesetting a number of mathematical programming models. When I was taking linear programming, I wrote a snippet (macro) to do a lot of the work for me. In Textmate, I type "lp" and then press tab. Immediately inserted into my document is

[![](/uploads/2012/01/Screen-Shot-2012-01-20-at-9.25.37-AM.png)](/uploads/2012/01/Screen-Shot-2012-01-20-at-9.25.37-AM.png)

The cursor is placed after "\qquad &" on the first row where I type my objective function. When I press tab, the cursor jumps to the space after the "&" on the third row where I type my first constraint. After finishing my contraints, ⌘-S cauess Skim to refresh with a nicely typeset linear program:

[![](/uploads/2012/01/Screen-Shot-2012-01-20-at-9.29.58-AM.png)](/uploads/2012/01/Screen-Shot-2012-01-20-at-9.29.58-AM.png)

Textmate also includes basic editor features like auto completion of parenthesis and brackets. I suspect this has saved me hours in debugging time. (Incomplete brackets were my bane when writing $\LaTeX$ without Textmate.) But Textmate's modular setup also provides special completion for Textmate-specific things. For example, anyone who has typed more than a few pages of $\LaTeX$ has probably type "x_12" to get $x_12$ when you wanted to type "x_{12}" to get $x_{12}$. Textmate handles that for me: typing an underscore in math mode automagically adds the brackets and puts the cursor between them.

At this point, I'm fairly certain I can type math into Textmate faster than I can write it by hand. I honestly can't imagine using anything else. I have more to say about my $\LaTeX$, but that homework document isn't finishing itself . In a future post, I'll discuss how I format, organize, and complete homework assignments. For more information on setting up Textmate with $\LaTeX$ and Skim see [this site](http://www.astrobetter.com/how-and-why-to-use-textmate-for-latex/).

[^1dtextmate]: A task completed by [SizeUp](http://www.irradiatedsoftware.com/sizeup/index.html)
