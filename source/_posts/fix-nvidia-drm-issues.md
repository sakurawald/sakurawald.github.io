---
title: fix-nvidia-drm-issues
date: 2025-05-07 21:48:59
tags:
 - hardware 
 - monitor
 - laptop
 - drm
 - linux
 - nvidia
 - x11
 - kde
---

# Fix nvidia drm issues

## Observation

I have two external monitors, the first one is a 2.5k Samsung monitor, and athe second one is a Asus monitor.

If I use the built-in monitor in laptop, everything works perfect.
If I connect my laptop to an external monitor, strange things happens:
- In KDE, if the `global scale` is `100%`, then qt widgets renders normally.
- In KDE, if the `global scale` is `150%` or `200%`, then qt widgets renders corruptly until a re-paint.
- For both Samsung monitor and Asus monitor, the external monitor screen becomes black, only with a movable mouse cursor. (The desktop environment is running normally, but renders black with only a mouse cursor)
- For both Samsung monitor and Asus monitor, awake from a sleep makes the external screen becomes black.
- For both Samsung monitor and Asus monitor, there is a possibility to `reboot` into black screen in external monitor (The desktop environment is running normally, but renders black with only a mouse cursor).
- Only for the Asus monitor, move the windows will cause a compisition flickers on top-left of the moved window, and you can see the things below the moved window.
- In `Tray Panel`, the `Plasma Renderer` says `Software rendering in use`.

## Solution
Add `nvidia_drm.fbdev=1` into your kernel parameters, to let `KWin` runs with `hardware rendering` mode.


