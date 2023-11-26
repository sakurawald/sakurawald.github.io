echo "Saving current theme..."
cd ./themes/hexo-theme-toxic
git add . && git commit -m "save" && git push origin HEAD:remix

echo "Saving current blog..."
cd ../..
git add . && git commit -m "save" && git push
