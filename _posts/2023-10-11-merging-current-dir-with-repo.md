You may have a directory of existing files and you want to make them the current work tree of the HEAD commit of a GitHub repo. 

You may face this issue if you are syncing the directory with Obsidian Sync like me and you move to a new machine. I want to push the vault to a GitHub repo to host it on pages.  

So, I download the Obsidian Vault first, to get the most recent version and because git ignores some of the file paths I don't want to clone repo, then connect it to Obsidian, because it will push changes back, I want to make the Obsidian sync the current work tree.

Inside the Obsidian vault I do:

```
git clone --bare git@github.com:user/repo.git .git
git config core.bare false
git pull
```

