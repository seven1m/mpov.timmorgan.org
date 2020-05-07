---
layout: post
title: "Using a Raspberry Pi as a Planning Center Check-Ins Printer Station"
date: 2020-05-07 16:20:30 -0500
tags:
- raspberrypi
- linux
- planningcenter
- church
categories:
---

![Dymo printer next to iPad running Planning Center Check-Ins](/images/ipad_and_printer.jpg)

## First, some background

My church uses [Planning Center Check-Ins](https://www.planningcenter.com/check-ins) to track attendance for churchgoers, and to help with security with little ones going to kids areas. It's a great product. **Yay!**

Check-Ins runs on iOS, Android, macOS, and Windows machines. **Yay!**

[Dymo label printers](https://www.dymo.com/en-US/dymo-labeling-needs/mailing-shipping-labeling/mailing-shipping-labeling/labelwriter-450-label-printer) are cheap and plentiful. **Yay!**

Check-Ins can print to a Dymo printer from macOS or Windows, but not from a tablet. **Boo!**

## The problem

We want to print to Dymo printers, which are inexpensive, from an iPad.

## Existing solution

![Diagram of an iPad printing through a laptop to a Dymo printer](/images/ipad_macos_dymo.png)

You can connect a Dymo printer to a Windows or macOS computer and use the "Print Station" option.

<img alt="Print Station option with &quot;Steve's Mac&quot; selected" src="/images/print_to_steves_mac.png" style="height:150px">

That works great, but I'd rather not have the expense of an extra computer nor the burden maintaining it.

## Better solution

![Diagram of an iPad printing through a Raspberry Pi to a Dymo printer](/images/ipad_rpi_dymo.png)

It'd be really cool if we could use a Raspberry Pi as that in-between computer instead of a full laptop or desktop. And that's what I figured out!

![Dymo printer next to a Raspberry Pi computer and an iPad running Planning Center Check-Ins](/images/ipad_and_pi_and_printer.jpg)

## How it works

I installed Raspbian Linux on my Raspberry Pi 4 with VNC Viewer and a virtual console. That means that when the Pi boots up, there is a virtual desktop created, even though you cannot see it unless you plug in a monitor.

CUPS is installed with the proper Dymo driver, so it's a matter of plugging in the Dymo printer and adding it in either the web UI or on the command line.

I also installed Planning Center Check-Ins on Linux. This is possible because the app is an [Electron](https://www.electronjs.org/) application that can be compiled for multiple platforms.

## The lag problem (and solution)

Everything mostly worked at this point, but there was a major lag in between printing labels. The first label would print within a second or two, which is acceptable. However, any subsequent labels would be delayed by up to 10 seconds!

I spent a full day trying to track down the issue inside CUPS, changing the printer to print in different modes, trying different drivers, etc.

Finally I resorted to a hack, which works beautifully. [This script](https://github.com/seven1m/rpi-check-in-printer/blob/master/dymo_lag_fix.rb) runs on startup and constantly monitors running processes. When it determines that a label was printed, but the `usb://` process that printed it still laying around, it `kill -9` the process.

This is ugly, but it really works. I don't know if this is a bug in CUPS, or a bug in USB, but I suspect it's a bug in Dymo. In any case, someone much smarter than I could probably find the actual cause of the lag. In the meantime, my hacky script will keep on running, killing the stuck process as needed.

## Instructions

The whole thing is [documented on GitHub](https://github.com/seven1m/rpi-check-in-printer), along with a video walk-through:

[![YouTube Video walk-through](/images/rpi_printer_video_tn.jpg)](https://www.youtube.com/watch?v=sH3Qwt0vvbc&feature=youtu.be)

If you are a tech at your church and you'd like to use this solution, please reach out. I would be encouraged to hear if any other churches find it useful!
