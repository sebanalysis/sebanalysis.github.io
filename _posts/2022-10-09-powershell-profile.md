---
layout: post
title: PowerShell Profiles
permalink: code/pwsh-profile
categories: Code
---

There are system and user specific powershell profiles.
-   The `$PSHOME` variable stores the installation directory for PowerShell
-   The `$Home` variable stores the current user's home directory

When you start up PowerShell, it loads the [profiles scripts](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.2) in the following order:

These are usually left unedited:
-   All Users, All Hosts `$PROFILE.AllUsersAllHosts`
	- `$PSHOME\Profile.ps1`
-   All Users, Current Host  `$PROFILE.AllUsersCurrentHost`
	- `$PSHOME\Microsoft.PowerShell_profile.ps1`

These are the ones you edit.
-   Current User, All Hosts  `$PROFILE.CurrentUserAllHosts`.  When you run conda init, it writes the startup script to this profile. 
	- `$Home\Documents\PowerShell\Profile.ps1`
-   Current user, Current Host `$profile` . As this is the shortest one, I prefer to store all my settings here so that I can run `. $profile`  to refresh after I change the env.  `$Home\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`

***


You need a PowerShell profile file to start modules start every time and to assign aliases. 

> See my PowerShell profile: __[Download](../assets/pwsh.ps1)


Create the profile file:

```powershell
if (!(Test-Path -Path $PROFILE ))
{ New-Item -Type File -Path $PROFILE -Force }
```

Open the Profile:

```powershell
notepad $profile
```

Copy each `Import-Module` statement into the profile file and save it:

```powershell
Import-Module -Name Terminal-Icons
```

Set-Aliases:

```powershell
Set-Alias -Name g -Value git
```

Set Functions (aliases to which you also want to pass arguments)

```powershell
Function c {git commmit -am $args}
```

Reference the profile file in another location if you want you sync between computers as you may want the main profile file to contain PC-specific information.

```powershell
$profile = "~\profiles\pwsh.ps1"
. $profile
```

***

Modules are installed to :

```
$env:PROGRAMFILES\PowerShell\Modules
```
