---
date: 2013-04-26
layout: post
title: Migrate Posterous Blog to Jekyll
tags:
- blog
- jekyll
- posterous
status: publish
type: post
published: true
meta: {}
---

Posterous is set to shut down on April 30th. For the past month, I've been dreading the move from Posterous to whatever.

Today I bit the bullet and decided to migrate my Posterous blog to [Jekyll](http://jekyllrb.com/). There are many reasons I chose Jekyll -- independence from free hosted services is probably the biggest reason.

I chose to use [Octopress](http://octopress.org/), which extends Jekyll with a set of sane defaults and a good structure for customizing layout, CSS, etc.

To migrate the Posterous blog posts, first I downloaded an archive from the Posterous website. Inside the downloaded zip file, there is a `wordpress_export_1.xml` file, which [Jekyll knows how to import](https://github.com/mojombo/jekyll/wiki/blog-migrations#using-jekyll--wordpress-export-file-works-with-wordpresscom).

Lastly, I chose to download all Posterous-hosted images, because I expect that Twitter might not host Posterous assets on Amazon S3 forever. Better safe than sorry. Here is the script that I used to do that work:

{{% gist seven1m 5470301 %}}

Yay, now my blog isn't at the mercy of big corporations deciding how to make more money. Never mind that I just embedded a Gist above :-)

*Note:* I later realized all the images were in the original zip file I downloaded from Posterous. But odly, the filenames were a bit different and the wordpress xml file didn't link to them.
