---
date: 2008-08-21
layout: post
title: ShrinkSafe with Prototype 1.6
tags: []
status: publish
type: post
published: true
meta: {}
---
I didn't find this information anywhere, so here it is for the Google archives...

To get <a href="http://prototypejs.org/">Prototype</a> to run after squeezing it through <a href="http://shrinksafe.dojotoolkit.org/">ShrinkSafe</a>, you need to put back every instance of the variable $super. ShrinkSafe replaces variable names with shortened versions, and because of some Prototype voodoo, it breaks on this one name. There are about 8 places you'll find it, and unfortunately, it takes some manual hunting once ShrinkSafe has changed a bunch of names, but there you have it.

I suppose someone smarter than I could tweak ShrinkSafe to ignore this variable name, but for me, this works.
