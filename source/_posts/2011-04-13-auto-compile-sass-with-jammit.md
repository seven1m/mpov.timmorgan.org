---
layout: post
title: Auto-Compile SASS with Jammit
tags: []
status: publish
type: post
published: true
meta: {}
---

I won't bother explaining to my regular readers what these two things are. If you need this, then you know... ;-)

{% gist 918402 %}

I know that both SASS and Compass can be setup to "watch" a directory and auto-compile when files are changed, but it seemed a waste to me to have another thing I have to remember to launch.

This hack piggybacks on Jammit's include_stylesheets helper method and compiles and .scss files in the public/stylesheets directory if they've changed since last time.

I hope this helps someone.
