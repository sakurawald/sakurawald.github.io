---
layout: grapheneos-review
title: grapheneos-review
date: 2023-12-21 12:14:00
tags:
  - android
  - security
  - mobile
  - linux
  - google
  - phone
---
# GrapheneOS Review
## Intro

GrapheneOS is the only mobile system that I still running on my mobile phone. Since nobody will believe Apple will take good care of your data, the only choice for mobile platform is AOSP.

The stock android contains some components from Google, like the system-app `Google Play Store` and the `AI Assistant`, which is powerful and controls the mobile phone.

GrapheneOS is a de-googled AOSP project and introduces many security features, makes the mobile phone a little more secure.

### Baseband: all baseband on mobile is bad
Currently, it's impossible to use a FOSS baseband on mobile phone, so if you care about this, just try running the os on emulator (which don't need a baseband os)

### Device: not all device are good device
Google pixel series is the only recommended device to get the latest secure patches and latest secure feature.
You don't need to buy the latest generation, keep about 1~2 generation behind is acceptable. (Each generation provides at least 5 years of security support)

Pixel allows you to do:
1. Unlock the bootloader without passing a quiz
2. Allow custom verified-boot
3. Allow the owner to install an alternate operating system
4. Always get the latest security patches


## Pros

1. Hardware-supported filesystem-based full-disk encrypt
	1. all the files and metadata is always stored encrypted, there is not any keys stored in the memory.
	2. The encryption are diverse for different user profile.