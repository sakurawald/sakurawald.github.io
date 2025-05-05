---
title: fix-screen-brightness-too-low
date: 2025-05-05 14:29:43
tags:
 - hardware
 - laptop
 - monitor
 - linux
 - keyboard
---

# Fix screen brightness too low

## Background
My built-in monitor in laptop has a 400 nits max brightness, but it still looks very dark.


## Observation
I am using KDE desktop environment, the `fn + f5/f6` key means `XF86MonBrightnessUp` and `XF86MonBrightnessDown`.
When `XF86MonBrightness{Up/Down}` keys is received by the linux os, the KDE pops up a tip says the brightness of `Built-in Screen` is changed.
However, the physical brightness of my monitor changed nothing.

## Solution
The `xbacklight` says the value is only `48%`, I have to use `xbacklight = 100` to set the brightness to its max.

Edit `/etc/default/grub` to add `acpi_backlight=native` as `kernel parameter`.
Run `grub-mkconfig -o /boot/grub/grub.cfg` to re-generate a new grub configuration.
Run `lsmod | grep asus ` to check if `asus_nb_wmi` is loaded.
Reboot the laptop, and now `XF86MonBrightness{Up/Down}` should work.
