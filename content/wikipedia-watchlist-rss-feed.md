---
date: 2006-08-23
layout: post
title: Wikipedia Watchlist RSS Feed
tags: []
status: publish
type: post
published: true
meta: {}
---
<i><b> Update: Version 2 is available <a href="http://mpov.wordpress.com/2007/02/19/wikipedia-watchlist-feed-v2/">here</a>.</b></i>Today, I finally got fed up with <a href="http://en.wikipedia.org">Wikipedia</a>'s lack of <a href="http://en.wikipedia.org/wiki/Wikipedia:Watchlist">watchlist</a> feeds, so I wrote a script that generates them.

A few of the photos I had uploaded to the Wikimedia Commons have been marked for deletion for some time now due to inadequate license information (my fault entirely), but I didn't know it because I didn't think about the Commons having its own separate watchlist. Oops. That got me thinking... these watchlists should have feeds so I don't have to keep pulling up my bookmarks every day.

Now, until they actually add feeds to those pages, I have my own solution in a few lines of Ruby code: WatchlistRSS.zip This code can be run as a CGI on a web server and generates feeds like this.

So, I'm sharing this because the other two or three scripts out there written to do this suck IMO. (Or at least I couldn't get them to work -- which in that case means I suck :-)
