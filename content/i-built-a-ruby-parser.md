---
layout: post
title: "I Built a Ruby Parser"
date: 2022-06-04 17:50:00 -0500
tags:
- ruby
- parser
- c++
---

*Sorry, this post will read like a "dear diary" entry rather than some
life-changing [HN](https://news.ycombinator.com)-worthy guidance.*

Back in November 2020, almost on a whim I started work on
[a new parser](https://github.com/natalie-lang/natalie_parser)
for the Ruby programming language. It was almost exactly a year after I had
started working on [my compiler project](https://github.com/natalie-lang/natalie)
(I hope to write a longer post about that someday soon), and in my frustration
with the state of affairs with Ruby parsers available to a humble C/C++
programmer, I decided to see how hard it would be.

## Utter Failure

Actually, the story starts about a month earlier when I thought I could make a
Ruby parser using a Parsing Expression Grammar, which I made
[a series of videos about](https://www.youtube.com/watch?v=5kGcuhDz4JA&list=PLWUx_XkUoGTrZFVEYGh6N7bmC60Eu5tjX).
That project was a failure. It was slow, buggy... I mean **very** buggy.
Also **very** slow. It was clear within a few weeks that it wasn't going to
be good enough.

Somehow that experience didn't deter me. It just helped me realize this project
would be beyond anything I had ever done, and I couldn't just "figure it out"
as I'm accustomed to doing.

## Learning Stuff

Then I read 'Writing an Interpreter In Go'.

[![Writing an Interpreter in Go book cover](/images/interpreterbook.png)](https://interpreterbook.com/)

The book has a decent section about parsing and it taught me the
[Pratt parsing](https://en.wikipedia.org/wiki/Operator-precedence_parser#Pratt_parsing)
technique. Even though the book examples were in Go and I was writing C++,
the technique carried over easily and I was able to get something that
seemed like it would work for parsing Ruby in a few weeks.

[I made some videos](https://www.youtube.com/watch?v=oyBZD-WXJhc&list=PLWUx_XkUoGTqVaRuvBTrNRifscPrvrjMe).
I hacked on my parser off-and-on over the next several months.

## Feeling Overwhelmed

**Then I got discouraged.** The amount of work ahead felt overwhelming and
I wasn't sure if I could do it alone.

Open source can be a lonely hobby. In some ways, I relish the out-for-a-hike
alone-ness of working on open source. It's full of personal challenges
and triumphs and ... often failures too. Not having someone who is there
beside you can really make you wonder _Why am I even doing this?_

<img alt="closed pull requests on github" src="/images/prs_closed.png" style="width:200px;float:right;">

So I put it aside for awhile and worked on [other things](https://github.com/natalie-lang/natalie/commit/a54964c17f8cd623ffb804653f623703d0fc0eaf).
Features that other people share a passion for and would help review.

<img src="/images/stop-hand.svg" style="width:50px;float:left;padding-right:10px;">

Aside: This happens a lot. I get bored, or frustrated, or overwhelmed with
a particular project and I move on to something else. But if the hard thing
is *worthy* then *something* will bring me back to work on it again.
The time away is important for gaining perspective, I think.

## Motivation

Then I started chatting with [Kevin Newton](https://twitter.com/kddnewton),
a Ruby hacker who works on Ruby internals at Shopify, and he helped me get
excited about the parser project again. It turns out there is real need for
better Ruby parsing tools, and he's [working on a few tools](https://github.com/ruby-syntax-tree)
himself.

My project wasn't just a vanity project! There's a chance it could be useful
to the Ruby community as a whole. That somehow gave me the motivation I needed
to get to work.

## Hard Work

So, for the next six months, I worked on the parser every day. Before work, I
would get my coffee, sit with my dogs, and hack on the parser for an hour or so.

![dogs and a laptop](/images/dogs_laptop.jpg)

It was soothing actually. Knowing I only had about an hour that day to get a
feature working, or a bug fixed, or maybe just a test written, was freeing. I
didn't have to finish the _project_ -- I just had to make some sort of progress.

Timeboxing works! (As it turns out.)

And so I did, little-by-little, make progress. Just a few days ago, after I gave
myself permission to cut a bit of scope, I got the last of my unit tests passing
and [I shipped a release](https://github.com/natalie-lang/natalie_parser/releases/tag/v1.0.0).

## Where does it go from here?

That's the whole story, so far! I don't know where this project will go in the
long term. For now, the parser works for my needs -- it parses the Ruby for
[our Ruby compiler](https://github.com/natalie-lang/natalie), and it does it
_fast_. It's good enough for our needs, so if the story ends here, that's fine!

If the story ends here, then I made a cool thing that I am proud of. Something
that does what it says on the tin, and does it well.

More than that, I completed something on my bucket list -- something that I had
long-ago decided was for rockstar programmers and academics who do a lot of
reading and studying (that's certainly not me) -- **I wrote a parser!**
For a real language!

I'm proud of myself. And I hope you find some inspiration to do that hard thing
you've been meaning to do, too!

Thanks for reading!
