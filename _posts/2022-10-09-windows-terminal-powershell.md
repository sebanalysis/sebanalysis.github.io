---
layout: post
---

Prior to the Windows Terminal in 2020, people used to either use 'conhost'; the default program which renders both powershell and cmd, or 'cmder'; a much better open source alternative. You couldn't do much to the conhost interface and cmder required some knowledge.

Now, with Terminal, you can install a piece of software called oh-my-posh. This renders over the terminal and adds a set of emojis (for which there is no glossary but can be figured out by trial and error).

# PowerShell Profile

You will need to import both of the following modules every time you start up by adding them to the PowerShell profile. I have described the process of creating a profile.

> See my PowerShell profile: __[Download](../../../assets/pwsh.ps1)

You need a PowerShell profile file to start modules start every time and to assign aliases.

Windows has [6 PowerShell profiles](https://devblogs.microsoft.com/scripting/understanding-the-six-powershell-profiles/) . All hosts, current and all users is loaded every time, The others depend on the users, host and whether it is console or the ISE editing environment:

Host→ <br>  User ↓ |  All Hosts | Current Host - Console | Current Host - ISE
-|-|-|-
All Users | `$PsHome\Profile.ps1` | `$PsHome\Microsoft.PowerShell_profile.ps1` | `$PsHome\Microsoft.PowerShellISE_profile.ps1` 
Current User | `$Home\[My ]Documents\Profile.ps1` | `$profile` a.k.a.;<br> `$Home\[My ]Documents\WindowsPowerShell\Profile.ps1` |  `$Home\[My ]Documents\WindowsPowerShell\Microsoft.P owerShellISE_profile.ps1`

The All Hosts scripts and the All & Current User scripts for the current host scripts will run EVERY SINGLE TIME 
you open powershell in a Host. Ie command line or the ISE software.

All the following will go into the Current user, command line script found with the powershell environment variable : `$profile`.   

`$PSHome` by contrast shows the installation directory for Powershell.

First, create the profile file if it doesn't already exist:

```powershell
if (!(Test-Path -Path $PROFILE ))
{ New-Item -Type File -Path $PROFILE -Force }
```

Open the Profile:

```powershell
notepad $profile
```

Re-direct the profile to a file in your personal directory where all your dotfiles and profiles can be stored and synced in a git repo. Paste in the following to the `$profile` notepad file and save.

```powershell
. $env:userprofile/profiles/pwsh.ps1
```

Or in linux:
```
. "~/.config/pwsh.ps1"
```

Then run the install scripts to get all the modules.

## Commands

In PowerShell, the Write-Host and Write-Output cmdlets are used to write text to the console, but they have some important differences in their behavior and use cases.

Write-Host is used to display text on the console and its output is not captured by the pipeline. This means that the output of Write-Host is not passed to the next command in the pipeline, and it is not available for redirection or variable assignment.

Write-Output is used to send text to the pipeline and its output is captured by the pipeline. This means that the output of Write-Output is passed to the next command in the pipeline, and it is available for redirection or variable assignment.

Here is an example that illustrates the difference between Write-Host and Write-Output:

$output = "Hello World"
Write-Host $output
Write-Output $output

In this example, the string "Hello World" is assigned to the $output variable and then passed to both Write-Host and Write-Output. The output of Write-Host is displayed on the console, but the output of Write-Output is not displayed, but it is passed to the pipeline and can be assigned to a variable or passed to the next command.

In general, it's recommended to use Write-Output instead of Write-Host in scripts and functions because it allows for more flexibility and composability, but if you want to display text on the console without affecting the pipeline, you can use Write-Host.

Please let me know if you have any more questions on this topic.


## Add Icons to `ls` standard output

The fastest improvement you can make it to decorate your file-lists with colour and icons.

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons
```

## oh-my-posh

> My oh-my-posh theme file is here: __[Download](../../../assets/bubblesextra.omp.json)__.

On windows, install with winget:

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

ON linux install manually:

```powershell
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
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
![](../../../assets/20220902100357.png) ![](../../../assets/20220902144542.png)| Remote: GitHub / GitLab
![](../../../assets/20220902144608.png) | Branch name
![](../../../assets/20220902144608.png) `≡` | Remote: 'Up to date'
![](../../../assets/20220902144608.png) `↑`  | Remote: Ahead
![](../../../assets/20220902144608.png) `↓` | Remote: Behind
![](../../../assets/20220902111935.png)`?` | Worktree: Untracked files
![](../../../assets/20220902111935.png)`~` | Worktree: Modified files
![](../../../assets/index.jpg)`+` |  Index: Staged new files
![](../../../assets/index.jpg)`~` | Index: Staged Modified files
![](../../../assets/index.jpg)`?` | Index: Conflicted files

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

# Powershell Autocomplete

The best way to improve your efficiency in the command line is to add autocompletion. There are a few different types:

- Tab-completion: press tab and it toggles folder or file suggestions.
- Menu-complete: press Ctrl-Space and it displays either folder-file suggestion or command option in a tabular menu, which you can navigate around with arrow keys.
- Auto-prediction: press the right-arrow and it auto-completes the full command based on either history or autogenerated predictions.

PSReadline provides Menu-complete and auto-prediction. poshgit provides menu-complete for git commands and z provides auto-prediction for folder-paths.

## PowerShell Profile

You will need to import all of these modules every time you start up by adding them to the PowerShell profile. I have described this at in [PowerShell profile](./pwsh-profile).

> See my PowerShell profile: __[Download](../../../assets/pwsh.ps1)

## Install z Module

`z …` is functionally equivalent to `cd …` but it remembers your recent calls, so you can press tab halfway through to autocomplete. It prioritises autocompletion suggestions via recency and frequency. Z is the most useful module I have.

A quick-start guide is [here](https://www.hanselman.com/blog/spend-less-time-cding-around-directories-with-the-powershell-z-shortcut).

[Here](https://github.com/badmotorfinger/z?WT.mc_id=-blog-scottha) is the source code.

```powershell
Install-Module z -AllowClobber
```

Some additional commands:

```
z -l # list z dirs
z -d # Delete dead path from suggestions
z -x # remove the current directory from the list
```

## poshgit

Poshgit provides:

- Menucomplete for git commands (Ctrl +Space)
- A less pretty Git status summary information than oh-my-posh (Disabled by default if using oh-my-posh).

First install nuget:

```powershell
Install-PackageProvider -Name NuGet
```

Command line didn't work for me , so I installed from [nuget.org](https://www.nuget.org/downloads)

Then install posh-git from nuget:

```powershell
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
```

Instructions at [GitHub](https://github.com/dahlbyk/posh-git)

Now you should be able to menu-complete with git.

## PSReadline

PSReadline provides:

- Autocomplete for PowerShell command (From a Predictor and/or history) (Arrow Keys)
- MenuComplete for PowerShell commands (Ctrl + Space)

First check PowerShell version is 7 or above. Need to download the v7 or later [newest one](https://www.microsoft.com/store/productId/9MZ1SNWT0N5D) from windows store.

```
`$PSVersionTable.PSVersion`
```

Install the module:

```
Install-Module PSReadLine
```

Install the Azure commands prediction plugin separately. This is explained basically nowhere, but I found the commands [here](https://techcommunity.microsoft.com/t5/azure-tools-blog/announcing-general-availability-of-az-tools-predictor/ba-p/3297956).

```powershell
Install-module -name Az.Accounts -Force
Install-module -name Az.Tools.Predictor -Force
Enable-AzPredictor -AllSession
```

I also added the [CompletetionPredictor](https://github.com/PowerShell/CompletionPredictor/) but it didn't seem to add any useful suggestions.

```powershell
Install-Module -Name CompletionPredictor -Repository PSGallery
Import-Module -Name CompletionPredictor
```

I actually leave both of these plugins deactivated as they add 10s to the start-up time.

### Display Options

Now you have installed, you have 2 choices for your suggestions:

1. Choose between history and plugins:

```
Set-PSReadLineOption -PredictionSource HistoryAndPlugin # or History or Plugin or  none
```

2. Choose between Inline suggestions and tabulated suggestions. Press `F2` to change the prediction style.


### PSReadline Useful Resources

- [Predictions](https://jdhitsolutions.com/blog/powershell/8969/powershell-predicting-with-style/)
- [Source Code](https://github.com/PowerShell/PSReadLine)
- [Options](https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.2)

# Windows 'User Shell Folders'

This is the name for my documents, Videos, Pictures etc.

These all have registry keys. Registry keys are the default locations for various types of files and folders on a user's system. It is effectively a list of paths. 

If you have an invasive work environment installed, they may change these and confuse the hell out of your. Why is my PowerShell profile suddenly in the wrong place for example? Because the registry key for the 'Personal' User Shell Folder was changed. 

See the locations with:

```
Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders'
```



# Errors


### [Different path in system to the powershell path](https://stackoverflow.com/questions/546583/why-is-the-powershell-environment-path-different-to-the-system-environment-path). 

Change might be "delayed", so try one or more of these solutions:
-   **Log off and on** again;
-   Task Manager > **Restart "Windows Explorer"** (explorer.exe)
-   **Restart your launcher app** (launchy, SlickRun, etc)
-   **Reboot**

If there are any current installs running or other processes, then you may have to wait for them to finish before the PowerShell path is updated.

![[Pasted image 20230111163340.png]]

### VSCode PowerShell throws errors:

It may say PSFalsePS. This is a vscode specific thing which means its loading a different PS to the default for the software.

### Code command prints the VSCode log to the terminal:

Remove :

```
C:\Program Files\Microsoft VS Code\
```

From the path. 

Add instead the `bin` subfolder:

```
C:\Program Files\Microsoft VS Code\bin
```

This will run code.cmd not code.exe.

### Modules 
Check path and
$env:PSModulePath
