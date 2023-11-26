/usr/share/sddm/scripts/Xsetup

```bash
#!/bin/sh
intern=eDP-1-1
extern=DP-0

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi
```

