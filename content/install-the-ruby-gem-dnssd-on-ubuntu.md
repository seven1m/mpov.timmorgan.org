---
date: 2009-05-19
layout: post
title: Install the Ruby gem "dnssd" on Ubuntu
tags: []
status: publish
type: post
published: true
meta: {}
---

```
sudo aptitude install libavahi-compat-libdnssd-dev
sudo gem install technomancy-dnssd -s http://gems.github.com
```

```
require 'rubygems'
require 'dnssd'
```
