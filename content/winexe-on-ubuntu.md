---
date: 2011-02-24
layout: post
title: Winexe on Ubuntu
tags: []
status: publish
type: post
published: true
meta: {}
---
If you&#39;re running a Linux desktop in an otherwise Windows environment, winexe may be something you&#39;ll enjoy.<p /><div>Winexe allows you to execute commands from a Linux machine on a remote Windows machine, as if you&#39;re sitting at the Windows command prompt. Think of the possibilities!<br /> <p /><div>Recently, I found a way to get it to compile on my beloved Ubuntu Maverick (it broke when I dist-upgraded for some reason), and I thought I&#39;d share. Winexe doesn&#39;t have a Debian package that I&#39;m aware of, and getting documentation on how to make it compile is spotty at best. The <a href="http://sourceforge.net/projects/winexe/" target="_blank">official SF page</a> might be the obvious destination to find out how to get it, but alas, it no workie.</div> <p /><div>Fortunately, the peeps at <a href="http://zenoss.org" target="_blank">Zenoss</a> got your back. Here&#39;s the scoop:</div><p /><div><script src="https://gist.github.com/843062.js?file=build_winexe.sh"></script></div> <p /><div>(The patch is necessary to fix a tiny typo in winexe/service.c -- if it doesn&#39;t apply properly, chances are good the typo has been fixed since this blog post.)</div> <p /><div>Once you&#39;ve compiled, now for some fun!</div><p /><div><script src="https://gist.github.com/843062.js?file=winexe_example.sh"></script></div> <p /><div>Never again must you VNC into a Windows box just to restart a service! I even have a script that remotely executes a &quot;git pull&quot; and then restarts all the relevant Windows services. Poor man&#39;s deploy FTW!!1</div> </div>
