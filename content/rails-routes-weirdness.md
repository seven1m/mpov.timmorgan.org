---
date: 2008-03-11
layout: post
title: Rails Routes Weirdness
tags: []
status: publish
type: post
published: true
meta: {}
---
Just to save you a half-hour of your life, I thought I'd share that you should never create a named route called "directory" -- it will break Rails migrations and other rake tasks in mysterious and hard-to-track-down ways.
