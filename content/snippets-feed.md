---
date: 2007-02-14
layout: post
title: Snippets Feed
tags: []
status: publish
type: post
published: true
meta: {}
---

It occured to me that my gems of wisdom on [my Snippets page](http://snippets.dzone.com/user/timmorgan) likely go unnoticed by you faithful blog readers, so you might want to subscribe to [my snippets feed](http://snippets.dzone.com/rss/user/timmorgan) as well so you don't miss beauties like [this](http://snippets.dzone.com/posts/show/3516) (yes, I know this will seem lame to some, but I think it's clever):

```
class Object
  def in?(object)
    object.include? self
  end
end
```

```
1.in? 2..3 #=> false
1.in? 1..3 #=> true
```
