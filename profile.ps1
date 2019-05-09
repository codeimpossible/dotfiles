$console = $host.UI.RawUI
$concfg = "${PSScriptRoot}/powershell/concfg/bin/concfg"

# RUBY STUFF
#####################

# import our computed ssl cert for openssl
$env:SSL_CERT_FILE = resolve-path "${PSScriptRoot}/ruby/cacert.pem"

# force ruby to parse in utf-8
$env:LC_ALL = "en_US.UTF-8"
$env:LANG = "en_US.UTF-8"

# COLORS
#####################

function Set-Theme([string]$theme) {
  . "$concfg" import "$theme"
}

# WINDOW/BUFFER SIZE
#####################

$buffer = $console.BufferSize
$buffer.Width = 250
$buffer.Height = 3000
$console.BufferSize = $buffer

$size = $console.WindowSize
$size.Width = 250
$size.Height = 60
$console.WindowSize = $size


# POSH-GIT
#####################

. 'D:\Dropbox\bin\tools\posh-git\profile.example.ps1'

# set git\bin into the ENVIRONMENT
#####################

$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"

# CUSTOM PROMPT
#####################

function prompt {
  $p = Split-Path -leaf -path (Get-Location)
  Write-Host $p -nonewline
  Write-VcsStatus
  "> "
}

# ALIASES
#####################

function Rename-GitTag([string] $old, [string] $new) {
    git tag $new $old
    git tag -d $old
    git push origin :refs/tags/$old
    git push --tags
}

function took() {
  $command = Get-History -Count 1
  $command.EndExecutionTime - $command.StartExecutionTime
}

# function to grep history
function grepHistory ([string] $word) {
  Get-History -c 1000 | where {$_.commandline.contains($word)}
}

function grepServices ( [string] $svcName ) {
  Get-Service | Where-Object { $_.name.contains($svcName) }
}

Set-Alias find-service grepServices
Set-Alias i invoke-history
Set-Alias gh grepHistory

# Posh Theme Chooser
Import-Module oh-my-posh

Set-Theme Sorin

cd ~
