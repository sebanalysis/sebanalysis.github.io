---
layout: post
title: PowerShell Profiles
permalink: code/pwsh-profile
categories: Code
---

You need a PowerShell profile file to start modules start every time and to assign aliases. 

See my PowerShell profile: __[Download](../assets/pwsh.ps1)__

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
