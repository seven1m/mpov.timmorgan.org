---
date: 2010-05-09
layout: post
title: Use rsync instead of cp
tags: []
status: publish
type: post
published: true
meta: {}
---

I tend to use rsync when others would typically use a simple cp for copying files. A few reasons:

1. It can be canceled in the middle, and resumed later.
2. It can show a progress bar that (while not perfect) is great for large files or lots of files.
3. It will only copy the changed files and won't clobber already existing directories of files at the target.

rsync is available on Linux, Mac, and there's a binary somewhere on teh intarwebs for Windows.

To use, you almost always want to pass the `-a` flag, which stands for "archive" -- basically a convenience flag for `-r` (recursive), `-p` (permissions), `-t` (timestamps), and a few others. I can't think of a time I haven't used `-a` when using rsync.

Following that, basic usage looks like this:

```
rsync -a source destination
```

The other thing to remember when using rsync is that it's picky with slashes; if you put a trailing lash on a path, then rsync takes that to mean you want to copy the _contents_ of that path. If, on the other hand, you leave off the slash, it will copy the path _and_ its contents. A few examples will help:

```
# This will copy the stuff directory (and its contents) to the documents directory
rsync -a /home/tim/stuff /home/tim/documents

# This will copy only the contents of stuff to the documents directory
rsync -a /home/tim/stuff/ home/tim/documents
```

Some other handy arguments:

* `--stats`
* `--progress`

So, to put it all together:

```
rsync -a --stats --progress /home/tim/stuff /home/tim/documents
```

And, better yet, rsync can work over ssh (if it's installed on both hosts). Just put an ssh host on the front of either path:

```
rsync -a --stats --progress /home/tim/stuff tim@foo.example.com:/home/tim/
```

or

```
rsync -a --stats --progress tim@foo.example.com:/home/tim/stuff /home/tim/
```

So, there you have it. rsync can do tons more stuff, but this is a great start. If this is all you learn of rsync, you will be that much better off.
