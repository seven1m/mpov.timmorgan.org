---
layout: post
title: "Dealing with the Hype Cycle in my forties"
date: 2026-06-04 18:45:00 -0500
tags:
- ai
---

![hype cycle](/images/hype_cycle.png)

Working in technology in your mid forties feels scary.
This is an account mostly for myself, as a diary entry.

## Early to Mid 2025: Feeling Behind

2025 was a weird year for most coders. I felt it somewhat at my day job, but more so
in my personal open source work. That's where my identity as a coder really lives, for
whatever reason. It's the stuff I do when no one needs me to do it.

I had been working on [my Ruby compiler](https://natalie-lang.org) for 5+ years, and
all of a sudden, it looked like the world was about to explode with better and more
software thanks to AI.

It's hard to put into words, but my work felt redundant, or I felt redundant maybe.
I don't think it was even logical -- it was just self-inflicted FUD.

X was full of people saying "this changes everything" and "the sky is falling" and
I just... breathed it all in. I felt left _behind_. Coworkers were talking about
_this model_ and _that model_, this and that _coding harness_, and something about
_context windows_ and _effort level_ and _tokens_.

Meanwhile I hadn't gone beyond Copilot autocomplete in my editor. As a 44-year-old
programmer, I had a moment where I thought _This is it. This is the spot where the
young kids overtake me. This is my COBOL moment.[^1]_

**How did I lose the plot so quickly?** I panicked.

I started using Claude Code at work, naturally, because they pay me to ship features
and fix bugs -- stuff with real customer impact -- not to type code on a keyboard.

But I took a break from the Ruby compiler project because I couldn't figure out
how AI could fit into open source. _Like, am I really going to pay Anthropic or
OpenAI to write code for me, for a project I do for fun?_

## Late 2025: Facing My Fears with RagChew

[My employer](https://www.planningcenter.com/) provides a one-month sabbatical every
5 years, and mine happened to be due in late 2025, so I took the time off and faced my
fears. _If this technology is going to be the death of the dinosaur programmer, then
I might as well understand it and consciously choose my fate._ Rather than let it
pass over me, I decided to face it head on.

That month, in addition to getting outside more and going on walks, I worked on
[my ham radio website](https://ragchew.site) using Claude Code. It's an app I enjoy
building, but it's just a useful tool and not something I have high engineering
standards for. It's fine if it's a little messy, as long as it works. Felt like a
good candidate for AI.

And, it was ok. Claude definitely took some shortcuts and made mistakes, but I learned
to recognize those and correct it. I won't get too into this because my story
learning to use AI is not unlike many others. But I was able to add several new
features that I wouldn't have tackled on my own.

**I didn't hate it.** It was different and weird, but it felt productive. And, most
important, the hype FUD I felt earlier started to dissipate. By the end of that month,
I went back to work seeing at as a _tool_ instead of the harbinger of doom.

## 2026: Embracing the Vibe with Cora

That year was a roller coaster! I came to terms with using AI at work (they pay me
to do ship stuff) and even using AI for side projects (for tools I just want to work
and not spend a lot of time on).

But that still left my passion project: Natalie. I just couldn't decide if I should
use AI, write code by hand, or do some hybrid. _How do you do remain a craftsman in
this new world?_

...

So I did something insane: I swung the pendulum all the way to the other side and
decided to build a new Ruby interpreter fully with AI. Embrace the slop. Write
practically zero code myself.

I was hesitant to introduce AI slop into my 5-year passion project, so I'd build
[a new project](https://github.com/seven1m/cora) where it didn't matter.

Guess what happened? **I still had fun.** But it was a different kind of fun.

I just leaned into the absurdity of _vibe coding_. Code nothing. Tell the AI to
do everything.

But I found even with this mentality I couldn't fully turn off my engineering
brain. I still reviewed the architecture. I still refactored messy parts. I
rejected working features that would make future changes harder.

**This was the most suprising part.** I thought that becoming a vibe coder
would make me lazy. And maybe it did a little, but not to the extent that I
feared. I still care about architecture! It's possible to use AI to write code
and still care about that code.

I'll write about Cora soon on this blog. Briefly, as of today Cora is messier
than Natalie in terms of code quality and architecture, but it also outperforms
and is a more complete Ruby implementation than Natalie. Take that for what you
will.

It's an experiment, and I don't care if it ever succeeds at anything. The
Cora project helped me learn about:

1. Frontier models like GPT-5.4 and Opus 4.7
2. Open weights models like GLM, MiniMax, and DeepSeek.
3. Ralph Wiggum loops

I most important, I came to a conclusion...

## Lessons

I think the conclusion of this story is that I'm personally ready to use AI in my
open source work. I've used it at work when people pay me to get crap done,
I've used it on the personal tools where code quality was less of a concern,
and I've even taken on the personality of a vibe coder. And now I know where
I fit in.

I'll use AI where it makes sense, and I'll type out the rest.
I'll be cautiously introducing some AI coding into my 5-year passion project,
and I won't feel like I'm betraying who I am.

I'm still a coder.


[^1]: [COBOL](https://en.wikipedia.org/wiki/COBOL) is a programming still used in
banks and airlines, but I've always seen it and its programmers as a dying breed.
