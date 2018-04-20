---
layout: post
title: "Dymo Printer Agent"
tags:
- ruby
- dymo
- printing
date: 2018-04-19 21:55:37 -0500
categories: 
---

Our church uses iPads and Dymo printers for children check-in. Parents check in their child, a label prints on the
printer, and they stick the label on the child's shirt. We use Planning Center Check-ins of course, and it's great!

One downside to Dymo printers, however, is that their software only runs on Mac and Windows, necessitating a full
computer connected to the printer. (There's no way that I know of to hook the Dymo printer directly to the iPad.)

I had the idea to use a Raspberry Pi as the computer instead of a full desktop machine. The setup looks something
like this:

```
iPad -[wireless network]-> Raspberry Pi -[usb]-> Dymo printer
```

Great idea! Unfortunately, the labels are sent as a string of XML to a small Dymo tray application which converts
them to PDFs. This Dymo tray application does not run on Linux. _Womp womp._

**This can't be too hard...** (Many weekends have been ruined by that short phrase.) We'll just write our own
XML-&gt;PDF conversion program in Ruby!

The result is: [dymo-printer-agent](https://github.com/seven1m/dymo-printer-agent)

This little application runs on Linux (in my case, a Raspberry Pi running Raspbian) and converts Dymo's label XML
format into PDF and sends it to the printer driver.

It works great!

So, if you're in the odd situation of wanting to print to a Dymo label printer on Linux, this project might be
useful to you! I've tried to include all the relevant gotchas and instructions in the readme, so check it out.

*Meta note: I dusted off the ol' blog to post about this project, because I'm no longer on Twitter. I'll talk about
that decision in another blog post.*
