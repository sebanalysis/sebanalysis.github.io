If you want to make the  existing files the working directory and attach them to the remote without 

```
git clone --bare git@github.com:user/repo.git .git
git config core.bare false
git pull
```