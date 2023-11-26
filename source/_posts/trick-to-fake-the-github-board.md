---
title: trick-to-fake-the-github-board
date: 2023-11-26 22:16:53
tags:
  - github
  - shell
---
This script will fake the GitHub board from 1970-1-1 till now.

```sh
# painter.sh
for i in {1..19477}; do 
  j=$(date -d "1970-01-01 +$i days")
  touch "./bricks/$j"
  git add .
  git commit --date "$j" -m "save"
done
  git push
```