---
date: 2011-06-21
layout: post
title: jQuery Template Attribute Language
tags: []
status: publish
type: post
published: true
meta: {}
---
<p>Introducing <a href="https://github.com/seven1m/jqtal">jqtal</a>, my tiny jQuery plugin that provides a different way of doing client side HTML templating.</p><p /><div>jqtal is different because it is a part of and lives alongside the HTML itself. An example might help:<br /><p /><div><div class='p_embed p_image_embed'><a href="/images/example.png"><img alt="Example" height="327" src="/images/example.png.scaled.500.jpg" width="500" /></a></div></div><p /></div><div>The plugin uses HTML5 data- attributes to embed data necessary for content insertion. Whereas in a normal template language, you might have something like:</div><p /><div><span style="font-family: courier new, monospace;">&lt;input name="first_name" value="{{ person.first_name }}"/&gt;</span></div><p /><div>...in jqtal, you do this instead:</div><p /><div><span style="font-family: courier new, monospace;">&lt;input name="first_name" data-val="first_name"/&gt;</span></div><p /><div>Now isn't that pretty!!!?</div><p /><div>I'll leave explanation of all the syntax to the fairly extensive <a href="https://github.com/seven1m/jqtal/blob/master/README.md">README</a>. Go check it out.</div><p /><div>Of course, there's nothing new under the sun, and indeed this idea is stolen shamelessly from <a href="http://zope.org/">Zope</a>'s TAL (Template Attribute Language) that I used back in the day. In fact, it was one of the few things I actually liked about Zope.</div><p /><div>I hope you enjoy it too!</div>
