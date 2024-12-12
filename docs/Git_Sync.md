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
git remote add robotrainer_github git@github.com:RoboTrainerAID/ati_force_torque.git

git push -u robotrainer_github

# check if default is correctly set
git branch -vv
```