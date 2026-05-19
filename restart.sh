if [ -d ".git" ]; then
    echo "Error: .git folder detected in the current directory. Halting execution."
    exit 1
fi

git init
git remote add origin git@github.com:sakurawald/sakurawald.github.io.git
git add .
git commit -m "start point"
git push -u origin master --force
