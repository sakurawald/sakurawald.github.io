---
title: how to let chrome browser auto clean datas on exit
date: 2024-06-02 01:16:50
tags:
  - browser
  - privacy
  - chrome
  - google
  - web
---
# How to let chrome browser auto clean datas on exit

## Background

As we all know, the world's biggest ad provider `google` refuse to provide an easy way to auto clean browser history. We can still set our `custom policy` to enable the `hidden feature` in `chrome browser`

## Steps

### Create our custom policy file
```
mkdir /etc/opt/chrome/policies/managed
cd /etc/opt/chrome/policies/managed
touch custom_policy.json
```

### Edit the policy file

```
{
"ClearBrowsingDataOnExitList": [
 "browsing_history",
 "download_history",
 "cookies_and_other_site_data",
 "cached_images_and_files",
 "password_signin",
 "autofill",
 "site_settings",
 "hosted_app_data"
]
}
```

### Test the policy file

Open chrome browser and enter `chrome://policy`

## Reference

1. https://www.chromium.org/administrators/linux-quick-start/
