---
title: "how to fix corrupted packages in archlinux"
date: 2024-07-12 00:22:17
tags:
  - linux
---

# How to fix corrupted packages in archlinux

## Problem
If you machine is force shutdown during the process of `pacman -Syu`, it's possible the packages are in partial update state.
To fix this problem, we need to do:
1. Find out how bad it is. (How many packages are corrupted)
2. Re-install these corrupted packages.

## Solution

### Setup the living-os
Insert your living-os sticker (You can make this sticker folloing the arch wiki).

Step:
- Mount the `root partition` of your `host os` into `/mnt`
- Connect to the Internet using `iwctl`.

### Check the corrupted package list
Let's say your `pacman` in the `host os` is corrupted, so that you need to use the `pacman` inside `living os`.
The command looks like `pacman --root /mnt ...`.

To get the corrupted packages list in the host-os, issue
```
sudo LC_ALL=C pacman --root /mnt -Qkk >> list_packages.txt 2>&1
awk '/mtree/ {print}' ./list_packages.txt > filter_packages.txt
awk -F ':' '{print $1}' ./filter_packages.txt > collect_packages.txt
grep -v "error" collect_packages.txt > packages.txt
```

And all the corrupted packages are in `packages.txt`

### Fix the `pacman` inside `host-os`
First, we need to update the keyring inside `living os` using `pacman -Sy archlinux-keyring` to resolve the outdated gpg keys.
Then, you can use `pacman --root /mnt -S $(< packages.txt)` to re-install all the corrupted packages.

> If you need to modify mirrorlist, then you should modify the mirrorlist in `living os`, and use `pacman -Syy` to update databse.

### Chroot into the host-os and do a fully-package upgrade again

You need to chroot into the host-os using `arch-chroot /mnt`
And issue `pacman -Syu` to upgrade all packages.
If pacman says "there is nothing to do", then it done.

### Fix the bootloader
To fix the bootloader
```
mount /dev/<root_partition> /mnt
mount /dev/<EFI_system_partition> /mnt/boot
arch-chroot /mnt
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
pacman -S linux
```






