---
layout: post
title: PowerShell Commands
permalink: code/pwsh-commands
categories: Code
---

A very good comprehensive summary is at [SS64](https://ss64.com/ps/).

Command and Arg | Explanation
-|-
`cd  $env:<environment variable>`| get the env varible, i.e. profile, appdata, programfiles
`Get-PSDrive` | List drives
`E:` | Change drive. `cd` only works with the same drive
`tree /f` | Print a visual tree of all sub files (`/f`) and dirs 
`cls` | clear screen
`rm -f` | delete folder
`ni <file name> `| new text file
`"blablabla" > <file name>`  | Overwrite file
`cat a.txt > b.txt` | concantenate the files together
`'blablabla' >> <file name>` | append to next line of file
`start` | open file or folder
`gcm`, `get-command` | show path of command location. very important
 `man `|  help info for command
 `cpi` or<br>`Copy-Item` | copy from to e.g. copy up a level `copy  test.txt -destination ..`
`mkdir` | Make dir
`ipconfig`| Get IP Local IPv4 Address
 `ni` , `New-Item …`| Make a new empty file
`dir | findstr ...`  | search the current dir for the string '...'
`(gmo -l ...*).path` | get path to a module location







