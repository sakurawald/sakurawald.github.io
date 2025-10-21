---
title: make persistent windows 11 usb sticker
date: 2024-04-21 01:00:32
tags:
  - wtg
  - boot
  - os
  - usb
---
# Make persistent windows 11 usb sticker

## Background

Sometimes, you just don't want to run windows as a `guest os` in your linux `host os`.
And you don't want to install windows inside your `internal disk`.
You may want to install the windows os inside your `usb sticker`, and boot it in any other hardware to use the hardware. (mostly the gpu hardware)

## Steps

### Download rufus

Download `rufus (4.4.2103)` and run it.

### Enable hdd support

In `rufus`, press `alt + f` to enable `hdd list`

### Burn windows installer into your sticker

For `UEFI` bios, you need to select `partition scheme` as `gpt`
**and select `image option` as `windows to go`**

> If you just use `dd` command, then you are making a sticker for `windows installer sticker` purpose.
> You need to select `windows to go` so that `refus` will create the `gpt partition` and `extract all windows files from windows iso`, then you just made a sticker for `windows to go (a persistent windows inside your sticker`
> In other words, `rufus` will detect the `iso file` as `windows installer iso` and then emulates the `windows install process` in your host os

