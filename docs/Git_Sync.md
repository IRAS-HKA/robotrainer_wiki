## Push a repo to GitHub
- [[Network]]
```bash
"Error: Temporary failure in name resolution"
# DNS server not configured correctly. For temporary solution look at [[Network]]

# Add ssh key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/<name>

# Testing
ssh -T git@github.com

# push repo with ssh key
git push
```
## Change remote url to github
```bash
git remote add robotrainer_github git@github.com:RoboTrainerAID/<repo>.git

# git checkout -b robotrainer2
git checkout -b melodic

git push -u robotrainer_github

git tag -a stogl_phd -m "Original state after Denis Stogl PhD"
git push robotrainer_github tag stogl_phd

# check if default is correctly set
git branch -vv
```

## Original Stogl repos
- iirob_filters/melodic hat 11 remote changes die nicht gepullt wurden
	- created new branch melodic_robotrainer2 without those changes
- robotrainer_control/melodic hatte ein sehr großes file `robotrainer_controllers/typescript` das nicht gepusht werden konnte.
	- Ich musste es aus der git history entfernen, das hat eine Kopie von allen commits erzeugt
	- Original branch mit dem file ist nur lokal `refs/original/refs/heads/melodic`