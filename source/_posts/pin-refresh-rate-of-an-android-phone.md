---
title: pin refresh rate of an android phone
date: 2024-04-09 19:19:12
tags:
  - "#android"
  - "#emulator"
  - root
---
# Pin refresh rate of an android phone

## Steps

1. Download the "SetEdit" app
2. Insert the following options

```
"min_refresh_rate" = "120.0"
"peak_refresh_rate" = "120.0"
```

>You can modify the options using "adb" without `SetEdit` apk

> The debug refresh rate still shows "60fps", but the real refresh rate is 120 now.