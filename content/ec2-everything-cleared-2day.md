---
date: 2011-03-18
layout: post
title: EC2 = Everything Cleared 2Day (FIXED)
tags: []
status: publish
type: post
published: true
meta: {}
---
<p><span style="border-collapse: collapse; font-family: arial, sans-serif; font-size: 13px;">I created a free micro instance on Amazon EC2 a few weeks ago. Today I remembered it and thought I would tinker around a little, only to find out that when I logged into AWS console, I had to "re-activate" my account using a phone number.&nbsp;<em>Hmmm, that's weird. I distinctly remember doing that two weeks ago.&nbsp;</em>So I jumped through the hoops and got logged in again to discover that my instance was gone, my security group was gone, and my elastic ip was gone. Gone. No trace whatsoever. </span></p><p /><div>This gives me the willies. Luckily, I wasn't yet using the EC2 instance when it just up and vanished, but I doubt that Amazon knew that. What's to make me believe it wouldn't happen again?</div><p /><div>I think I might stick with Rackspace for now.</div><p /><div><em>PS and yes, I am logged in with the right account -- I verified against the confirmation email I got when I signed up.</em></div><p /><div><strong>Update:&nbsp;</strong><span style="font-family: arial; font-size: small;">Ahhh... found the cause, and the solution! I posted on the Amazon support forum, and it turns out that it's possible to have what is called a "MASE" problem, which stands for "Multiple Account, Same Email." WTF!!</span></div><p><span style="font-family: arial; font-size: small;"> </span></p><div>Indeed, I logged out, used the SAME email address, but a different password, and was able to log in with my&nbsp;<em>other&nbsp;</em>account and see my running instance.</div><p /><div>OK, Amazon that isn't so bad I guess. Except, it's weird. And how in the world did I get another account?</div><p>&nbsp;</p><p>&nbsp;</p>
