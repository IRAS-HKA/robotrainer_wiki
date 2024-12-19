## (Setup) Create new SSH key to push to Github
1. Generate a new SSH key on the RoboTrainer
	- Comment has to be: <YOUR_GITHUB_EMAIL>
	- Filename hast to be: <YOUR_GITHUB_NAME>
	- Set a passphrase so that other persons who work with RoboTrainer can not use it (accidentally).
	```bash
	ssh-keygen -t ed25519 -C "<YOUR_GITHUB_EMAIL>" -f ~/.ssh/<YOUR_GITHUB_NAME>
	```
2. Change to your new git user with the shortcut: 
	```bash
	rt2_git_change_user <YOUR_GITHUB_NAME>
	```
3. Add key to your github account [instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
4. Test login with:
	```bash
	ssh -T git@github.com
	```
## Push a repo to GitHub
```bash
# Change git user with script
rt2_git_change_user <YOUR_GITHUB_NAME>

# push repo with ssh key
cd <REPO>
git push
```

## Possible Errors
- How to solve DNS error: [[Network]]
```bash
"Error: Temporary failure in name resolution"
# -> DNS server not configured correctly. For temporary solution look at [[Network]]

git@github.com: Permission denied (publickey).
# -> Wrong SSH key
```
## Change remote url to github
```bash
git remote add robotrainer_github git@github.com:RoboTrainerAID/<repo>.git

# git checkout -b robotrainer2
git checkout -b melodic

# --set-upstream
git push -u robotrainer_github melodic

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
- ros_opcua_communication/kinteic-devel hat 7 remote changes die nicht gepullt wurden
	- created new branch melodic without those changes