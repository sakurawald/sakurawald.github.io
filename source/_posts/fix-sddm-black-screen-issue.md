---
title: "Fix sddm black screen issue"
date: 2025-04-30 20:35:31
tags: 
 - os
 - hardware
 - linux
 - laptop
---
 
 # Fix sddm black screen issue

## Background
After packages update, use `poweroff` to shutdown the machine normally.
Change the memory stickers and disk stickers of the machine, and reboot the machine.
The `sddm` screen is black.

## Observation

When power on, my laptop boots into the operating system, and running `/usr/lib/Xorg` in `tty2`.
The screen is black, with an underline on left-top, not blinking.
I can switch to `tty1` and `tty3` using `ctrl + alt + f1/f3`.
I can login into `tty3` as `root` user, and issue commands.
In `tty3`, I can see only `/usr/bin/Xorg` and `/usr/bin/sddm-greater` is running.
Using `journalctl -b | grep sddm`, the `sddm-greater` says it fails it fails to authticate with `pam`. (Though this is not the real reason, the failure of `graphics` cause the faillure of `pam`)
The network and bluetooth works in `tty3`.

## Attempts
- Try to update the packages using `pacman -Syu`.
- Try to re-install `pam`, `pambase` and `sddm`.
- Try to modify the nvidia parameters for kernel.

## Solution
Boot into `bios` and toggle the `graphics settings` to only use `discrete GPU`. (It looks like there is some bugs in ASUS hardware. In hybrid mode, the GPU switch is controlled by the power and the phase of booting.)
Don't use `nvidia-settings` to generate the Xorg configuration file, just delete the `/etc/X11/xorg.conf` file.
