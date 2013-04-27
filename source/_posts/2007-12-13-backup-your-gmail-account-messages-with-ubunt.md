---
layout: post
title: Backup Your Gmail Account Messages With Ubuntu and Fetchmail
tags: []
status: publish
type: post
published: true
meta: {}
---

Long title, I know. Here's how I did it...

```
sudo apt-get install fetchmail postfix
cd ~
vim .fetchmailrc
```

Add the following to the file (replacing everything in CAPS appropriately):

```
poll pop.gmail.com with proto POP3 and options no dns
  user 'YOUR_GMAIL_ADDRESS' there with password 'YOUR_PASSWORD' is 'YOUR_UBUNTU_USERNAME' here
    options ssl
```

Now:

```
chmod 710 .fetchmailrc
sudo vim /etc/crontab
```

Add the following to your crontab file:

```
10 7 * * 1 YOUR_UBUNTU_USERNAME fetchmail -k
```

This will run fetchmail every Sunday and grab your email. It seems either fetchmail or gmail limits each connect to something around 400-500 messages, so to get started, you can run `fetchmail -k` a few dozen times to download all your mail, then let crontab do the rest on a weekly basis.

Your mail is downloaded to a single mbox file in `/var/spool/mail/YOUR_UBUNTU_USERNAME`. Being a single file makes it nice for backing up, moving, etc. I hear Thunderbird can easily read the file, and I think Apple's Mail.app can as well.

Just makes you feel good having all your mail backed up, now doesn't it?
