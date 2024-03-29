---
date: 2006-06-24
layout: post
title: Junk Email Filter Dot Com
tags: []
status: publish
type: post
published: true
meta: {}
---
We just started using an <a href="http://www.junkemailfilter.com/spam/">email filtering service</a> at <a href="http://www.cedarridgecc.com">Cedar Ridge</a>. So far, I'm very pleased with it. In the two days it's been in place, only a handful of spam messages have passed through to our server, and every one of those were filtered by our existing <a href="http://en.wikipedia.org/wiki/DNSBL">DNS blacklist</a> filtering.

The filter works by proxy, meaning all mail destined for our domain is first delivered to junkemailfilter.com. Their server filters out the spam using some fancy voodoo and delivers the good stuff to our server. Very simple, and no configuration needed or software to be installed on our end.

These filtering services seem to be getting more popular, or maybe it's just that I'm noticing more of them. The cool thing is that the junk mail never touches our server, so the server load is lightened considerably. I'd guess our mail server will be doing about 25% of the work it used to. That saves us bandwidth, processor load, and generally makes our staff much happier.
