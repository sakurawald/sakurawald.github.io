---
title: launch tor browser without tor network
date: 2024-04-07 04:28:32
tags:
---
# Launch Tor Browser without Tor Network

## Steps

1. Goto the `tor browser` installed directory and run `./firefox -p` to start `firefox profile manager`
2. Create `a new profile` named `unsafe`
3. Use `./firefox -P unsafe` to launch `tor browser` with `unsafe` profile.
4. Goto `about:config` and set the following options
```
user_pref("extensions.torlauncher.start_tor", false);
user_pref("network.dns.disabled", false);
user_pref("network.proxy.type", 0);
```

## References

1. https://gitlab.torproject.org/tpo/applications/tor-browser/-/issues/40160
2. https://forums.whonix.org/t/tor-browser-10-without-tor/10313/6