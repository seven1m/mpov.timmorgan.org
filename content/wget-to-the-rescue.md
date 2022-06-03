---
date: 2007-03-17
layout: post
title: wget to the rescue
tags: []
status: publish
type: post
published: true
meta: {}
---
Have you ever been downloading something very large for a long time, and something happens to interrupt it? Firefox crashes, you lose power, you accidentally close your laptop lid, etc.? Here's a trick to start your download where you left off:<ol>	<li>On Linux, you can skip this step. On Mac, download wget <a href="http://www.statusq.org/archives/2005/02/22/610/">here</a>, unzip it, and put "wget" in <code>/usr/bin</code>.  For Windows, looks like you can download wget <a href="http://pages.interlog.com/~tcharron/wgetwin.html">here</a> (I haven't tried this on Windows, but it shouldn't be much different).</li>	<li>In a terminal window, run <code>wget -c http://url/to/download</code>.</li></ol>The <code>-c</code> tells wget to "continue" the download. Even if you started your download in some other program, wget starts again where you left off. Pretty sweet, huh?
