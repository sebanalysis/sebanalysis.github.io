---
layoutposts
title: Git Commands
permalink: code/git-commands
categories: Code
---

My personal command reference.

command | purpose
-|-
`cd` to repo root<br>`git lfs install`<br>`git lfs track <path>/*large*`<br>`git add .gitattributes`<br> | add to git large file/ folder storage. Note, the `*large*` part is not part of the path. For storing large files (>100MB)
`esc` `q!` `enter` | quit vi editor in git log or git commit
`git add -all` | Stage all changes:
`git add \*.inp` |Stages certain input file changes:
`git branch ...` | Create a new branch ...:
`git branch` | See current branch in list of all branches:
`git branch -a` | Or to also see 'all', including remotes too:
`git branch -a -vv` | BRANCH See current branch and remote branches and which associate which track which (very verbose):
`git branch --delete ...` | delete a local branch
`git branch -m <old> <new>`<br>`git push origin -u <new_name>`<br>`git push origin --delete <origin/old>`| [rename a branch 1st rename locally. 2nd push new branch. 3rd delete old branch. have to literally create a new branch.](https://stackoverflow.com/questions/30590083/how-do-i-rename-both-a-git-local-and-remote-branch-name)
`git -C <Path to directory> pull` | Pull only a given directory
`git checkout -b newlocalbranchname origin/branch-name`<br>`git checkout -t origin/branch-name` | checkout a remote branch|
`git cherry-pick … … …` | add particular commits `… … …` to the current branch
`git clean -f -d`  | delete the untracked files and directories (-r)
`git clean -n -r` | shows untracked files and directories (-r)
`git clone --bare …` <br> `git worktree add branchname` | add a worktree branch
`git clone --branch <branchname> <remote-repo-url>` |Clone a specific branch of a repo:
`git config --global core.autocrlf false` |  git by default replaces all \n with \r\n need to deactivate if working across systems:
`git config --global core.editor "notepad"`| Reconfigure the commit editor software:
`git config --global user.name example`<br> `git config --global user.email example@example.com | Add your user details to be shown on all the commits.
`git diff`  | See differences with last commit
`git fetch`<br>`git branch` copy name<br> `git checkout --track origin/feature/strategy-pattern-refactor` |  get a local version of a remote branch
`git fetch <URL>`or <br> `git fetch <shortname>` | Fetch the specific branch (needs shortname or URL or origin) The actual name of the repo isn't sufficient:
`git grep "…` | search within all files for `…`
`git help ...` or<br>`git ... --help` | help on verb
`git init` | Initialise An Empty Git Repository:
`git log`<br>exit: `q` or`z` | Show most recent commits:
`git merge main` | Merge the current branch into the main
`git pull` or <br>`git pull <shortname> <branch>` | Pull
`git rebase main` | Merge the current branch into the main and rebase them. `-i` shows the list of commits which will be rebased
`git remote add <shortname> <url>`| Create a shorthand name for a repo
`git remote add origin URL` | Connect local repo to a remote (github) repo:
`git remote remove origin` | remove address
`git remote -v` | Show the URL of the Remote that the folder is connected to. Need to be anywhere in the repo folder structure. Now you can use the string `<shortname>` on the command line in lieu of the whole URL
`git reset` | Unstage all changes
`git reset -- ...` | Un-stage the changes at path ...
`git reset …^` | reset local by 1 commit from its position
`git reset --hard f5730d2`<br>`git push -f`| reset local and remote to a specific commit
`git reset HEAD~#` | reset local by # commits from current position
`git reset --soft ####`<br>`git push -f` | squash commits
`git restore .` | discard all unstaged changes in the current directory
`git restore <file>` | Discard the unstaged changes on the file
`git restore --staged`|  discard staged changes
`git revert …` | yes, you don't add the ^. reset local and # commit and allow staging and pushing to remote. rather than going back a commit, it creates a copy of the previous commit as a new commit.  always do from head at current position.
`git rm ...` | Untrack files from repo
`git rm -rf --cached .`<br>`git add .` | remove git-ignored files already in repo from the repo.
`git stash apply`| apply the stashed changes  into current branch
`git stash apply 487c30aee0e450bd16872755e00fd5729b820830` | apply a previously dropped stash by using the hash value
`git stash drop`| delete most recent stash
`git stash list` | list git stash numbers. A stash is not pushed to remote. It is per repository not per branch.
`git stash pop`| apply + drop
`git stash save <message>`| save changes to a stash
`git stash show` | show contents of most recent git stash
`git stash show stash@<index>` | show specific stash
`git status` | Current branch details:
`git status` | See all changes:
`git status -sb` | BRANCH Show upstream branch status (i.e. changes made on remote branch which are not yet pulled)
`git switch <name>` | Change branches:
`git switch <name>` | Change branches:
`git worktree add branchname` | add a new branch to the worktree
