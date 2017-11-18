---
title: Animating Plots in Mathematica
category: Article
date: 2012-04-11
Author: Tim
slug: animating-plots-in-mathematica
aliases: [/blog/2012/Apr/11/animating-plots-in-mathematica/]
---

A friend asked me how to animate a polar plot graphing in Mathematica. It's really easy. The [Animate](http://reference.wolfram.com/mathematica/ref/Animate.html) and [Manipulate](http://reference.wolfram.com/mathematica/ref/Manipulate.html) commands added in version 6 are a huge step in interactive mathematical visualizations. The easiest way to visualize it is to have the upper plot range vary from a 0+ϵ to 2π.

<pre><code>Animate[
  PolarPlot[2 Cos[4 x], {x, 0, y},
    PlotRange -> {{-2, 2}, {-2, 2}}],
  {y, 0.001, 2}
]</code></pre>

But, I thought this would be a good opportunity to try out Wolfram's recently introduced Computable Document Format which makes Mathematica files interactive in the web browser. Instead of having to buy an expensive Mathematica license to play with interactive Mathematica tools, CDFs are accessible right from the browser. If you haven't already, you'll have to install the [CDF Player](http://www.wolfram.com/cdf-player/?src=google&136-2+phrase-wolfram%20CDF&gclid=CPaRsu6era8CFUhl7AodeGGPqg) (free from Wolfram) to view my animation[^1]. Try clicking the different functions to see their polar plots drawn.


<script type="text/javascript" src="http://www.wolfram.com/cdf-player/plugin/v2.1/cdfplugin.js"></script>
<script type="text/javascript">
	var cdf = new cdfplugin();
	cdf.embed('http://www4.ncsu.edu/~tdhopper/stiglerdiet/PolarPlot.cdf', "500", "500");
</script>

Here's code which you should be able to copy and paste right into Mathematica.

<pre><code>
Manipulate[
  PolarPlot[f[\\[Theta]], {\\[Theta], 0, \\[Mu]},
    PlotRange -> {{-2, 2}, {-2, 2}}
  ],
    {{f, 2 Cos[4 #] &, "Function"},
    {
      Sin -> "r=Sin[\\[Theta]]",
      2 Cos[4 #] & -> "r=2 Cos[4\\[Theta]]",
      2 Cos[16 #] & -> "r=2 Cos[16\\[Theta]]"
    }, ControlType -> SetterBar},
  {\\[Mu], 0.001, 2 \\[Pi]},
  ControlType -> Animator,
  AppearanceElements -> None
]
</code></pre>

[^1]: Wolfram has recently made their massive collection of [Demonstrations](http://demonstrations.wolfram.com/) interactive through the CDF format. This is a great feature for math teacher and students.
