---
date: 2006-09-14
layout: post
title: Server Migration
tags: []
status: publish
type: post
published: true
meta: {}
---
I host a few low-traffic websites out of my house. One of them is actually a paying customer! The last few days, I've been working on migrating all my web apps/sites to a new server (still at my house). This time, though, I spent some time on the infrastructure to make things more reliable. I set up <a href="http://users.piuha.net/martti/comp/ubuntu/raid.html">RAID 1 mirroring</a> on my hard drives. I also utilized <a href="http://www.vmware.com/products/server/">VMWare Server</a> (free) and built a virtual server image. I can't feel a speed hit by doing this, and the benefits are definitely worth the extra layer of complexity:<ul>	<li>I now back up a <del>1.6GB</del> 2.3GB image and know that I have the whole server backed up. No more <em>hoping </em>that I have all the files backed up I will need in the case of a disaster.</li>	<li>Snapshots let me roll the server back in case I install something that screws it up.</li>	<li>I can create new servers willy-nilly on the same hardware if I want to do other stuff (run <a href="http://www.teamxlink.co.uk/">XLink Kai</a> for instance).</li>	<li>If my hardware dies, I can fire up my laptop with VMWare Player and run the server while I get stuff back online.</li>	<li>Next time I move to other hardware, I need only install VMWare Server and copy over my image. Sweet!</li></ul>My Rails apps are still offline at the moment. I'm having a bit of trouble getting FastCGI to work again. Maybe it's time to look into <a href="http://mongrel.rubyforge.org/">Mongrel</a>...<strong>Update:</strong> I installed Mongrel and cooked up a <a href="http://www.bigbold.com/snippets/posts/show/2594">startup script</a>. Works great! Good-bye FastCGI!
