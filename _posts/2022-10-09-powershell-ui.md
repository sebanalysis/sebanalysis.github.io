---
layout: post
title: PowerShell Windows Terminal Make-Over
permalink: code/pwsh-ui
categories: Code
tags:
---

Prior to the Windows Terminal in 2020, people used to either use 'conhost' or 'cmder'; a much better open source alternative. You couldn't do much to the interface.

Now, with Terminal, you can install a piece of software called oh-my-posh. This renders over the terminal and adds a set of emojis (for which there is no glossary but can be figured out by trial and error).

## PowerShell Profile

You will need to import both of the following modules every time you start up by adding them to the PowerShell profile. I have described the process of creating a profile in [PowerShell profile](./pwsh-profile).

> See my PowerShell profile: __[Download](../assets/pwsh.ps1)



```powershell
# Add terminal icons
Import-Module -Name Terminal-Icons

# Add oh-my-posh
oh-my-posh init pwsh --config "$env:USERPROFILE\profiles\bubblesextra.omp.json" | Invoke-Expression
```

## Add Icons to `ls` standard output

The fastest improvement you can make it to decorate your file-lists with colour and icons.

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons
```

## oh-my-posh

> My oh-my-posh theme file is here: __[Download](../assets/bubblesextra.omp.json)__.

The source code is here but there is no install guidance here: https://github.com/JanDeDobbeleer/oh-my-posh

The install guidance is at: https://ohmyposh.dev/docs/installation/windows

Never install via the 'module' as it is deprecated, but seems to be referenced everywhere. 

You're meant to install via winget which is on the microsoft store but I couldn't find the module so I installed via :

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
```

It only added to the path after a system restart. At which point it can be found with the command `gcm oh-my-posh`oh-my-posh`.

```
C:\Users\$home\AppData\Local\Programs\oh-my-posh\bin\oh-my-posh.exe
```


Check it works:

```powershell
oh-my-posh init pwsh | Invoke-Expression
```

You should see a more colourful terminal with these placeholder characters: ▯

You have to install a font which can represent all the relevant character with:

```
oh-my-posh font install
```

This didn't work for me, so I had to download the 'nerd' fonts manually from [Nerdfonts.com](https://www.nerdfonts.com/font-downloads). Open the downloaded folder, then right-click on the 'complete' version of any given font of your choosing and install it into windows.
Now you can go into the settings of your PowerShell profile in the terminal and adjust the font to the appropriate one.

### git symbols

[StackOverFlow](https://stackoverflow.com/questions/65602969/understanding-the-git-symbols-in-oh-my-posh)

Symbol | Description
-|-
![](../assets/20220902100357.png) ![](../assets/20220902144542.png)| Remote: GitHub / GitLab
![](../assets/20220902144608.png) | Branch name
![](../assets/20220902144608.png) `≡` | Remote: 'Up to date'
![](../assets/20220902144608.png) `↑`  | Remote: Ahead
![](../assets/20220902144608.png) `↓` | Remote: Behind
![](../assets/20220902111935.png)`?` | Worktree: Untracked files
![](../assets/20220902111935.png)`~` | Worktree: Modified files
![](../assets/index.jpg)`+` |  Index: Staged new files
![](../assets/index.jpg)`~` | Index: Staged Modified files
![](../assets/index.jpg)`?` | Index: Conflicted files
![](../assets/save.png)| Stash






### Edit The Themes

You will very quickly find that the default theme is to cluttered and annoying. Each theme is completely defined by a .json config file. All the emojis are predefined in the oh-my-posh software, so all you themes do is turn features on an off, right or left align and change colours.

You can go into the themes folder and change the theme config json. When you installed the oh-my-posh software, it should have created the environment variable called ''POSH_THEMES_PATH". Mine is at `%userprofile%\scoop\apps\oh-my-posh\current\themes`.

```powershell
oh-my-posh init pwsh --config 
"$env:POSH_THEMES_PATH/bubblesextra.omp.json" | Invoke-Expression
```

> Note, that `%userprofile%\…` is the CMD format path which is in the environment variables in the Windows System Properties Window.  The equivalent Powershell format is  `$env:userprofile\…` or shorthand: `~\…` . CMD and Powershell have different environment variable syntax. `%…%` vs `$env:…`.

Each emoji item in a theme is represented as a 'segment' item in the .json file.  Sadly, there are no images in the [oh my posh website](https://ohmyposh.dev/docs/) so you have to experiment with deleting things and turn on true and false parameters to see what is is what. The git segment is particularly confusing. The actual emoji they render don't correspond to any Unicode code points, so they seem to have created custom svgs, rather than using stock emoji.

There is also two different git segments [git](https://ohmyposh.dev/docs/segments/git) and [poshgit](https://ohmyposh.dev/docs/segments/poshgit). Apparently posh-git is a newer but different implementation, the stock themes don't seem to use it and it is an identical copy, but it just also includes auto-completion. It breaks my oh my posh, so I ignore it. Perhaps you have to install it separately.

I use the `bubblesextra.omp.json` default theme with a few edits.
