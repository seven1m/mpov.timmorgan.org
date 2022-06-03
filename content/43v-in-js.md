---
date: 2006-06-06
layout: post
title: 43V in JS
tags: []
status: publish
type: post
published: true
meta: {}
---
Now you can get your 43 Verses in a format you can stick on your blog or other personal website. Just go to your 43V &quot;My Verses&quot; page and add this to the URL: &quot;?format=js&quot;. If you don&#39;t want all your verses listed, you can add another argument called &quot;count&quot; like this: &quot;&amp;count=10&quot;. So the full URL might look like this: <a href="http://43verses.com/users/show/1?format=js&amp;count=10">http://43verses.com/users/show/1?format=js&amp;count=10</a>You can see an example of this in use at <a href="http://family.timmorgan.org" target="_blank">our family weblog</a>. Scroll down a bit and look on the left where it says &quot;Our Verses.&quot;The code for this follows:<div class="CodeRay">  <div class="code"><pre>&lt;h2&gt;Our Verses&lt;/h2&gt;&lt;p&gt;from <a href="http://www.43verses.com/users/show/1">43verses.com</a>&lt;/p&gt;&lt;script type=&quot;text/javascript&quot; src=&quot;http://www.43verses.com/users/show/1?format=js&amp;count=10&quot;&gt;&lt;/script&gt;</pre></div></div>
