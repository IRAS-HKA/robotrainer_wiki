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