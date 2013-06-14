---
layout: post
title: Find photos on your hard drive to upload to Flickr.
tags:
- photos
- pictures
- flickr
- ruby
status: publish
type: post
published: true
meta: {}
---

If you're [like me](http://www.flickr.com/photos/timothymorgan/), you have thousands of photos on Flickr, and thousands more scattered accross your laptop, external drive, and phone.

What's been uploaded to Flickr and what hasn't? Who knows!

I hacked up a quick solution in Ruby and called it [Flickr Upload Set](https://github.com/seven1m/flickr-upload-set).

![diagram](https://raw.github.com/seven1m/flickr-upload-set/master/public/set.png "Flickr's logo looks like a Venn diagram.")

It's built as a web app with Sinatra, but it's **not meant to run on a server** -- just on your local computer.

Here's how it works:

1. Launch the Ruby app and open your browser to localhost:3000.
2. Navigate to a folder that contains photos.
3. Flickr Upload Set makes some calls to the Flickr API to search for photos with the same name under your account.
4. Files found on Flickr are grayed out on the screen.

![screenshot](https://raw.github.com/seven1m/flickr-upload-set/master/public/screenshot.png "Photos that are grayed out already exist on Flickr (probably).")

More details can be found on the [project page on GitHub](https://github.com/seven1m/flickr-upload-set).

Check it out. Let me know if it's useful to you!
