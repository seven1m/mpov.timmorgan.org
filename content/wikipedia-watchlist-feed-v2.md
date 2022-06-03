---
date: 2007-02-19
layout: post
title: Wikipedia Watchlist Feed v2
tags: []
status: publish
type: post
published: true
meta: {}
---
<i><b>Update: </b>I've been using this for awhile now, and I still have to manually check my watchlist every day because my reader only gets updates every few days. I'm not sure, but it seems to be a caching issue on the WP API and not so much the script's fault.</i><i><b>Update 2:</b> The load on my server was too much, so I removed the hosted script from my server. You can still download the source and host it yourself.</i><i><b>Update 3:</b> Turns out it's better to just subscribe to each page's feed rather than to use a script like this.</i>Back before Wikipedia had <a href="http://meta.wikimedia.org/wiki/API">an API</a>, I created <a href="http://mpov.wordpress.com/2006/08/23/wikipedia-watchlist-rss-feed/">a script</a> that scraped the HTML and generated a plain RSS feed of my watchlist. Now, it's even easier as the new API does most of the work for you, provided you correctly authenticate with it. So, version 2 of the script is much simpler, and simply acts to authenticate a user and grab the feed as-is and hand it to the browser/aggregator/etc.

The script source is <a href="http://timmorgan.org/code/watchlist.txt">here</a>.

Basically, the URL would look like this:<blockquote class="posterous_short_quote"><a href="http://71m.org/watchlist.cgi?username=USERNAME&amp;password=PASSWORD">http://71m.org/watchlist.cgi?username=USERNAME&amp;password=PASSWORD</a></blockquote>Before you go trying it on my server, be aware that: (I have removed the script from my server. Sorry.)<ol>	<li>Your password and username are in the URL in plain-text (and thus in my server logs if you use this script directly from my server). This might scare you. I'm not an evil person, but then again, I wouldn't believe someone else telling me that for a second. If you don't trust me, then grab the script and stick it on your own server.</li>	<li>I will leave my script running for you to use directly, but if the load becomes too much on my lowly server, I will disable it.</li></ol>So, there's two reasons to grab the script and run it on your own server.

Thanks to <a href="http://jyotirmoy.net/code.html#wikiwatch">Jyotirmoy Bhattacharya</a> for his Python script that does basically the same thing.
