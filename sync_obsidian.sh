cd ~/code/robotrainer/robotrainer_wiki/ || cd /d/Andreas/Desktop/Code/robotrainer/robotrainer_wiki/
git add .
git commit -m "Syncing Obsidian vault"
git config pull.rebase false
git pull --no-edit
git push
exec bash;
