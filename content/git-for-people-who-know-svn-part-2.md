---
date: 2008-03-03
layout: post
title: Git For People Who Know Svn, Part 2
tags: []
status: publish
type: post
published: true
meta: {}
---

For Part 2 of our [60-second Git tutorial](/2008/03/02/git-for-people-who-know-svn/), we'll look at some super simple branching and merging.

`git branch` tells you which branch you're on.

`git branch -a` lists all branches, even remote ones.

`git checkout mybranch` checks out the branch you want.

`git checkout -b newbranch` creates a new branch from the one you're on, and checks it out for you.

`git checkout master && git merge mybranch` merges changes from one branch to your master branch. If you don't yet want to commit the changes, you can do `git merge --no-commit mybranch` instead.

So far, we've only talked about local git usage. Isn't it cool that you can do so much without even having a server set up with our repo? I think so.

<strike>Part 3 will include pulling and pushing your changes to remote repos.</strike>

**Update:** Yeah, ok, so I never got around to writing part 3. Back when this was written, super simple Git how-tos were less plentiful. Now, we have [git-scm.com](http://git-scm.com/), [Why Git is Better than SVN](http://thkoch2001.github.io/whygitisbetter/#svn), and of course [GitHub's help site](https://help.github.com/).
