---
layout: post
title: "I Built a Ruby Compiler"
date: 2022-08-16 06:25:00 -0500
tags:
- ruby
- compiler
- c++
---

*Note: Please don't share this on Hacker News -- I don't need the grief from gatekeepers
telling me I don't know how to write a compiler. This is an account for myself and for
friends. /hugs*

I said in my previous post, [I Built a Ruby Parser](https://mpov.timmorgan.org/i-built-a-ruby-parser),
that I would write about my ongoing compiler project [Natalie](https://natalie-lang.org/),
but I *really* wanted to finish the compiler rewrite first. I'm proud to say the rewrite
is finished! (More about that in a bit.)

But first, a bit of a journey...

## No Idea What I'm Doing

You know [that meme](https://knowyourmeme.com/memes/i-have-no-idea-what-im-doing)
with the dog at the keyboard? Yeah, that was me. I was alone on an airplane with
some extra elbow room thanks to no center-seat passenger, and I found myself
wondering _What would it take to compile a language that resembles Ruby?_

Ruby is my favorite language, owing to it's syntax, flexibility, and lisp-like
qualities. How much of that just isn't possible with a Ruby compiler?

Those first two commits were pretty humble:
1. [a woefully inadequate parser](https://github.com/natalie-lang/natalie/commit/487d5784ec9b7cf09b0b25f7d123e5971ccaf0de)
2. [a code generator and a C template](https://github.com/natalie-lang/natalie/commit/a77cd947dab5c2182b452177da28d79b217e0755)

I honestly didn't think this experiment would go much of anywhere, but my
curiosity drove me forward, and I thought I would just work on it
for a few days more until I hit an immovable obstacle.

I *knew* there would be a brick wall lurking around any corner, and then I
could say "Ahhh, of course, *that's* why I shouldn't be doing this."

## But it was just so much fun!

And I did hit a few walls, but they weren't brick -- they were some other
material. Or I could go around them, or whatever. This metaphor is falling
apart. :-)

Anyway... the obstacles were really more like mini challenges, and
I just kept finding ways to overcome them. And with each breakthrough, that
[xbox achievement unlocked sound](https://www.youtube.com/watch?v=HkExBV05_EY)
played in my head.

**I was having fun!**

Programming, for me, is better than any triple-A video game.
Wielding a processor, which has been in development for many decades longer
than the longest-lived video game, is more immersive, more challenging, and
more rewarding!

[![me sitting in a hotel room talking about Natalie](/images/natalie_dec2019.jpg)](https://www.youtube.com/watch?v=tfZOnDpDVKw)

*Me sitting in a hotel room, excitedly talking about Natalie, circa 2019.*

I just kept going. I kept hacking in my spare time. I
[recorded some videos](https://www.youtube.com/playlist?list=PLWUx_XkUoGTq-nkbhnk6PN4m109ISo5BX).

- I learned how to [build a garbage collector](https://github.com/natalie-lang/natalie/commit/a8c30b356fde528e2ec8435b15a06553226600ce).
- I learned how to [build a parser](/i-built-a-ruby-parser).
- I learned how to [intern strings](https://www.youtube.com/watch?v=tK3pAxc1A6U).
- I learned how to [use smart pointers to reduce heap allocations](https://www.youtube.com/watch?v=FTA6_YAhnXk).
- I learned how to [self-host the compiler](https://github.com/natalie-lang/natalie/commit/8fa8c576133f5d66ce3fcb22dce64a9e43f16560).
- I learned how to [use a profiler](https://www.youtube.com/watch?v=3xhGxoPh6as).
- I learned how to [use Valgrind](https://www.youtube.com/watch?v=aQROCSukXsA).

...and so many more little things throughout. I even built
[my own data structures](https://github.com/seven1m/tm).

## A Note About Scaffolding

I want to jump in now, dear reader, and point out that not all those pieces
were strictly necessary to get a working compiler!

The compiler was working (for some definition of "working") within days of my
first commit, so it's not like I had to get parsing + string interning + GC +
self-hosting + yada yada all working at once.

No, I lean heavily on scaffolding. **I take whatever shortcuts I can** to get
something working. Seeing some valuable output right away gives a little
dopamine hit and gives me the energy to keep going.

For example, my first parser was absolute trash. I realized I didn't want to
spend precious time in the beginning on learning how to parse Ruby, so I built
on top of the excellent [ruby_parser](https://github.com/seattlerb/ruby_parser)
library.

I didn't know anything about garbage collection, so at first I
[integrated the Boehm garbage collector](https://www.youtube.com/watch?v=gthWRmT1qG4).
I didn't know how to implement a hashmap in C, so I used
[David Leeds' hashmap library](https://github.com/DavidLeeds/hashmap).

And there are lots of little tricks like that. **You just have to be a little lazy.**
Think of shortcuts to get where you want to go. Then, at some point down the road,
you (or maybe even someone else) can come back, remove the scaffolding, and
replace it with a beautiful pillar.

## The First Natalie Compiler

First, let me tell you how the first compiler worked. (I recently rewrote
the compiler, and I'll talk about how the new compiler works in the next section.)

On that plane back in 2019, without any training or experience, I just
tried to envision the shortest path from an Abstract Syntax Tree (AST) to C.
(Natalie was original written in C and later converted to C++.)

Starting with code like:

```ruby
x = 1 + 2
```

...which produces AST like this:

```ruby
s(:block,
 s(:lasgn,
  :x,
  s(:call,
   s(:lit, 1),
   :+,
   s(:lit, 2))))
```

...I squinted, and I thought I could see C/C++ in those S-expressions.
So the first compiler just incrementally massaged the AST until it looked like
the final output. So the compiler in one recursive pass over the AST, created
a new AST that looked like this:

```ruby
s(:block,
 s(:var_set,
  :env,
  s(:s, :x),
  s(:public_send,
   s(:"Value::integer", 1),
   s(:intern, :+),
   s(:args, s(:"Value::integer", 2)),
   "nullptr")))
```

Then in another pass, it produced this:

```ruby
s(:block,
 s(:var_alloc, 1),
 s(:declare, "x1", s(:nil)),
 s(:block,
  s(:var_set,
   "env",
   {:name=>"x", :index=>0, :var_num=>1},
   false,
   s(:public_send,
    s(:"Value::integer", 1),
    s(:intern, :+),
    s(:args, s(:"Value::integer", 2)),
    "nullptr"))))
```

And yet again, another pass produced:

```ruby
s(:block,
 s(:var_alloc, 1),
 s(:declare, "x1", s(:nil)),
 s(:block,
  s(:set,
   "x1",
   s(:public_send,
    s(:"Value::integer", 1),
    s(:intern, :+),
    s(:args, s(:"Value::integer", 2)),
    "nullptr"))))
```

And finally, it walked that AST and produced a big string of C++ (again, this was
originally C but later rewritten in C++) like this:


```c++
env->build_vars(1);
Value x1 = Value { NilObject::the() };
Value args2[1] = { Value::integer(2) };
Value call_result3 = Value::integer(1).public_send(env, symbols[0]/*:+*/, Args(1, args2), nullptr);
x1 = call_result3;
```

I know that's quite a few steps, and I knew that some of those compiler passes
could be condensed. But the point is it was easy to get started. It worked OK
as "Baby's First Compiler", so I went with it.

It worked pretty well, and it was fast enough, which is about all I cared about
in those proof-of-concept, "is this even a project I want to work on?" days.

But the weaknesses of this approach became apparent with time:

- Adding optimization passes that work on the AST is difficult.
- Compiler passes that manipulate AST are not easy to read.
- Diffing the AST given from different compiler passes is hard.
- And most importantly, the compiler would forever be a C++ generator.
  There was no hope for generating different backend code.

I [tried to make an interpreter VM](https://www.youtube.com/watch?v=px1AVr6nMWk)
that would walk the AST generated by the compiler, and instead of writing C++,
would interpret the instructions directly. **That was next-to-impossible.** Because
the compiler generated a final AST that closely resembled the C++ we were generating,
interpreting those instructions as Ruby just didn't work.

That's when I realized that the term I'd heard before could be a valuable
alternative: **Intermediate Representation.**

## The Second Natalie Compiler

So in January 2022 I started rewriting the compiler. It had to have:

- An [Intermediate Representation](https://en.wikipedia.org/wiki/Intermediate_representation)
- Multiple backends: a C++ backend and an Interpreter (VM) backend

I could take what I learned about compiling Ruby the first time, and of course
our existing runtime C++ library of code could be used largely unmodified.

With my goals in mind, I decided to target the interpreter... What instructions
would I want to iterate over, interpreting directly in Ruby? I settled on
a [stack machine](https://en.wikipedia.org/wiki/Stack_machine) VM, so my instructions
would push and pop from a stack.

And because I wanted a C++ backend as well, that meant those same instructions
had to be able to generate C++.

There was a lot of trial-and-error during those first months. I pushed myself
to build the interpreter VM and the C++ backend **at the same time**, so that I
could be sure that the IR I was inventing didn't carry along any assumptions about
what the backend might be.

I could tell pretty early on this was going to be a massive improvement!

So here's how the new compiler works:

1.  The first compiler pass takes AST that looks like this:

    ```ruby
    s(:block,
     s(:call,
      s(:lit, 1),
      :+,
      s(:lit, 2)))
    ```
    
    ...and produces a flat array of IR instructions like this:
    
    ```sh
    [
      #<Natalie::Compiler::VariableDeclareInstruction ...>,
      #<Natalie::Compiler::PushIntInstruction ...>,
      #<Natalie::Compiler::PushArgcInstruction ...>,
      #<Natalie::Compiler::PushIntInstruction ...>,
      #<Natalie::Compiler::SendInstruction ...>,
      #<Natalie::Compiler::VariableSetInstruction ...>
    ]
    ```
    
    When we debug the IR, we print it like this:
    
    ```sh
    0 variable_declare x
    1 push_int 2
    2 push_argc 1
    3 push_int 1
    4 send :+
    5 variable_set x
    ```

1.  Compiler pass 2 walks the IR to determine variable scope:

    ```sh
    == SCOPE vars=[x (mine)] ==
    0 variable_declare x
    1 push_int 2
    2 push_argc 1
    3 push_int 1
    4 send :+
    5 variable_set x
    ```

1.  Pass 3 and 4 manipulate the IR further to handle Ruby's `break` and `return` semantics.
    In this example, nothing changes in the IR, so I won't paste the same thing again here.

1.  Finally, depending on the backend chosen, we either walk those instructions with the VM
    and interpret them directly, or if we are generating C++, we "interpret" the instructions
    as C++:
    
    ```c++
    Value x_var = NilObject::the();
    auto send_1 = Value::integer(1).public_send(env, symbols[0]/*:+*/, Args({ Value::integer(2) }, false), nullptr);
    x_var = send_1;
    ```

### Converting IR to C++

I think it's fun to talk about how we convert IR to C++, so here is how that works. Let's step
over the IR line-by-line and see what happens. I'll use `<== HERE` so you know where we are:

```sh
0 variable_declare x   <== HERE
1 push_int 2
2 push_argc 1
3 push_int 1
4 send :+
5 variable_set x
```

This first (zeroth) instruction sets up a variable as nil. For reasons I'd rather not go into,
we have to ensure a certain edge case doesn't result in improper variable scoping. I would
love to optimize this instruction out when we know that edge case isn't present. Anyway, that
instruction generates very simple C++:

```c++
Value x_var = NilObject::the();
```

Next:

```sh
0 variable_declare x
1 push_int 2           <== HERE
2 push_argc 1
3 push_int 1
4 send :+
5 variable_set x
```

This is where the stack comes into play. Prior to this instruction, the stack is empty.
But after this instruction, the stack, which is just a Ruby array, looks like this:

```ruby
[
  "Value::integer(2)"
]
```


Let's keep going:

```sh
0 variable_declare x
1 push_int 2
2 push_argc 1          <== HERE
3 push_int 1
4 send :+
5 variable_set x
```

This is very much like `push_int`, but it just pushes a plain Ruby integer
onto the stack. I have ideas for removing the need for this instruction entirely,
but for now, this is what it adds:

```ruby
[
  "Value::integer(2)",
  1
]
```

Moving right along:

```sh
0 variable_declare x
1 push_int 2
2 push_argc 1
3 push_int 1           <== HERE
4 send :+
5 variable_set x
```

OK, same story, push an integer onto the stack:

```ruby
[
  "Value::integer(2)",
  1,
  "Value::integer(1)",
]
```

Next:

```sh
0 variable_declare x
1 push_int 2
2 push_argc 1
3 push_int 1
4 send :+              <== HERE
5 variable_set x
```

This is where it gets interesting! We need to pop some things off the stack and
put it together for some new C++ code. So the steps taken for `send` are:

1. Pop the "receiver" -- the object that is being "sent" the message
   (basically Ruby, Smalltalk parlance for calling a method.)
1. Pop the argument count, which in this case is `1`.
1. Pop each argument (just 1 here).
1. Generate the send call!

Those steps produce some more C++ for the final output:

```c++
auto send_1 = Value::integer(1).public_send(env, symbols[0]/*:+*/, Args({ Value::integer(2) }, false), nullptr);
```

...and we push the result of this onto the stack. The fun part, and the part that
gets me so excited about this approach, is that the "result" here is **not** the actual result
of calling the method. No, we're still at compilation time here. The "result" is just a
C++ variable called `send_1`. So we push that variable name onto the stack. Remember,
everything else has already been popped off, leaving us with:

```sh
[
  "send_1"
]
```

And now we're at the last instruction:

```sh
0 variable_declare x
1 push_int 2
2 push_argc 1
3 push_int 1
4 send :+
5 variable_set x       <== HERE
```

This instruction pops the last result off the stack and generates C++:

```sh
x_var = send_1;
```

And that's it! I think that is the coolest thing I've ever built. It gives
me so much joy to see that in action! <3

Yes, there are some inefficiencies there, such as setting the variable to
`nil` before we set it for real. And we shouldn't have to set `send_1`
and then turn around and assign that to `x_var`. But these are all things
we can continue to work on. (Remember, "scaffolding".)

----

The new compiler was, after 8 months of spare-time work, finally able to
pass all the same tests that our original compiler could.
[So it replaced the old compiler.](https://github.com/natalie-lang/natalie/pull/582)
And there was much rejoicing!

The new compiler is easier to debug and produces leaner (faster) C++ code.
I made a video about it!

![video about the new compiler](/images/compiler2_thumb.png)


## The Future

Natalie's not "done" yet--there's still lots to do in the standard library
and little edge cases in the compiler. There are tons of optimizations we
can do in the compiler and the runtime, too. And I would love to get to a
fully self-hosted state, where end-users don't need an existing Ruby on
their system to run Natalie. **I will just keep chipping away at it!**

![a walkway lined with pillars, extending into the distance](/images/asbury.jpg)

This post is long enough, though, so I will end here for now. But I will
add a little note about the future in general...

People drop in [our Discord](https://discord.gg/hnHp2tdQyn) server fairly
regularly to ask something like "What is the point of this project?"
Usually it's in a nicer tone than that, but that's the gist of the
question. They want to know why the world needs another Ruby implementation,
why I (and other friends) would spend time on what could arguably be
called a novelty. And I think they want to know if it's a "real" project.

I used to struggle with this question. I felt the obligation to justify
the existence of Natalie. I thought that I had to explain to them why
I'm spending my spare time on a project that could quite possibly never
affect the world and never make money.

But I made some good friends on the internet who have taught me that
"Just for fun. No, really." is a totally valid answer to such questions.
Some people don't "get" that answer, and that's OK. In fact, I get so many
"huh?"s that I made a website for it: [justforfunnoreally.dev](https://justforfunnoreally.dev)

There's tremendous freeing power in those words. Try it! See if you
can build something so off-the-wall, or difficult, or "useless" that
someone asks you "But why?" Then answer with "Just for fun!" and see
how it feels.

Who knows, maybe you'll end up somewhere cool in the end, even though
your aim wasn't respected by confused onlookers.

As my friend Andreas Kling [once said](https://twitter.com/awesomekling/status/1544026282161307648):

>Never underestimate the power of a bunch of nerds building something just for fun.

----

❤️ Thanks for reading!
