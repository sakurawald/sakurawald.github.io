---
title: rescue a corrupted system after forced shutdown during system upgrade
date: 2024-03-14 04:08:14
tags:
  - linux
  - os
  - solution
---
# Rescue the system from forced shutdown

## Cause

While running the command `pacman -Syu`, I do some other works.
And the os is frozen. After reboot the computer, I failed to boot into the os.
Stuck in the boot screen with error msg "[Failed] failed to start d-bus message service"

## Observation

The boot screen shows the error msg "[Failed] failed to start d-bus message service", which says that the service `dbus-broker` service is broken. (Some problems with d-bus service)

I can't change to another terminal using `ctrl + alt + F3`. (The d-bus related problem)

The `plasma desktop` is broken and says some theme `.qml` files are missing, so i can't login into the dekstop. (It's like some of the `plasma` packages are corrupted)

If you use a arch-installer sticker, and mount the os, run `pacman -Syu` again, the output says there is nothing to update. However, if you try run `pacman -S <some package>` you will get many errors like `<some libraries> is empty` (It's like some libraries or packages is corrupted while upgrading)

In short, the method is to find what packages is corrupted and we manually reinstall all the corrupted packages.

## Solution

```
And since it makes me very angry to come to a forum looking for a solution to a problem and see that the thread ends with "Don't worry, I've already solved it" without any further information, here are the steps to follow (based on my notes), for future seekers of solutions to their problems:

1. Boot the computer with an ArchLinux ISO installed on a pendrive (Ventoy is a REALLY useful tool GOOD for this kind of thing)

TIP: To increase the terminal font size we will execute 'setfont ter-124b', and to configure the keyboard with our language we will execute 'loadkeys <country-code>'.

2. Check that we have internet available on the machine ('ip a addr')
3. We will mount the root partition of the computer in /mnt
4. Chroot to the previous mount point ('arch-chroot /mnt')
5. Once in chroot we will mount a memory stick to record different outputs of the executed commands ('fdisk -l' to know the drive of the memory stick)
6. Run the command provided by seth, removing '--root /mnt' and the grep part, redirecting the output along with 'stderror' output, to a file on the memory stick:

sudo LC_ALL=C pacman -Qkk >> <memory-stick-mount-point>/<file.txt> 2>&1

7. We will filter the previous file with 'awk' to find the lines that contain 'mtree', that is, those that contain the defective packages, and we will redirect it to another file on the pendrive that will later serve as reference for reinstalling the packages that fail, viewing it on any other computer/tablet/mobile into which we will plug the memory stick.

awk '/mtree/ {print}' <file.txt-from-step-6> > <file.txt>

8. We will unmount the memory stick and unplug it from the computer to plug it into another computer/tablet/mobile to view/control the packages to be reinstalled.
9. For each package to be reinstalled we will execute the following two commands:

1st. sudo pacman -S --dbonly <package>
2nd. sudo pacman -S <package>

IMPORTANT1: It is important to execute the two commands in the indicated order, because if we execute the 2nd one first, it will cause an error saying that certain files already exist, and the installation will stop.
IMPORTANT2: Although the 1st command also offers the possibility of installing the package, both commands DO NOT do the same thing. So it is important to execute both, and in the indicated order.
NOTE1: If throughout the process we see that pacman complains that some libraries in /usr/lib have size 0 (i.e.: they are empty), we should not worry since the libraries will be installed as we reinstall the packages.
NOTE2: If once all the packages have been reinstalled, in the last one we notice that Pacman is still complaining that some libraries with size 0 still exist, we will look at which application they belong to and we will reinstall said application to leave everything clean ( It has happened to me in particular with 3 Okular libraries, and this one did not appear in the list of defective packages).

10. Once all the defective packages have been reinstalled, we will do a full system update ('sudo pacman -Syu'), and once done we will run a system check again (steps 6 and 7) to verify that there are no more defective packages.
11. If everything is fine and we no longer have any defective packages, we will exit the chroot with 'exit', and once at the ArchISO prompt (1) we will unmount all the mount points (umount -a ), and (2) we will do a reboot.
12. If everything went well, the system will start as usual.

--- "Y COLORIN COLORADO ESTE CUENTO HA ACABADO ... FELIZMENTE" --

Last edited by JosepF (2024-03-09 14:41:27)
```

## Summary

1. Don't do other jobs while the system is upgrading. It's may increase the possibility whole os is frozen.
2. Always carry a rescue sticker if you are a linux user. 

## Reference

1. https://bbs.archlinux.org/viewtopic.php?id=293521
