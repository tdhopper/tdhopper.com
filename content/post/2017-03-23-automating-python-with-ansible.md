---
title: Automating Python with Ansible
ategory: Tutorials
slug: automating-python-with-ansible
aliases: [/blog/2017/Mar/23/2017-03-23-automating-python-with-ansible/]
date: 2017-03-23
Thumbnail: /uploads/cafe.jpg
summary: An interactive tutorial teaching you how to use Ansible to deploy a long running Python process to a remote machine.
description: An interactive tutorial teaching you how to use Ansible to deploy a long running Python process to a remote machine.
featured: True
markup: html
---


                        <style type="text/css">/*!
*
* IPython notebook
*
*/
/* CSS font colors for translated ANSI colors. */
.ansibold {
  font-weight: bold;
}
/* use dark versions for foreground, to improve visibility */
.ansiblack {
  color: black;
}
.ansired {
  color: darkred;
}
.ansigreen {
  color: darkgreen;
}
.ansiyellow {
  color: #c4a000;
}
.ansiblue {
  color: darkblue;
}
.ansipurple {
  color: darkviolet;
}
.ansicyan {
  color: steelblue;
}
.ansigray {
  color: gray;
}
/* and light for background, for the same reason */
.ansibgblack {
  background-color: black;
}
.ansibgred {
  background-color: red;
}
.ansibggreen {
  background-color: green;
}
.ansibgyellow {
  background-color: yellow;
}
.ansibgblue {
  background-color: blue;
}
.ansibgpurple {
  background-color: magenta;
}
.ansibgcyan {
  background-color: cyan;
}
.ansibggray {
  background-color: gray;
}
div.cell {
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: vertical;
  -moz-box-align: stretch;
  display: box;
  box-orient: vertical;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: column;
  align-items: stretch;
  border-radius: 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  border-width: 1px;
  border-style: solid;
  border-color: transparent;
  width: 100%;
  padding: 5px;
  /* This acts as a spacer between cells, that is outside the border */
  margin: 0px;
  outline: none;
  border-left-width: 1px;
  padding-left: 5px;
  background: linear-gradient(to right, transparent -40px, transparent 1px, transparent 1px, transparent 100%);
}
div.cell.jupyter-soft-selected {
  border-left-color: #90CAF9;
  border-left-color: #E3F2FD;
  border-left-width: 1px;
  padding-left: 5px;
  border-right-color: #E3F2FD;
  border-right-width: 1px;
  background: #E3F2FD;
}
@media print {
  div.cell.jupyter-soft-selected {
    border-color: transparent;
  }
}
div.cell.selected {
  border-color: #ababab;
  border-left-width: 0px;
  padding-left: 6px;
  background: linear-gradient(to right, #42A5F5 -40px, #42A5F5 5px, transparent 5px, transparent 100%);
}
@media print {
  div.cell.selected {
    border-color: transparent;
  }
}
div.cell.selected.jupyter-soft-selected {
  border-left-width: 0;
  padding-left: 6px;
  background: linear-gradient(to right, #42A5F5 -40px, #42A5F5 7px, #E3F2FD 7px, #E3F2FD 100%);
}
.edit_mode div.cell.selected {
  border-color: #66BB6A;
  border-left-width: 0px;
  padding-left: 6px;
  background: linear-gradient(to right, #66BB6A -40px, #66BB6A 5px, transparent 5px, transparent 100%);
}
@media print {
  .edit_mode div.cell.selected {
    border-color: transparent;
  }
}
.prompt {
  /* This needs to be wide enough for 3 digit prompt numbers: In[100]: */
  min-width: 14ex;
  /* This padding is tuned to match the padding on the CodeMirror editor. */
  padding: 0.4em;
  margin: 0px;
  font-family: monospace;
  text-align: right;
  /* This has to match that of the the CodeMirror class line-height below */
  line-height: 1.21429em;
  /* Don't highlight prompt number selection */
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  /* Use default cursor */
  cursor: default;
}
@media (max-width: 540px) {
  .prompt {
    text-align: left;
  }
}
div.inner_cell {
  min-width: 0;
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: vertical;
  -moz-box-align: stretch;
  display: box;
  box-orient: vertical;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: column;
  align-items: stretch;
  /* Old browsers */
  -webkit-box-flex: 1;
  -moz-box-flex: 1;
  box-flex: 1;
  /* Modern browsers */
  flex: 1;
}
/* input_area and input_prompt must match in top border and margin for alignment */
div.input_area {
  border: 1px solid #cfcfcf;
  border-radius: 2px;
  background: #f7f7f7;
  line-height: 1.21429em;
}
/* This is needed so that empty prompt areas can collapse to zero height when there
   is no content in the output_subarea and the prompt. The main purpose of this is
   to make sure that empty JavaScript output_subareas have no height. */
div.prompt:empty {
  padding-top: 0;
  padding-bottom: 0;
}
div.unrecognized_cell {
  padding: 5px 5px 5px 0px;
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: horizontal;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: horizontal;
  -moz-box-align: stretch;
  display: box;
  box-orient: horizontal;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: row;
  align-items: stretch;
}
div.unrecognized_cell .inner_cell {
  border-radius: 2px;
  padding: 5px;
  font-weight: bold;
  color: red;
  border: 1px solid #cfcfcf;
  background: #eaeaea;
}
div.unrecognized_cell .inner_cell a {
  color: inherit;
  text-decoration: none;
}
div.unrecognized_cell .inner_cell a:hover {
  color: inherit;
  text-decoration: none;
}
@media (max-width: 540px) {
  div.unrecognized_cell > div.prompt {
    display: none;
  }
}
div.code_cell {
  /* avoid page breaking on code cells when printing */
}
@media print {
  div.code_cell {
    page-break-inside: avoid;
  }
}
/* any special styling for code cells that are currently running goes here */
div.input {
  page-break-inside: avoid;
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: horizontal;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: horizontal;
  -moz-box-align: stretch;
  display: box;
  box-orient: horizontal;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: row;
  align-items: stretch;
}
@media (max-width: 540px) {
  div.input {
    /* Old browsers */
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-box-align: stretch;
    display: -moz-box;
    -moz-box-orient: vertical;
    -moz-box-align: stretch;
    display: box;
    box-orient: vertical;
    box-align: stretch;
    /* Modern browsers */
    display: flex;
    flex-direction: column;
    align-items: stretch;
  }
}
/* input_area and input_prompt must match in top border and margin for alignment */
div.input_prompt {
  color: #303F9F;
  border-top: 1px solid transparent;
}
div.input_area > div.highlight {
  margin: 0.4em;
  border: none;
  padding: 0px;
  background-color: transparent;
}
div.input_area > div.highlight > pre {
  margin: 0px;
  border: none;
  padding: 0px;
  background-color: transparent;
}
/* The following gets added to the <head> if it is detected that the user has a
 * monospace font with inconsistent normal/bold/italic height.  See
 * notebookmain.js.  Such fonts will have keywords vertically offset with
 * respect to the rest of the text.  The user should select a better font.
 * See: https://github.com/ipython/ipython/issues/1503
 *
 * .CodeMirror span {
 *      vertical-align: bottom;
 * }
 */
.CodeMirror {
  line-height: 1.21429em;
  /* Changed from 1em to our global default */
  font-size: 14px;
  height: auto;
  /* Changed to auto to autogrow */
  background: none;
  /* Changed from white to allow our bg to show through */
}
.CodeMirror-scroll {
  /*  The CodeMirror docs are a bit fuzzy on if overflow-y should be hidden or visible.*/
  /*  We have found that if it is visible, vertical scrollbars appear with font size changes.*/
  overflow-y: hidden;
  overflow-x: auto;
}
.CodeMirror-lines {
  /* In CM2, this used to be 0.4em, but in CM3 it went to 4px. We need the em value because */
  /* we have set a different line-height and want this to scale with that. */
  padding: 0.4em;
}
.CodeMirror-linenumber {
  padding: 0 8px 0 4px;
}
.CodeMirror-gutters {
  border-bottom-left-radius: 2px;
  border-top-left-radius: 2px;
}
.CodeMirror pre {
  /* In CM3 this went to 4px from 0 in CM2. We need the 0 value because of how we size */
  /* .CodeMirror-lines */
  padding: 0;
  border: 0;
  border-radius: 0;
}
/*

Original style from softwaremaniacs.org (c) Ivan Sagalaev <Maniac@SoftwareManiacs.Org>
Adapted from GitHub theme

*/
.highlight-base {
  color: #000;
}
.highlight-variable {
  color: #000;
}
.highlight-variable-2 {
  color: #1a1a1a;
}
.highlight-variable-3 {
  color: #333333;
}
.highlight-string {
  color: #BA2121;
}
.highlight-comment {
  color: #408080;
  font-style: italic;
}
.highlight-number {
  color: #080;
}
.highlight-atom {
  color: #88F;
}
.highlight-keyword {
  color: #008000;
  font-weight: bold;
}
.highlight-builtin {
  color: #008000;
}
.highlight-error {
  color: #f00;
}
.highlight-operator {
  color: #AA22FF;
  font-weight: bold;
}
.highlight-meta {
  color: #AA22FF;
}
/* previously not defined, copying from default codemirror */
.highlight-def {
  color: #00f;
}
.highlight-string-2 {
  color: #f50;
}
.highlight-qualifier {
  color: #555;
}
.highlight-bracket {
  color: #997;
}
.highlight-tag {
  color: #170;
}
.highlight-attribute {
  color: #00c;
}
.highlight-header {
  color: blue;
}
.highlight-quote {
  color: #090;
}
.highlight-link {
  color: #00c;
}
/* apply the same style to codemirror */
.cm-s-ipython span.cm-keyword {
  color: #008000;
  font-weight: bold;
}
.cm-s-ipython span.cm-atom {
  color: #88F;
}
.cm-s-ipython span.cm-number {
  color: #080;
}
.cm-s-ipython span.cm-def {
  color: #00f;
}
.cm-s-ipython span.cm-variable {
  color: #000;
}
.cm-s-ipython span.cm-operator {
  color: #AA22FF;
  font-weight: bold;
}
.cm-s-ipython span.cm-variable-2 {
  color: #1a1a1a;
}
.cm-s-ipython span.cm-variable-3 {
  color: #333333;
}
.cm-s-ipython span.cm-comment {
  color: #408080;
  font-style: italic;
}
.cm-s-ipython span.cm-string {
  color: #BA2121;
}
.cm-s-ipython span.cm-string-2 {
  color: #f50;
}
.cm-s-ipython span.cm-meta {
  color: #AA22FF;
}
.cm-s-ipython span.cm-qualifier {
  color: #555;
}
.cm-s-ipython span.cm-builtin {
  color: #008000;
}
.cm-s-ipython span.cm-bracket {
  color: #997;
}
.cm-s-ipython span.cm-tag {
  color: #170;
}
.cm-s-ipython span.cm-attribute {
  color: #00c;
}
.cm-s-ipython span.cm-header {
  color: blue;
}
.cm-s-ipython span.cm-quote {
  color: #090;
}
.cm-s-ipython span.cm-link {
  color: #00c;
}
.cm-s-ipython span.cm-error {
  color: #f00;
}
.cm-s-ipython span.cm-tab {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAMCAYAAAAkuj5RAAAAAXNSR0IArs4c6QAAAGFJREFUSMft1LsRQFAQheHPowAKoACx3IgEKtaEHujDjORSgWTH/ZOdnZOcM/sgk/kFFWY0qV8foQwS4MKBCS3qR6ixBJvElOobYAtivseIE120FaowJPN75GMu8j/LfMwNjh4HUpwg4LUAAAAASUVORK5CYII=);
  background-position: right;
  background-repeat: no-repeat;
}
div.output_wrapper {
  /* this position must be relative to enable descendents to be absolute within it */
  position: relative;
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: vertical;
  -moz-box-align: stretch;
  display: box;
  box-orient: vertical;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: column;
  align-items: stretch;
  z-index: 1;
}
/* class for the output area when it should be height-limited */
div.output_scroll {
  /* ideally, this would be max-height, but FF barfs all over that */
  height: 24em;
  /* FF needs this *and the wrapper* to specify full width, or it will shrinkwrap */
  width: 100%;
  overflow: auto;
  border-radius: 2px;
  -webkit-box-shadow: inset 0 2px 8px rgba(0, 0, 0, 0.8);
  box-shadow: inset 0 2px 8px rgba(0, 0, 0, 0.8);
  display: block;
}
/* output div while it is collapsed */
div.output_collapsed {
  margin: 0px;
  padding: 0px;
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: vertical;
  -moz-box-align: stretch;
  display: box;
  box-orient: vertical;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: column;
  align-items: stretch;
}
div.out_prompt_overlay {
  height: 100%;
  padding: 0px 0.4em;
  position: absolute;
  border-radius: 2px;
}
div.out_prompt_overlay:hover {
  /* use inner shadow to get border that is computed the same on WebKit/FF */
  -webkit-box-shadow: inset 0 0 1px #000;
  box-shadow: inset 0 0 1px #000;
  background: rgba(240, 240, 240, 0.5);
}
div.output_prompt {
  color: #D84315;
}
/* This class is the outer container of all output sections. */
div.output_area {
  padding: 0px;
  page-break-inside: avoid;
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: horizontal;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: horizontal;
  -moz-box-align: stretch;
  display: box;
  box-orient: horizontal;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: row;
  align-items: stretch;
}
div.output_area .MathJax_Display {
  text-align: left !important;
}
div.output_area
div.output_area
div.output_area img,
div.output_area svg {
  max-width: 100%;
  height: auto;
}
div.output_area img.unconfined,
div.output_area svg.unconfined {
  max-width: none;
}
/* This is needed to protect the pre formating from global settings such
   as that of bootstrap */
.output {
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: vertical;
  -moz-box-align: stretch;
  display: box;
  box-orient: vertical;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: column;
  align-items: stretch;
}
@media (max-width: 540px) {
  div.output_area {
    /* Old browsers */
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-box-align: stretch;
    display: -moz-box;
    -moz-box-orient: vertical;
    -moz-box-align: stretch;
    display: box;
    box-orient: vertical;
    box-align: stretch;
    /* Modern browsers */
    display: flex;
    flex-direction: column;
    align-items: stretch;
  }
}
div.output_area pre {
  margin: 0;
  padding: 0;
  border: 0;
  vertical-align: baseline;
  color: black;
  background-color: transparent;
  border-radius: 0;
}
/* This class is for the output subarea inside the output_area and after
   the prompt div. */
div.output_subarea {
  overflow-x: auto;
  padding: 0.4em;
  /* Old browsers */
  -webkit-box-flex: 1;
  -moz-box-flex: 1;
  box-flex: 1;
  /* Modern browsers */
  flex: 1;
}
div.output_scroll div.output_subarea {
  overflow-x: visible;
}
/* The rest of the output_* classes are for special styling of the different
   output types */
/* all text output has this class: */
div.output_text {
  text-align: left;
  color: #000;
  /* This has to match that of the the CodeMirror class line-height below */
  line-height: 1.21429em;
}
/* stdout/stderr are 'text' as well as 'stream', but execute_result/error are *not* streams */
div.output_stderr {
  background: #fdd;
  /* very light red background for stderr */
}
div.output_latex {
  text-align: left;
}
/* Empty output_javascript divs should have no height */
div.output_javascript:empty {
  padding: 0;
}
.js-error {
  color: darkred;
}
/* raw_input styles */
div.raw_input_container {
  line-height: 1.21429em;
  padding-top: 5px;
}
pre.raw_input_prompt {
  /* nothing needed here. */
}
input.raw_input {
  font-family: monospace;
  font-size: inherit;
  color: inherit;
  width: auto;
  /* make sure input baseline aligns with prompt */
  vertical-align: baseline;
  /* padding + margin = 0.5em between prompt and cursor */
  padding: 0em 0.25em;
  margin: 0em 0.25em;
}
input.raw_input:focus {
  box-shadow: none;
}
p.p-space {
  margin-bottom: 10px;
}
div.output_unrecognized {
  padding: 5px;
  font-weight: bold;
  color: red;
}
div.output_unrecognized a {
  color: inherit;
  text-decoration: none;
}
div.output_unrecognized a:hover {
  color: inherit;
  text-decoration: none;
}
.rendered_html {
  color: #000;
  /* any extras will just be numbers: */
}



.rendered_html :link {
  text-decoration: underline;
}
.rendered_html :visited {
  text-decoration: underline;
}






.rendered_html h1:first-child {
  margin-top: 0.538em;
}
.rendered_html h2:first-child {
  margin-top: 0.636em;
}
.rendered_html h3:first-child {
  margin-top: 0.777em;
}
.rendered_html h4:first-child {
  margin-top: 1em;
}
.rendered_html h5:first-child {
  margin-top: 1em;
}
.rendered_html h6:first-child {
  margin-top: 1em;
}








.rendered_html * + ul {
  margin-top: 1em;
}
.rendered_html * + ol {
  margin-top: 1em;
}


.rendered_html pre,



.rendered_html tr,
.rendered_html th,

.rendered_html td,


.rendered_html * + table {
  margin-top: 1em;
}

.rendered_html * + p {
  margin-top: 1em;
}

.rendered_html * + img {
  margin-top: 1em;
}
.rendered_html img,

.rendered_html img.unconfined,

div.text_cell {
  /* Old browsers */
  display: -webkit-box;
  -webkit-box-orient: horizontal;
  -webkit-box-align: stretch;
  display: -moz-box;
  -moz-box-orient: horizontal;
  -moz-box-align: stretch;
  display: box;
  box-orient: horizontal;
  box-align: stretch;
  /* Modern browsers */
  display: flex;
  flex-direction: row;
  align-items: stretch;
}
@media (max-width: 540px) {
  div.text_cell > div.prompt {
    display: none;
  }
}
div.text_cell_render {
  /*font-family: "Helvetica Neue", Arial, Helvetica, Geneva, sans-serif;*/
  outline: none;
  resize: none;
  width: inherit;
  border-style: none;
  padding: 0.5em 0.5em 0.5em 0.4em;
  color: #000;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
}
a.anchor-link:link {
  text-decoration: none;
  padding: 0px 20px;
  visibility: hidden;
}
h1:hover .anchor-link,
h2:hover .anchor-link,
h3:hover .anchor-link,
h4:hover .anchor-link,
h5:hover .anchor-link,
h6:hover .anchor-link {
  visibility: visible;
}
.text_cell.rendered .input_area {
  display: none;
}
.text_cell.rendered
.text_cell.unrendered .text_cell_render {
  display: none;
}
.cm-header-1,
.cm-header-2,
.cm-header-3,
.cm-header-4,
.cm-header-5,
.cm-header-6 {
  font-weight: bold;
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
.cm-header-1 {
  font-size: 185.7%;
}
.cm-header-2 {
  font-size: 157.1%;
}
.cm-header-3 {
  font-size: 128.6%;
}
.cm-header-4 {
  font-size: 110%;
}
.cm-header-5 {
  font-size: 100%;
  font-style: italic;
}
.cm-header-6 {
  font-size: 100%;
  font-style: italic;
}
</style>
<style type="text/css">.highlight .hll { background-color: #ffffcc }
.highlight  { background: #f8f8f8; }
.highlight .c { color: #408080; font-style: italic } /* Comment */
.highlight .err { border: 1px solid #FF0000 } /* Error */
.highlight .k { color: #008000; font-weight: bold } /* Keyword */
.highlight .o { color: #666666 } /* Operator */
.highlight .ch { color: #408080; font-style: italic } /* Comment.Hashbang */
.highlight .cm { color: #408080; font-style: italic } /* Comment.Multiline */
.highlight .cp { color: #BC7A00 } /* Comment.Preproc */
.highlight .cpf { color: #408080; font-style: italic } /* Comment.PreprocFile */
.highlight .c1 { color: #408080; font-style: italic } /* Comment.Single */
.highlight .cs { color: #408080; font-style: italic } /* Comment.Special */
.highlight .gd { color: #A00000 } /* Generic.Deleted */
.highlight .ge { font-style: italic } /* Generic.Emph */
.highlight .gr { color: #FF0000 } /* Generic.Error */
.highlight .gh { color: #000080; font-weight: bold } /* Generic.Heading */
.highlight .gi { color: #00A000 } /* Generic.Inserted */
.highlight .go { color: #888888 } /* Generic.Output */
.highlight .gp { color: #000080; font-weight: bold } /* Generic.Prompt */
.highlight .gs { font-weight: bold } /* Generic.Strong */
.highlight .gu { color: #800080; font-weight: bold } /* Generic.Subheading */
.highlight .gt { color: #0044DD } /* Generic.Traceback */
.highlight .kc { color: #008000; font-weight: bold } /* Keyword.Constant */
.highlight .kd { color: #008000; font-weight: bold } /* Keyword.Declaration */
.highlight .kn { color: #008000; font-weight: bold } /* Keyword.Namespace */
.highlight .kp { color: #008000 } /* Keyword.Pseudo */
.highlight .kr { color: #008000; font-weight: bold } /* Keyword.Reserved */
.highlight .kt { color: #B00040 } /* Keyword.Type */
.highlight .m { color: #666666 } /* Literal.Number */
.highlight .s { color: #BA2121 } /* Literal.String */
.highlight .na { color: #7D9029 } /* Name.Attribute */
.highlight .nb { color: #008000 } /* Name.Builtin */
.highlight .nc { color: #0000FF; font-weight: bold } /* Name.Class */
.highlight .no { color: #880000 } /* Name.Constant */
.highlight .nd { color: #AA22FF } /* Name.Decorator */
.highlight .ni { color: #999999; font-weight: bold } /* Name.Entity */
.highlight .ne { color: #D2413A; font-weight: bold } /* Name.Exception */
.highlight .nf { color: #0000FF } /* Name.Function */
.highlight .nl { color: #A0A000 } /* Name.Label */
.highlight .nn { color: #0000FF; font-weight: bold } /* Name.Namespace */
.highlight .nt { color: #008000; font-weight: bold } /* Name.Tag */
.highlight .nv { color: #19177C } /* Name.Variable */
.highlight .ow { color: #AA22FF; font-weight: bold } /* Operator.Word */
.highlight .w { color: #bbbbbb } /* Text.Whitespace */
.highlight .mb { color: #666666 } /* Literal.Number.Bin */
.highlight .mf { color: #666666 } /* Literal.Number.Float */
.highlight .mh { color: #666666 } /* Literal.Number.Hex */
.highlight .mi { color: #666666 } /* Literal.Number.Integer */
.highlight .mo { color: #666666 } /* Literal.Number.Oct */
.highlight .sa { color: #BA2121 } /* Literal.String.Affix */
.highlight .sb { color: #BA2121 } /* Literal.String.Backtick */
.highlight .sc { color: #BA2121 } /* Literal.String.Char */
.highlight .dl { color: #BA2121 } /* Literal.String.Delimiter */
.highlight .sd { color: #BA2121; font-style: italic } /* Literal.String.Doc */
.highlight .s2 { color: #BA2121 } /* Literal.String.Double */
.highlight .se { color: #BB6622; font-weight: bold } /* Literal.String.Escape */
.highlight .sh { color: #BA2121 } /* Literal.String.Heredoc */
.highlight .si { color: #BB6688; font-weight: bold } /* Literal.String.Interpol */
.highlight .sx { color: #008000 } /* Literal.String.Other */
.highlight .sr { color: #BB6688 } /* Literal.String.Regex */
.highlight .s1 { color: #BA2121 } /* Literal.String.Single */
.highlight .ss { color: #19177C } /* Literal.String.Symbol */
.highlight .bp { color: #008000 } /* Name.Builtin.Pseudo */
.highlight .fm { color: #0000FF } /* Name.Function.Magic */
.highlight .vc { color: #19177C } /* Name.Variable.Class */
.highlight .vg { color: #19177C } /* Name.Variable.Global */
.highlight .vi { color: #19177C } /* Name.Variable.Instance */
.highlight .vm { color: #19177C } /* Name.Variable.Magic */
.highlight .il { color: #666666 } /* Literal.Number.Integer.Long */</style>
<style type="text/css">
/* Temporary definitions which will become obsolete with Notebook release 5.0 */
.ansi-black-fg { color: #3E424D; }
.ansi-black-bg { background-color: #3E424D; }
.ansi-black-intense-fg { color: #282C36; }
.ansi-black-intense-bg { background-color: #282C36; }
.ansi-red-fg { color: #E75C58; }
.ansi-red-bg { background-color: #E75C58; }
.ansi-red-intense-fg { color: #B22B31; }
.ansi-red-intense-bg { background-color: #B22B31; }
.ansi-green-fg { color: #00A250; }
.ansi-green-bg { background-color: #00A250; }
.ansi-green-intense-fg { color: #007427; }
.ansi-green-intense-bg { background-color: #007427; }
.ansi-yellow-fg { color: #DDB62B; }
.ansi-yellow-bg { background-color: #DDB62B; }
.ansi-yellow-intense-fg { color: #B27D12; }
.ansi-yellow-intense-bg { background-color: #B27D12; }
.ansi-blue-fg { color: #208FFB; }
.ansi-blue-bg { background-color: #208FFB; }
.ansi-blue-intense-fg { color: #0065CA; }
.ansi-blue-intense-bg { background-color: #0065CA; }
.ansi-magenta-fg { color: #D160C4; }
.ansi-magenta-bg { background-color: #D160C4; }
.ansi-magenta-intense-fg { color: #A03196; }
.ansi-magenta-intense-bg { background-color: #A03196; }
.ansi-cyan-fg { color: #60C6C8; }
.ansi-cyan-bg { background-color: #60C6C8; }
.ansi-cyan-intense-fg { color: #258F8F; }
.ansi-cyan-intense-bg { background-color: #258F8F; }
.ansi-white-fg { color: #C5C1B4; }
.ansi-white-bg { background-color: #C5C1B4; }
.ansi-white-intense-fg { color: #A1A6B2; }
.ansi-white-intense-bg { background-color: #A1A6B2; }

.ansi-bold { font-weight: bold; }
</style>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>I wrote <a href="http://tdhopper.com/blog/2016/Nov/15/data-scientists-need-more-automation/">a few months back</a> about how data scientists need more automation. In particular, I suggested that data scientists would be wise to learn more about automated system configuration and automated deployments.</p>
<p>In an attempt to take my own advice, I've finally been making myself learn <a href="https://www.ansible.com/">Ansible</a>. It turns out that a great way to learn it is to sit down and read through the docs, front to back; I commend that tactic to you. I also put together this tutorial to walk through a practical example of how a working data scientist might use this powerful tool.</p>
<p>What follows is an Ansible guide that will take you from installing Ansible to automatically deploying a long-running Python to a remote machine and running it in a <a href="https://conda.io/docs/using/envs.html">Conda environment</a> using <a href="http://supervisord.org/">supervisord</a>. It presumes your development machine is on OS X and the remote machine is Debian-like; however, it shouldn't require too many changes to run it on other systems.</p>
<p>I wrote this post in a Jupyter notebook with a Bash kernel. You can find the notebook, Ansible files, and installation directions on <a href="https://github.com/tdhopper/automating_python">my Github</a>.</p>
<h3 id="Ansible">Ansible<a class="anchor-link" href="#Ansible">¶</a></h3><p>Ansible provides "human readable automation" for "app deployment" and "configuration management". Unlike tools like Chef, it doesn't require an agent to be running on remote machines. In short, it translates declarative YAML files into shell commands and runs them on your machines over SSH.</p>
<p>Ansible is backed by Red Hat and has a great <a href="https://www.ansible.com/">website</a>.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Installing-Ansible-with-Homebrew">Installing Ansible with Homebrew<a class="anchor-link" href="#Installing-Ansible-with-Homebrew">¶</a></h3><p>First, you'll need to <a href="http://docs.ansible.com/ansible/intro_installation.html">install Ansible</a>. On a Mac, I recommend doing this with <a href="https://brew.sh/">Homebrew</a>.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [2]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>brew install ansible
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre><span class="ansi-yellow-fg">Warning</span>: ansible-2.1.0.0 already installed
<span class="ansi-yellow-fg">Warning</span>: You are using OS X 10.12.
We do not provide support for this pre-release version.
You may encounter build failures or other breakages.
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Quickstart">Quickstart<a class="anchor-link" href="#Quickstart">¶</a></h3><p>Soon, I'll show you how to put write an Ansible YAML file. However, Ansible also allows you specify tasks from the command line.</p>
<p>Here's how we could use Ansible ping our local host:</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [3]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ansible -i <span class="s1">'localhost,'</span> -c <span class="nb">local</span> -m ping all
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ansible -i 'localhost,' -c local -m ping all
<span class="ansi-green-fg">localhost | SUCCESS => {
    "changed": false,
    "ping": "pong"
}</span>
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>This command calls ansible and tells it:</p>
<ul>
<li>To use <code>localhost</code> as it's inventory (<code>-i</code>). Inventory is Ansible speak for machine or machines you want to be able to run commands on. </li>
<li>To connect (<code>-c</code>) locally (<code>local</code>) instead of over SSH. </li>
<li>To run the <a href="http://docs.ansible.com/ansible/ping_module.html"><code>ping</code> module</a> (<code>-m</code>) to test the connection.</li>
<li>To run the command on <code>all</code> hosts in the inventory (in this case, our inventory is just the <code>localhost</code>).</li>
</ul>
<p><a href="https://web.archive.org/web/20170330023127/http://www.mechanicalfish.net/start-learning-ansible-with-one-line-and-no-files/">Michael Booth</a> has a <a href="https://web.archive.org/web/20170330023127/http://www.mechanicalfish.net/start-learning-ansible-with-one-line-and-no-files/">post</a> that goes into more detail about this command.</p>
<p>Behind the scenes, Ansible is turning this <code>-m ping</code> command into shell commands. (Try running with the <code>-vvv</code> flag to see what's happening behind the scenes.) It can also execute arbitrary commands; by default, it'll use the Bourne shell <code>sh</code>.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [4]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ansible all -i <span class="s1">'localhost, '</span> -c <span class="nb">local</span> -a <span class="s2">"/bin/echo hello"</span>
</pre></div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Setting-up-an-Ansible-Inventory">Setting up an Ansible Inventory<a class="anchor-link" href="#Setting-up-an-Ansible-Inventory">¶</a></h3><p>Instead of specifying our inventory with the <code>-i</code> flag each time, we should specify an Ansible inventory file. This file is a text file specifying machines you have SSH access to; you can also group machines under bracketed headings. For example:</p>
<pre><code>mail.example.com

[webservers]
foo.example.com
bar.example.com

[dbservers]
one.example.com
two.example.com
three.example.com</code></pre>
<p>Ansible has to be able to connect to these machines over SSH, so you will likely need to have relevant entries in your <a href="http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/"><code>.ssh/config</code> file</a>.</p>
<p>By default, the Ansible CLI will look for a system-wide Ansible inventory file in <code>/etc/ansible/hosts</code>. You can also specify an alternative path for an intentory file with the <code>-i</code> flag.</p>
<p>For this tutorial, I'd like to have an inventory file specific to the project directory without having to specify it each time we call Ansible. We can do this by creating a file called <code>./ansible.cfg</code> and set the name of our local inventory file:</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [5]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>cat ./ansible.cfg
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>cat ./ansible.cfg
[defaults]
inventory = ./hosts</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>You can check that Ansible is picking up your config file by running <code>ansible --version</code>.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [6]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ansible --version
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ansible --version
ansible 2.1.0.0
  config file = /Users/tdhopper/repos/automating_python/ansible.cfg
  configured module search path = Default w/o overrides
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>For this example, I just have one host, a <a href="https://www.digitalocean.com/">Digital Ocean VPS</a>. To run the examples below, you should create a VPS instance on Digital Ocean, <a href="https://amazonlightsail.com">Amazon</a>, or elsewhere; you'll want to configure it for <a href="https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2">passwordless authentication</a>. I have an entry like this in my <code>~/.ssh/hosts</code> file:</p>
<pre><code>Host digitalocean
  HostName 45.55.395.23
  User root
  Port 22
  IdentityFile /Users/tdhopper/.ssh/id_rsa
  ForwardAgent yes</code></pre>
<p>and my intentory file (<code>~/hosts</code>) is just</p>
<pre><code>digitalocean</code></pre>
<p>Before trying ansible, you should ensure that you can connect to this host:</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [7]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ssh digitalocean <span class="nb">echo</span> <span class="m">1</span>
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ssh digitalocean echo 1
1
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>Now I can verify that Ansible can connect to my machine by running the ping command.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [8]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ansible all -m ping
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ansible all -m ping
<span class="ansi-green-fg">digitalocean | SUCCESS => {
    "changed": false,
    "ping": "pong"
}</span>
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>We told Ansible to run this command on <code>all</code> specified hosts in the inventory. It found our inventory by loading the <code>ansible.cfg</code> which specified <code>./hosts</code> as the inventory file.</p>
<p>It's possible that this will fail for you even if you can SSH into the machine. If the error is something like <code>/bin/sh: 1: /usr/bin/python: not found</code>, this is because your VPS doesn't have Python installed on it. You can <a href="http://stackoverflow.com/questions/32429259/ansible-fails-with-bin-sh-1-usr-bin-python-not-found">install it with Ansible</a>, but you may just want to manually run <code>sudo apt-get -y install python</code> on the VPS to get started.</p>
<h3 id="Writing-our-first-Playbook">Writing our first Playbook<a class="anchor-link" href="#Writing-our-first-Playbook">¶</a></h3><p>While adhoc commands will often be useful, the real power of Ansible comes from creating repeatable sets of instructions called <a href="http://docs.ansible.com/ansible/playbooks.html">Playbooks</a>.</p>
<p>A playbook contains a list of "plays". Each play specifies a set of tasks to be run and which hosts to run them on. A "task" is a call to an Ansible module, like the "ping" module we've already seen. Ansible <a href="http://docs.ansible.com/ansible/list_of_all_modules.html">comes packaged with about 1000 modules</a> for all sorts of use cases. You can also extend it with your own <a href="http://docs.ansible.com/ansible/dev_guide/developing_modules.html">modules</a> and <a href="http://docs.ansible.com/ansible/playbooks_roles.html#roles">roles</a>.</p>
<p>Our first playbook will just execute the ping module on all our hosts. It's a playbook with a single play comprised of a single task.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [9]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>cat ping.yml
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>cat ping.yml
---
- hosts: all
  tasks:
  - name: ping all hosts
    ping:</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>We can run our playbook with the <code>ansible-playbook</code> command.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [10]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ansible-playbook ping.yml
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ansible-playbook ping.yml
 ____________
< PLAY [all] >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ______________
< TASK [setup] >
 --------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

<span class="ansi-green-fg">ok: [digitalocean]</span>
 _______________________
< TASK [ping all hosts] >
 -----------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

<span class="ansi-green-fg">ok: [digitalocean]</span>
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

<span class="ansi-green-fg">digitalocean</span>               : <span class="ansi-green-fg">ok</span><span class="ansi-green-fg">=</span><span class="ansi-green-fg">2</span>    changed=0    unreachable=0    failed=0

</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>You might wonder why there are cows on your screen. You can find out <a href="https://michaelheap.com/cowsay-and-ansible/">here</a>. However, the important thing is that our task was executed and returned successfully.</p>
<p>We can override the hosts list for the play with the <code>-i</code> flag to see what the output looks like when Ansible fails to run the play because it can't find the host.</p>
<p>Let's work now on installing the dependencies for our Python project.</p>
<h3 id="Installing-supervisord">Installing supervisord<a class="anchor-link" href="#Installing-supervisord">¶</a></h3><p>"Supervisor is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems." We'll use it to run and monitor our Python process.</p>
<p>On a Debian-like system, we can install it with APT. In the Ansible DSL that's just:</p>
<pre><code>- name: Install supervisord
  sudo: yes
  apt:
    name: supervisor
    state: present
    update_cache: yes</code></pre>
<p>You can read more about the <a href="http://docs.ansible.com/ansible/apt_module.html">apt module here</a>.</p>
<p>Once we have it installed, we can start it with this task:</p>
<pre><code>- name: Start supervisord
  sudo: yes
  service:
    name: "supervisor"
    state: running
    enabled: yes</code></pre>
<p>This uses the <a href="http://docs.ansible.com/ansible/service_module.html">service</a> module.</p>
<p>We could add these these tasks to a playbook file (like ping.yml), but what maybe we will want to share it among multiple playbooks? For this, Ansible has a construct called <a href="http://docs.ansible.com/ansible/playbooks_roles.html">Roles</a>. A role is a collection of "variable values, certain tasks, and certain handlers – or just one or more of these things". (You can learn more about variables and handlers in the Ansible docs.)</p>
<p>Roles are organized as subfolders of a folder called "Roles" in the working directory. The rapid proliferation of folders in Ansible organization can be overwhelming, but a very simple rule is just a file called <code>main.yml</code> nestled several folders deep. In our case, it's in <code>./roles/supervisor/tasks/main.yml</code>.</p>
<p>Check out <a href="http://docs.ansible.com/ansible/playbooks_roles.html#roles">the docs</a> to learn more about role organization.</p>
<p>Here's what our role looks like:</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [11]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>cat ./roles/supervisor/tasks/main.yml
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>cat ./roles/supervisor/tasks/main.yml
---

- name: Install supervisord
  become: true
  apt:
    name: supervisor
    state: present
    update_cache: yes
  tags:
    supervisor
- name: Start supervisord
  become: true
  service:
    name: "supervisor"
    state: running
    enabled: yes
  tags:
    supervisor

</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>Note that I added <code>tags:</code> to the task definitions. <a href="http://docs.ansible.com/ansible/playbooks_tags.html">Tags</a> just allow you to run a portion of a playbook instead of the whole thing with the <code>--tags</code> flag for <code>ansible-playbook</code>.</p>
<p>Now that we have the supervisor install encapsulated in a role, we can write a simple playbook to run the role.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [12]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>cat supervisor.yml
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>cat supervisor.yml
---
- hosts: digitalocean
  roles:
    - role: supervisor
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [13]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ansible-playbook supervisor.yml
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ansible-playbook supervisor.yml
 _____________________
< PLAY [digitalocean] >
 ---------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ______________
< TASK [setup] >
 --------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

<span class="ansi-green-fg">ok: [digitalocean]</span>
 _________________________________________
< TASK [supervisor : Install supervisord] >
 -----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

<span class="ansi-yellow-fg">changed: [digitalocean]</span>
 _______________________________________
< TASK [supervisor : Start supervisord] >
 ---------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

<span class="ansi-yellow-fg">changed: [digitalocean]</span>
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

<span class="ansi-yellow-fg">digitalocean</span>               : <span class="ansi-green-fg">ok</span><span class="ansi-green-fg">=</span><span class="ansi-green-fg">3</span>    <span class="ansi-yellow-fg">changed</span><span class="ansi-yellow-fg">=</span><span class="ansi-yellow-fg">2</span>    unreachable=0    failed=0

</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Installing-Conda-with-Ansible-Galaxy">Installing Conda with Ansible Galaxy<a class="anchor-link" href="#Installing-Conda-with-Ansible-Galaxy">¶</a></h3><p>Next we want to ensure that Conda installed on our system. We could write our own role to follow the <a href="https://www.continuum.io/downloads">recommended process</a>. However, Ansible has a helpful tool to help us avoid reinventing the wheel by allowing users to share roles; this is called <a href="https://galaxy.ansible.com/">Ansible Galaxy</a>.</p>
<p>You can search the Galaxy website for <a href="https://galaxy.ansible.com/list#/roles?page=1&amp;page_size=10&amp;autocomplete=miniconda">miniconda</a> and see that a handful of roles for installing Miniconda exist. I liked <a href="https://galaxy.ansible.com/andrewrothstein/miniconda/">this one</a>.</p>
<p>We can install the role locally using the <code>ansible-galaxy</code> command line tool.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [14]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ansible-galaxy install -f andrewrothstein.miniconda
</pre></div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>You can have the role installed wherever you want (run <code>ansible-galaxy install --help</code> to see how, but by default they'll go to <code>/usr/local/etc/ansible/roles/</code>.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [15]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ls -lh /usr/local/etc/ansible/roles/andrewrothstein.miniconda
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ls -lh /usr/local/etc/ansible/roles/andrewrothstein.miniconda
total 32
-rw-rw-r--  1 tdhopper  admin   1.1K Jan 16 16:52 LICENSE
-rw-rw-r--  1 tdhopper  admin   666B Jan 16 16:52 README.md
-rw-rw-r--  1 tdhopper  admin   973B Jan 16 16:52 circle.yml
drwxrwxr-x  3 tdhopper  admin   102B Mar 21 11:33 <span class="ansi-blue-fg">defaults</span>
drwxrwxr-x  3 tdhopper  admin   102B Mar 21 11:33 <span class="ansi-blue-fg">handlers</span>
drwxrwxr-x  4 tdhopper  admin   136B Mar 21 11:33 <span class="ansi-blue-fg">meta</span>
drwxrwxr-x  3 tdhopper  admin   102B Mar 21 11:33 <span class="ansi-blue-fg">tasks</span>
drwxrwxr-x  3 tdhopper  admin   102B Mar 21 11:33 <span class="ansi-blue-fg">templates</span>
-rw-rw-r--  1 tdhopper  admin    57B Jan 16 16:52 test.yml
drwxrwxr-x  3 tdhopper  admin   102B Mar 21 11:33 <span class="ansi-blue-fg">vars</span>
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>You can look at the <code>tasks/main.yml</code> to see the core logic of installing Miniconda. It has tasks to download the installer, run the installer, delete the installer, run <code>conda update conda</code>, and make <code>conda</code> the default system Python.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [16]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>cat /usr/local/etc/ansible/roles/andrewrothstein.miniconda/tasks/main.yml
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>/main.ymllocal/etc/ansible/roles/andrewrothstein.miniconda/tasks
---
# tasks file for miniconda
- name: download installer...
  become: yes
  become_user: root
  get_url:
    url: '{{miniconda_installer_url}}'
    dest: /tmp/{{miniconda_installer_sh}}
    timeout: '{{miniconda_timeout_seconds}}'
    checksum: '{{miniconda_checksum}}'
    mode: '0755'

- name: installing....
  become: yes
  become_user: root
  command: /tmp/{{miniconda_installer_sh}} -b -p {{miniconda_parent_dir}}/{{miniconda_name}}
  args:
    creates: '{{miniconda_parent_dir}}/{{miniconda_name}}'

- name: deleting installer...
  become: yes
  become_user: root
  when: miniconda_cleanup
  file:
    path: /tmp/{{miniconda_installer_sh}}
    state: absent

- name: link miniconda...
  become: yes
  become_user: root
  file:
    dest: '{{miniconda_parent_dir}}/miniconda'
    src: '{{miniconda_parent_dir}}/{{miniconda_name}}'
    state: link

- name: conda updates
  become: yes
  become_user: root
  command: '{{miniconda_parent_dir}}/miniconda/bin/conda update -y --all'

- name: make system default python etc...
  when: miniconda_make_sys_default
  become: yes
  become_user: root
  with_items:
    - etc/profile.d/miniconda.sh
  template:
    src: '{{item}}.j2'
    dest: /{{item}}
    mode: 0644

</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h4 id="Overriding-Ansible-Variables">Overriding Ansible Variables<a class="anchor-link" href="#Overriding-Ansible-Variables">¶</a></h4><p>Once a role is installed locally, you can add it to a play just like you can with roles you wrote. Installing Miniconda is now as simple as:</p>
<pre><code>  roles:
    - role: andrewrothstein.miniconda</code></pre>
<p>Before we add that to a playbook, I want to customize <em>where</em> miniconda is installed. If you look back at the <code>main.yml</code> file above, you see a bunch of things surrounded in double brackets. These are variables (in the <a href="http://jinja.pocoo.org/docs/2.9/">Jinja2 template language</a>). From the play, we can see that Miniconda will be installed at <code>{{miniconda_parent_dir}}/{{miniconda_name}}</code>. The role defines these variables in <code>/andrewrothstein.miniconda/defaults/main.yml</code>. We can override the default variables by specifying them in our play.</p>
<p>A play to install miniconda could look like this:</p>
<pre><code>---
- hosts: digitalocean
  vars:
    conda_folder_name: miniconda
    conda_root: /root
  roles:
    - role: andrewrothstein.miniconda
      miniconda_parent_dir: "{{ conda_root }}"
      miniconda_name: "{{ conda_folder_name }}"</code></pre>
<p>I added this to <a href="https://github.com/tdhopper/automating_python/blob/master/playbook.yml"><code>playbook.yml</code></a>.</p>
<p>We now know how to use Ansible to start and run supervisord and to install Miniconda. Let's see how to use it to deploy and start our application.</p>
<h3 id="Deploy-Python-Application">Deploy Python Application<a class="anchor-link" href="#Deploy-Python-Application">¶</a></h3><p>There are countless ways to deploy a Python application. We're going to see how to use Ansible to deploy from Github.</p>
<p>I created a little project called <a href="https://github.com/tdhopper/long_running_python_process">long_running_python_application</a>. It has a <a href="https://github.com/tdhopper/long_running_python_process/blob/master/main.py"><code>main.py</code></a> that writes a log line to stdout every 30 seconds; that's it. It also includes a <a href="https://github.com/tdhopper/long_running_python_process/blob/master/environment.yml">Conda environment file</a> specifying the dependencies and <a href="https://github.com/tdhopper/long_running_python_process/blob/master/run.sh">a shell script</a> that activates the environment and runs the program.</p>
<p>We're going to use Ansible to</p>
<ol>
<li>Clone the repository into our remote machine.</li>
<li>Create a Conda environment based on the environment.yml file. </li>
<li>Create a supervisord file for running the program.</li>
<li>Start the supervisord job.</li>
</ol>
<h4 id="Clone-the-repository">Clone the repository<a class="anchor-link" href="#Clone-the-repository">¶</a></h4><p>Cloning a repository with Ansible is easy. We just use the <a href="http://docs.ansible.com/ansible/git_module.html"><code>git</code> module</a>. This play will clone the repo into the specified directory. The <code>update: yes</code> flag tells Ansible to update the repository from the remote if it has already been cloned.</p>
<pre><code>---
- hosts: digitalocean
  vars:
    project_repo: git://github.com/tdhopper/long_running_python_process.git
    project_location: /srv/long_running_python_process
  tasks:
    - name: Clone project code.
      git:
        repo: "{{ project_repo }}"
        dest: "{{ project_location }}"
        update: yes</code></pre>
<h4 id="Creating-the-Conda-Environment">Creating the Conda Environment<a class="anchor-link" href="#Creating-the-Conda-Environment">¶</a></h4><p>Since we've now installed conda and cloned the repository with an <code>environment.yml</code> file, we just need to run <code>conda env update</code> from the directory containing the environment spec. Here's a play to do that:</p>
<pre><code>---
- hosts: digitalocean
  vars:
    project_location: /srv/long_running_python_process
  tasks:
    - name: Create Conda environment from project environment file.
      command: "{{conda_root}}/{{conda_folder_name}}/bin/conda env update"
      args:
        chdir: "{{ project_location }}"</code></pre>
<p>It uses the <a href="http://docs.ansible.com/ansible/command_module.html"><code>command</code> module</a> which just executes a shell command in the desired directory.</p>
<h4 id="Create-a-Supervisord-File">Create a Supervisord File<a class="anchor-link" href="#Create-a-Supervisord-File">¶</a></h4><p>By default, supervisord will <a href="http://supervisord.org/configuration.html">look in <code>/etc/supervisor/conf.d/</code> for configuration</a> on which programs to run.</p>
<p>We need to put a file in there that tells supervisord to run our <code>run.sh</code> script. Ansible has an integrated way of setting up templates which can be placed on remote machines.</p>
<p>I put a supervisord job template in the <code>./templates</code> folder.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [17]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>cat ./templates/run_process.j2
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>cat ./templates/run_process.j2
[program:{{ program_name }}]
command=sh run.sh
autostart=true
directory={{ project_location }}
stderr_logfile=/var/log/{{ program_name }}.err.log
stdout_logfile=/var/log/{{ program_name }}.out.log
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>This is a is normal INI-style config file, except it includes Jinja2 variables. We can use the Ansible <a href="http://docs.ansible.com/ansible/template_module.html"><code>template</code> module</a> to create a task which fills in the variables with information about our program and copies it into the <code>conf.d</code> folder on the remote machine.</p>
<p>The play for this would look like:</p>
<pre><code>- hosts: digitalocean
  vars:
    project_location: /srv/long_running_python_process
    program_name: long_running_process
    supervisord_configs_path: /etc/supervisor/conf.d
  tasks:
    - name: Copy supervisord job file to remote
      template:
        src: ./templates/run_process.j2
        dest: "{{ supervisord_configs_path }}/run_process.conf"
        owner: root</code></pre>
<h4 id="Start-the-supevisord-job">Start the supevisord job<a class="anchor-link" href="#Start-the-supevisord-job">¶</a></h4><p>Finally, we just need to tell supervisord on our remote machine to start the job described by <code>run_process.conf</code>.</p>
<p>Instead of issuing our own shell commands via Ansible, we can use the <a href="http://docs.ansible.com/ansible/supervisorctl_module.html"><code>supervisorctl</code> module</a>. The task is just:</p>
<pre><code>    - name: Start job
      supervisorctl:
        name: "{{ program_name }}"
        state: present</code></pre>
<p><code>state: present</code> ensures that Ansible calls <code>supervisorctl reread</code> to load a new config. Because our config has <code>autostart=true</code>, supervisor will start it as soon as the task is added.</p>
<h3 id="The-Big-Playbook!">The Big Playbook!<a class="anchor-link" href="#The-Big-Playbook!">¶</a></h3><p>We can take everything we've described above and put it in one playbook.</p>
<p>This playbook will:</p>
<ul>
<li>Install Miniconda using the role from Ansible Galaxy.</li>
<li>Install and start Supervisor using the role we created. </li>
<li>Clone the Github project we want to run. </li>
<li>Create a Conda environment based on the environment.yml file. </li>
<li>Create a supervisord file for running the program.</li>
<li>Start the supervisord job.</li>
</ul>
<p>All of this will be done on the host we specify (<code>digitalocean</code>).</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [18]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>cat playbook.yml
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>cat playbook.yml
---
- hosts: digitalocean
  vars:
    project_repo: git://github.com/tdhopper/long_running_python_process.git
    project_location: /srv/long_running_python_process
    program_name: long_running_process
    conda_folder_name: miniconda
    conda_root: /root
    supervisord_configs_path: /etc/supervisor/conf.d
  roles:
    - role: andrewrothstein.miniconda
      miniconda_parent_dir: "{{ conda_root }}"
      miniconda_name: "{{ conda_folder_name }}"
      tags:
        miniconda
    - role: supervisor
  tasks:
    - name: Clone project code.
      git:
        repo: "{{ project_repo }}"
        dest: "{{ project_location }}"
        update: yes
      tags:
        git
    - name: Create Conda environment from project environment file.
      command: "{{conda_root}}/{{conda_folder_name}}/bin/conda env update"
      args:
        chdir: "{{ project_location }}"
      tags:
        conda
    - name: Copy supervisord job file to remote
      template:
        src: ./templates/run_process.j2
        dest: "{{ supervisord_configs_path }}/run_process.conf"
        owner: root
      tags:
        conf
    - name: Start job
      supervisorctl:
        name: "{{ program_name }}"
        state: present
      tags:
        conf</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>To configure our machine, we just have to run <code>ansible-playbook playbook.yml</code>.</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [19]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span><span class="nv">ANSIBLE_NOCOWS</span><span class="o">=</span><span class="m">1</span> ansible-playbook playbook.yml
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ANSIBLE_NOCOWS=1 ansible-playbook playbook.yml

PLAY [digitalocean] ************************************************************

TASK [setup] *******************************************************************
<span class="ansi-green-fg">ok: [digitalocean]</span>

TASK [andrewrothstein.unarchive-deps : resolve platform specific vars] *********

TASK [andrewrothstein.unarchive-deps : install common pkgs...] *****************
<span class="ansi-yellow-fg">changed: [digitalocean] => (item=[u'tar', u'unzip', u'gzip', u'bzip2'])</span>

TASK [andrewrothstein.bash : install bash] *************************************
<span class="ansi-green-fg">ok: [digitalocean]</span>

TASK [andrewrothstein.alpine-glibc-shim : fix alpine] **************************
<span class="ansi-cyan-fg">skipping: [digitalocean]</span>

TASK [andrewrothstein.miniconda : download installer...] ***********************
<span class="ansi-yellow-fg">changed: [digitalocean]</span>

TASK [andrewrothstein.miniconda : installing....] ******************************
<span class="ansi-yellow-fg">changed: [digitalocean]</span>

TASK [andrewrothstein.miniconda : deleting installer...] ***********************
<span class="ansi-cyan-fg">skipping: [digitalocean]</span>

TASK [andrewrothstein.miniconda : link miniconda...] ***************************
<span class="ansi-yellow-fg">changed: [digitalocean]</span>

TASK [andrewrothstein.miniconda : conda updates] *******************************
<span class="ansi-yellow-fg">changed: [digitalocean]</span>

TASK [andrewrothstein.miniconda : make system default python etc...] ***********
<span class="ansi-cyan-fg">skipping: [digitalocean] => (item=etc/profile.d/miniconda.sh) </span>

TASK [supervisor : Install supervisord] ****************************************
<span class="ansi-green-fg">ok: [digitalocean]</span>

TASK [supervisor : Start supervisord] ******************************************
<span class="ansi-green-fg">ok: [digitalocean]</span>

TASK [Clone project code.] *****************************************************
<span class="ansi-yellow-fg">changed: [digitalocean]</span>

TASK [Create Conda environment from project environment file.] *****************
<span class="ansi-yellow-fg">changed: [digitalocean]</span>

TASK [Copy supervisord job file to remote] *************************************
<span class="ansi-yellow-fg">changed: [digitalocean]</span>

TASK [Start job] ***************************************************************
<span class="ansi-yellow-fg">changed: [digitalocean]</span>

PLAY RECAP *********************************************************************
<span class="ansi-yellow-fg">digitalocean</span>               : <span class="ansi-green-fg">ok</span><span class="ansi-green-fg">=</span><span class="ansi-green-fg">13</span>   <span class="ansi-yellow-fg">changed</span><span class="ansi-yellow-fg">=</span><span class="ansi-yellow-fg">9</span>    unreachable=0    failed=0

</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>See that the <code>PLAY RECAP</code> shows that everything was OK, no systems were unreachable, and no tasks failed.</p>
<p>We can verify that the program is running without error:</p>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [20]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ssh digitalocean sudo supervisorctl status
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ssh digitalocean sudo supervisorctl status
long_running_process             RUNNING   pid 4618, uptime 0:01:34
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In [21]:</div>
<div class="inner_cell">
<div class="input_area">
<div class=" highlight hl-bash"><pre><span></span>ssh digitalocean cat /var/log/long_running_process.out.log
</pre></div>
</div>
</div>
</div>
<div class="output_wrapper">
<div class="output">
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>ssh digitalocean cat /var/log/long_running_process.out.log
INFO:root:Process ran for the 1th time
INFO:root:Process ran for the 2th time
INFO:root:Process ran for the 3th time
INFO:root:Process ran for the 4th time
</pre>
</div>
</div>
<div class="output_area">
<div class="prompt"></div>
<div class="output_subarea output_text output_error">
<pre></pre>
</div>
</div>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>If your lucky (i.e. your systems and networks were setup sufficiently similar to mine), you can run this exact same command to configure and start a process on your own system. Moreover, you could use this exact same command to start this program on an arbitrary number of machines by simply adding more hosts to your inventory and play spec!</p>
<h3 id="Conclusion">Conclusion<a class="anchor-link" href="#Conclusion">¶</a></h3><p>Ansible is a powerful, customizable tool. Unlike some similar tools, it requires very little setup to start using it. As I've learned more about it, I've seen more and more ways in which I could've used it in copious projects in the past; I intend to make it a regular part of my toolkit. (Historically I've done this kind of thing with hacky combinations of shell scripts and <a href="http://www.fabfile.org/">Fabric</a>; Ansible would often be better.)</p>
<p>This tutorial just scratches the surface of the Ansible functionality. If you want to learn more, I again recommend reading through the <a href="http://docs.ansible.com/ansible/index.html">docs</a>; they're very good. Of course, you should start writing and running your own playbooks as soon as possible! I also liked <a href="https://serversforhackers.com/an-ansible-tutorial">this tutorial from Server Admin for Programmers</a>. If you want to compare Ansible to alternatives, the <a href="https://valdhaus.co/books/taste-test-puppet-chef-salt-stack-ansible.html">Taste Test book</a> by Matt Jaynes looks promising. For more on Supervisor, <a href="https://serversforhackers.com/monitoring-processes-with-supervisord">serversforhackers.com</a> has a nice tutorial, and <a href="http://supervisord.org/">its docs are thorough</a>.</p>
<p><blockquote class="twitter-tweet" data-cards="hidden" data-conversation="none" data-lang="en"><p dir="ltr" lang="en">I wrote a tutorial on using <a href="https://twitter.com/ansible">@ansible</a> and supervisor to deploy a long running Python process to a <a href="https://twitter.com/digitalocean">@digitalocean</a> VPS.<a href="https://t.co/uPC8bY5haD">https://t.co/uPC8bY5haD</a></p>— Tim Hopper 🔭 (@tdhopper) <a href="https://twitter.com/tdhopper/status/845256769429483520">March 24, 2017</a></blockquote><script async="" charset="utf-8" src="//platform.twitter.com/widgets.js"></script></p>
</div>
</div>
</div>

<script>
$(document).ready(function() {
    $('div.cell div.prompt').hide(); // Hide jupyter cell numbers

});
</script>
