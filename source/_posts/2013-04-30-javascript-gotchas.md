---
layout: post
title: JavaScript Gotchas
tags:
- javascript
- coffeescript
- programming
status: publish
type: post
published: true
meta: {}
---

Here are some common time sinks encountered when building a JavaScript app, along with some tips to avoid them.

_Note: these tips were originally shared as a part of my [TulsaWebDevs presentation](http://tulsawebdevs.org/startup-weekend-project-picirus-and-javascript-gotchas/?utm_source=rss&utm_medium=rss&utm_campaign=startup-weekend-project-picirus-and-javascript-gotchas) following 2012 [Startup Weekend Tulsa](http://tulsa.startupweekend.org)._

## Bind

In JavaScript, scope is resolved during a function's execution -- not its definition. When working with classes, you expect that `this` will point to the class, but it often won't.

Example:

```javascript
var Todo = Backbone.View.extend({
  events: {
    'click input': 'check'
  },

  check: function() {
    console.log(this);
  }
});
```

Solution 1:

Use `_.bindAll()`

```javascript
var Todo = Backbone.View.extend({
  events: {
    'click input': 'check'
  },

  initialize: function() {
    _.bindAll(this, 'check');
  },

  check: function() {
    console.log(this);
  }
});
```

Solution 2:

Use CoffeeScript `=>`

```coffeescript
class Todo extends Backbone.View
  events:
    'click input': 'check'

  check: =>
    console.log this
```

## Callback Spaghetti

As your app grows more complicated, your code will start to look like this (unless you work hard to avoid it):

```javascript
before(function (done) {
  server.server(options, function (s, db, providers) {
    //clear db and add a test user - "testuser"
    db.user.remove({}, function () {
      db.notification.remove({}, function () {
        providers.provider1.insertBulk(item1, item2, item3],
          function (err, result) {
          providers.provider2.insert([item1, item2, item3]
            function (err, result) {
            providers.provider3.insert([item1, item2, item3]
              function (err, result) {
              providers.provider4.insert([item1, item2, item3],
                function (err, result) {
                s.listen();
                done();
                })
              });
            });
          });
        });
      });
  });
});
```

While I have no perfect solution, here are some tips:

**1. Split callbacks out into separate methods on the class:**

```javascript
click: function() {
  $.get('/foo', function(data) {
    // do something
  });
}
```

...becomes:


```javascript
click: function() {
  $.get('/foo', this.clickCallback);
}

clickCallback: function(data) {
  // do something
}
```

Rinse, repeat.

**2. Use the [async](https://github.com/caolan/async) or [Seq](https://github.com/substack/node-seq) library**

Waterfall:

```javascript
async.waterfall([
  function(callback){
    callback(null, 'one', 'two');
  },
  function(arg1, arg2, callback){
    callback(null, 'three');
  },
  function(arg1, callback){
    callback(null, 'done');
  }
], function (err, result) {
 // done
});
```

forEach:

```javascript
async.forEach(files, this.saveFile, this.complete);
```


## Supervisor Pegging CPU

Supervisor monitors files for changes; if you have many files, your CPU starts to become pegged.

Solution: Ignore the node modules directory and any other directories not containing source code:

```
supervisor -i data,node_modules app.js
```

## Supervisor doesn't reload configs

Solution: um, be aware of this fact, and just ctrl-c and start supervisor again when you change a config. :-)

## Object is not a function

This error is the bane of my existence. It happens in lots of places, for many different reasons, but here are a few that I always try to check first:

* module.exports is not set
* when using cs, forgetting a comma, e.g. `fn bar 2` instead of `fn bar, 2`
* setting a property on your object with the same name as a method

## Backbone - visibility into view(s)

If you're building a Backbone.js app, do yourself a favor, and set the main app view as `window.app_view` or something similar. Set other views as subviews on the main view.

This will allow you to inspect the app from FireBug after everything is up and running.

## Sometimes console.log() lies - object changes after being logged

In FireBug, doing a `console.log` on an object can be misleading if the object changes soon after it is logged. FireBug will update the nested properties of the object.

Solution: to be sure, you should `console.log(obj.foo.bar)` to see the actual value of the property at the time it is logged.
