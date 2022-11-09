# aliases new and set are synonyms but new gives you an overwrite error
# https://stackoverflow.com/questions/2858484/creating-aliases-in-powershell-for-git-commands

function gd { git diff $args }
function def  { (gcm $args).definition }
function path { (gcm $args).path }

function conf { notepad $env:userprofile\.ssh\config } 
Function pro {notepad "$env:userprofile\profiles\pwsh.ps1"}

set-alias -Name m -Value micromamba 
Set-Alias -Name np -Value notepad

Set-Alias -Name notepadpp  -Value "C:\Program Files\Notepad++\notepad++.exe"
Function npp {notepadpp $args}

function z- { cd - } 
function z. { cd .. } 
function e { explorer.exe $args}
function e. { explorer.exe . }

New-Alias -Name g -Value git
function s { git status }
function l { & git log $args }
Function c {git commit -am $args}
function ga { git add $args }
function gb { git branch $args }
function gs { & git switch  $args }
Function gpl {git pull $args}
Function gph {git push $args}
function gt { & git log --graph --oneline --decorate $args }
function gr { & git remote -v $args}
function gf { git fetch }

Function files {gci -r|sort -descending -property length | select -first 10 fullname, @{Name="Megabytes";Expression={[Math]::round($_.length / 1MB, 2)}}}

Set-Alias vim nvim

Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config "$env:USERPROFILE\profiles\bubblesextra.omp.json" | Invoke-Expression

Import-Module posh-git
Import-Module z
