---
layout: post
title: "Clipboard History in Sway Window Manager"
date: 2019-03-14 21:07:33 -0500
tags:
- ruby
- sway
- wayland
- clipboard
categories: 
---

Recently I switched to the [Sway](https://swaywm.org/) window manager on
[my favorite laptop](http://seven1m.sdf.org/opinion/my_favorite_dev_laptop.html)
and realized that [ClipIt](https://github.com/CristianHenzel/ClipIt) does not work there.
I was reminded of an old
[Ruby script I wrote](https://mpov.timmorgan.org/super-simplesource/_posts/2019-03-14-clipboard-history-in-sway-window-manager.markdown-clipboard-history-for-linux/)
way back in 2012 to serve this purpose.

Time to dust that thing off and make it work with Wayland! I installed the excellent
wl-clipboard by Sergey Bugaev and started hacking.

Here is my script:

{% gist e2973274520b25db8f7a7d9155cc8566 %}

Here's how to use it:

1.  Save the script above to a file at `/usr/local/bin/clipd` and make it executable.

2.  Install `dmenu` if you don't already have it.

3.  Install [wl-clipboard](https://github.com/bugaevc/wl-clipboard) from source.
    At the time of this writing, the package in the Ubuntu repository is fairly old and causes
    some screen glitching. The latest version on GitHub fixed that for me.

4.  Add the following config to your Sway config at `~/.config/sway/config`:

    ```
    bindsym $mod+v exec clipd menu
    exec --no-startup-id clipd
    ```

5.  Restart Sway.

Now, when you copy text, clipd will see the new text (within 5 seconds) and add it to your
`~/.clipboard-history` file. It keeps the last 100 entries there.

When you press Mod + v, a menu will show the entries and allow you to make a selection. The
item you select will be put back on the clipboard so you can paste it.

Enjoy!
