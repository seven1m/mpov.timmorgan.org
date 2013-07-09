---
layout: post
title: Authority on Rails (Gem for Declaring User Authorization)
tags:
- rails
- plugin
- rest
status: publish
type: post
published: true
meta: {}
---

[CanCan](https://github.com/ryanb/cancan) is a wonderful plugin for Rails that allows you to define all your authorization logic in one place. For small apps, it works well. But as my app's authorization needs grew more complex, I realized I needed a different approach to declaring and testing authorization.

So I went looking... It turns out that the [Authority](https://github.com/nathanl/authority) gem is exactly what I was looking for:

* Authority splits out auth logic into individual "Authorizers". Each one handles authorization for a single model (or multiple models that behave the same way), with individual methods for each action.
* Authority doesn't try to do too much -- it gives you an organized way to check authorization in regular Ruby code, explicitly, without having to write implicit rules.

For our app, authorization got much simplified with regular "if" statements (compare to [this](https://github.com/churchio/onebody/blob/8c295727388a8ff3392d21301226b3726e7694b4/app/models/ability.rb#L36-L47)):

{% codeblock AlbumAuthorizer lang:ruby %}
class AlbumAuthorizer < ApplicationAuthorizer
  def readable_by?(user)
    # belongs to me
    if resource.owner == user
      true
    # belongs to a friend
    elsif Person === resource.owner and user.friend_ids.include?(resource.owner.id)
      true
    # belongs to a group I'm in
    elsif Group === resource.owner and user.member_of?(resource.owner)
      true
    # is marked public
    elsif resource.is_public?
      true
    # I'm an admin
    elsif user.admin?(:manage_pictures)
      true
    end
  end
end
{% endcodeblock %}

I like having my authorization logic split into separate classes -- it seems to be a cleaner approach.

Also, you can have one authorizer depend on another, like so:

{% codeblock PictureAuthorizer lang:ruby %}
class PictureAuthorizer < ApplicationAuthorizer
  def readable_by?(user)
    # ask the resource's parent "album" if this user can read it
    resource.album.readable_by?(user)
  end
end
{% endcodeblock %}

Now, there's a lot that Authority does *not* do:

* Authority doesn't build SQL for you. Unlike CanCan's [accessible_by](https://github.com/ryanb/cancan/wiki/Fetching-Records), Authority doesn't give you a way to query all records accessible by the user. Our solution was to [build that SQL ourselves](https://github.com/churchio/onebody/blob/ef7f1ab9ea62df0b502b389686a0ca9e339a0ea5/app/authorizers/album_authorizer.rb#L49-L62), which isn't difficult.
* Authority doesn't give you a way to load and authorize your resources in your controllers. For that, I built [load_and_authorize_resource](https://github.com/seven1m/load_and_authorize_resource) as a more generic solution. (More about that in the next blog post.)

...with these things absent, Authority has a narrow job that it does very well.

CanCan is still a wonderful tool that I will likely use on a future project, but Authority takes a different approach and is a great tool to have in the toolbelt!
