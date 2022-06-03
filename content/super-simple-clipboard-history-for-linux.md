---
date: 2012-11-07
layout: post
title: Super simple clipboard history for Linux.
tags:
- archlinux
- clipboard
- i3wm
- linux
- xclip
status: publish
type: post
published: true
meta: {}
---
<p>I recently switched from Gnome to <a href="http://i3wm.org/">i3</a> on my main laptop. So far, I'm enjoying the simplicity of piecing together my own desktop environment from small, specialized tools.</p><p>One thing I missed from Gnome was my clipboard history tool, <a href="https://github.com/Keruspe/GPaste">Gpaste</a>. I've come to expect that my previous dozen or more clipboard copies are a keystroke or two away and not lost forever.</p><p>While tweaking my i3 setup, I realized it would be possible to replicate some or even all of the functionality of GPaste using simple unix tools:</p><ul><li>Ruby (could be another scripting language, or just Bash script, but I'm more familiar with Ruby)</li><li><a href="http://sourceforge.net/projects/xclip/">xclip</a></li><li><a href="http://tools.suckless.org/dmenu/">dmenu</a></li></ul><p>An hour or so later, I had this:</p><script src="https://gist.github.com/4036552.js?file=clipd"></script><p>Upon startup, my .xinitrc file starts up clipd, which checks the clipboard every second for a new string. (Note, this only works for textual data at the moment.) It stores the last 100 unique items in the .clipboard-history file in my home directory.</p><p>The other piece to this is my .i3/config file, which has a keybinding for win+v.</p><script src="https://gist.github.com/4036552.js?file=.i3config"></script><p>This opens up dmenu with all the available clips. Once a selection is made via dmenu, the clip is stored in the clipboard for pasting the usual way.</p><p>It's not overly clever or advanced, but it seems to work.</p><p>Happy hacking!</p>
