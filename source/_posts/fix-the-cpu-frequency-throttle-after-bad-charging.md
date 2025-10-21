---
title: "fix the cpu frequency throttle after bad charging"
date: 2024-09-25 14:35:21
tags: 
  - cpu
  - linux
  - hardware
---

# Fix the cpu frequency throttle after bad charging

## Observation

My cpu frequency is locked to 400mhz for all cores, even the cpu governor is set to `performance` policy.
The `power profile` in x11 is also set to `performance`.
Before this happens, I just charge my laptop via a `bad power supply` (which shows `not in charging`, the power supply is just enough to keep the balance.), and the `battery` is low.

I try to disable the `powersave management` in bios, and reboot the laptop, the problems remains the same.

It seems like its a hardware bug about the `power adapter`, when the `ac` is plug-in, the hardware will notify the cpu clock and sets its policy to `performance` policy in hardware-level, and if the `ac` is plug-out, sets to `powersave` policy.

The key point is that, after a `bad power supply`, the hardware detects something wrong, it thinks the `power adapter` is always off, and writes this data into the hardware storage, so there is nothing to do with the software-level.

## Solution
Keep pressing the `power button`, and reset the `bios`. (This also resets all the data stored in the hardware-level.)
