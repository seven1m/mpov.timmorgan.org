---
date: 2008-03-01
layout: post
title: Git For People Who Know Svn (Things I've Learned, Part 1)
tags: []
status: publish
type: post
published: true
meta: {}
---

First, the mental hurdles:You don't need a server to have a git repository. All your commit history is available locally and quickly, with simple commands. Same with branches and tags. Git "checkout" and "commit" are commands you run locally. Svn "checkout" and "commit" are really more like "pull" and "push" with git.

Now, the commands:

`rails myapp && cd myapp && git init && git add . && git commit -a` creates a repo and makes the first commit (but still nothing is sent to any server; all work is done locally in your own repository)

`echo "my app rocks" > README && git add README && git commit -a` makes another commit

`git rm path/to/remove && git commit -a`

`git reset --hard HEAD` returns your repo to last committed state (warning: cancels working changes) I'm still fighting with this one. It seems the best way might be to do a `git checkout -f` instead.

That's it for the first part. Part 2 will be next.
