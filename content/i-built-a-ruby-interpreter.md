---
layout: post
title: "I built a Ruby Interpreter"
date: 2026-06-04 19:25:00 -0500
tags:
- ai
- ruby
- interpreter
- jit
---

I love Ruby, but I don't understand how it works. And my biggest character flaw
is that I can't just read the source, I have to build my own.

You can see my previous posts on this subject:

- [I Built a Ruby Parser](https://mpov.timmorgan.org/i-built-a-ruby-parser)
- [I Built a Ruby Compiler](https://mpov.timmorgan.org/i-built-a-ruby-compiler)

_Ideally the interpreter would have been in between those two._

And before you get too far, here's some required background reading:
[justforfunnoreally.dev](https://justforfunnoreally.dev)

## Cora

So me and the clanker have been working on a new Ruby interpreter named
[Cora](https://github.com/seven1m/cora).

I talked about this in [my last post](/dealing-with-the-hype-cycle-in-my-forties),
but the short version is that I wanted to see how far I can push an LLM (several
different models, actually, more on that in a second) and how in-the-know I can
remain through the process.

I.e. is it possible to vibe code my way through a complex project and still be happy
with the architecture and understand the outcome...?

## Goals

- to get most or all of [ruby/spec](https://github.com/seven1m/cora) passing
- to run real ruby software
- to be reasonably fast enough to be usable
- to experiment with JIT compilation
- to experiment with gradual typing
- to make an architecture I can understand
- to experiment with different LLMs
- to only spend $20/month -ish on AI subscriptions

## Anti-Goals

- to control every line of code -- the LLM will do things differently than I would, and that's ok
- to be faster or better than MRI -- I just want something I can play with and use myself
- to make any sort of statement -- it's just my sandbox
- to fully delegate to AI
- to throw a bunch of money at the task
  [like Anthropic did](https://www.anthropic.com/engineering/building-c-compiler)

## Models

I'll try to keep this section short, but it's interesting to me and part of the story.

I started out using Claude Code's $20/month plan. Sonnet 4.5 and 4.6 I believe. Me and Claude worked
alright together, but I didn't like Claude's "personality" -- and it felt like it was making decisions
for me when I didn't ask it to.

I heard that OpenAI's $20 plan allowed more usage, so I gave it a try and really liked the GPT models.
GPT-5.3-Codex at first, then GPT-5.4 was the sweet spot. Codex and I knocked out a bunch of the
interpreter together, and it didn't do more than I asked or leap to conclusions.

For some of the less foundational work, I tried open weights and other Chinese models via
[OpenRouter](https://openrouter.ai) and [OpenCode Go](https://opencode.ai/go):

- MiniMax-M2.7
- GLM-5.1
- DeepSeek V4 Pro
- DeepSeek V4 Flash

The DeepSeek models are surprisingly good! They require more careful code review and hand-holding,
especially during debugging sessions, but I found that to actually be a **good thing** for my own 
understanding of how the code works.

I even made a [Ralph Wiggum loop](https://medium.com/@tentenco/what-is-ralph-loop-a-new-era-of-autonomous-coding-96a4bb3e2ac8)
to work on building out the standard library while I slept. The results of that were pretty mixed, and
I ended up going back and correcting some of that work that didn't land like I wanted. I'm not sure if
I'd do that again, honestly.

To summarize, I really let the [AI Psychosis](https://www.youtube.com/watch?v=cVUVfn8OF5k) set it,
like so many others. :-)

## Where Are We

Currently, Cora is passing about 10,000 ruby specs and can run some decently complex ruby software, like:

- rack
- sinatra
- webrick
- rake
- rubygems
- bundler

There is an experimental Just In Time compiler that I think is exciting. Cora embeds the
[Tiny C Compiler](https://www.bellard.org/tcc/) for the JIT backend, which I think is fun.
I haven't focused much on the JIT, but hope to play with it more in the coming months.

And down the road I want to experiment with some sort of gradual typing system. I just saw that
[Elixir now has gradual a type system](https://elixir-lang.org/blog/2026/06/03/elixir-v1-20-0-released/),
so maybe that's something to learn from.

## Quality

The quality is mixed.

Some of the code is better than I could have written myself. The textbook algorithmic stuff, the compiler,
the VM internals... I'm mature enough to admit I couldn't have written that.

But there are some sloppy bits too: duplicated code, different ways of doing the same thing, stuff that a
human simply wouldn't do because it requires extra work... the LLM doesn't hesitate to add code that we
already have in the project.

And some of the files are HUGE. This is partly due to Zig and partly because LLMs never struggle with
scrolling up and down a 10,000-line source file.

## What I Learned

I chose Zig because I wanted to learn how to write it, but if I'm honest, I haven't learned the syntax
as well as I would have if I were writing the code myself. I know what Zig is capable of, but if someone
asked me an interview question for Zig job, I don't think I'd get the job. This makes me wonder how new
students will learn programming in the future. I'm glad I'm not a teacher or college professor.

I miss debugging. This almost hurts to write, because I always thought of the hours-long or days-long
debugging sessions where I'm agonizing over a segfault, stepping through code, adding `printf`
statements, and running the same reproduction over and over, as agonizing. But the payoff when it finally
clicks and you find the bug... that is a real dopamine hit. And I miss it. And my understanding of
certain bugs and architectural flaws is more shallow now.

Lastly, I realized programming is no less fun -- it's still
[building castles in the air](https://softwarequotes.com/quote/the-programmer--like-the-poet--works-only-slightly).

## The Future

I now have two Ruby implementations that I both love. One has taken 5+ years of careful and
painstaking by-hand work. The other I vibe coded over 6 months.

I expect I'll keep working on both and see what happens.

If neither of them ever amount to anything useful by anyone but me, I'm totally ok with that. I've already
learned so much. Ruby is the best programming language, and learning about it has been the highlight of
my career. <3
