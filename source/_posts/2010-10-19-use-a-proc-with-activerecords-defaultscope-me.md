---
layout: post
title: Use a Proc with ActiveRecords' default_scope Method
tags: []
status: publish
type: post
published: true
meta: {}
---

Today, my [small patch](http://github.com/rails/rails/commit/b1b26af9a2f1c2037f7c2167d747ed33cc639763) to Rails was applied by the core team. This is only my second contribution to Rails, so I'm fairly stoked about it being accepted.

This will allow you to pass a block to the `default_scope` method in ActiveRecord. It doesn't sound like much, but opens up some wonderful possibilities.

First, a review of what `default_scope` does:

{% gist 635165 %}

The first call to `Person.all` applies the default scope and adds a where clause that returns only non-deleted folks.

The next two calls are passed through the unscoped { } block so that the default scope isn't applied.

Great! Using `default_scope` keeps me from having to specify a common condition over and over again on every (or nearly every) query.

What else can we use this for?

Well, let's say you have an app with different customers. Each customer needs to have the illusion of operating in their own "database" while your server has just one.

Each customer has their own subdomain, say foo.example.com or bar.example.com. Depending on the hostname, let's scope our queries to that particular customer.

{% gist 635169 %}

Oops! This doesn't work because the call to `where()` is made at the time the class is created. Instead, we need the `where()` to be called each time a query is made.

With `named_scope`<sup>1</sup>, you can pass a lambda/proc, but with `default_scope`, you cannot. Until now that is!

With my wonderful, 6-line patch (plus tests of course), you can now pass a proc to `default_scope`:

{% gist 635207 %}

This technique is exactly what my project [OneBody](http://github.com/seven1m/onebody) uses to scope customer "sites" to their specific `site_id` based on hostname. The `Person.current_site_id` bit is actually called inside the ApplicationController once the hostname is determined.

It won't change the world, but being able to contribute this small bit of code back to the framework I love and use everyday feels great.

Footnotes:

1. `named_scope` is just `scope` as of Rails 3.
