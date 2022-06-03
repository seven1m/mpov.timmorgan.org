---
date: 2009-06-04
layout: post
title: CascadingRubies - Ruby DSL for generating CSS
tags: []
status: publish
type: post
published: true
meta: {}
---
I've been working on a little experiment lately... a Ruby <a href="http://martinfowler.com/bliki/DomainSpecificLanguage.html">domain-specific language</a> for generating Cascading Style Sheets called <a href="http://github.com/seven1m/cascading_rubies">CascadingRubies</a>.

It's an internal DSL, meaning it uses plain Ruby syntax, like this:<div class='p_embed p_image_embed'><img alt="Media_httpmpovwordpresscomfiles200906rcsscodepng_ksvedhykhsgbbzt" height="219" src="/images/media_httpmpovwordpresscomfiles200906rcsscodepng_ksveDHykhsgBBzt.png.scaled500.png" width="460" /></div>Output:<div class='p_embed p_image_embed'><a href="/images/media_httpmpovwordpresscomfiles200906rcssoutput1png_jxdjmydgdDlFEow.png.scaled1000.png"><img alt="Media_httpmpovwordpresscomfiles200906rcssoutput1png_jxdjmydgddlfeow" height="61" src="/images/media_httpmpovwordpresscomfiles200906rcssoutput1png_jxdjmydgdDlFEow.png.scaled500.png" width="500" /></a></div>Being just Ruby, of course, you can mix in variables, arithmetic, require external code, hit the database, or whatever.

The guys on the Tulsa.rb mailing list have provided some <a href="http://groups.google.com/group/tulsarb/browse_thread/thread/7871831d9974e02c">great feedback</a>, and from that I've released the the second gem version (0.2.0). If this looks interesting to you, head over to the <a href="http://github.com/seven1m/cascading_rubies">GitHub project</a> and check it out. Please let me know what you think.
