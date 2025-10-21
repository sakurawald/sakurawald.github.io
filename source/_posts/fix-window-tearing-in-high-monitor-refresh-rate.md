---
title: fix-window-tearing-in-high-monitor-refresh-rate
date: 2025-05-09 21:18:55
tags:
 - hadrware
 - monitor
 - laptop
 - nvidia
 - gpu
 - linux
 - driver
 - kde

---

# Fix window tearing in high monitor refresh rate.

# Observation
When I setting my monitor refresh rate to `160Hz`, the window rendering will flick, at the bottom-left area.
It works normally if the refresh rate is `144Hz` or `120Hz`.

# Solution
In `nvidia-settings`, Enable `Force Composition Pipeline` in `X Server Display Configuration` - `Advanced` Page.
