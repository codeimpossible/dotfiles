# RUBY STUFF
#####################

# import our computed ssl cert for openssl
$env:SSL_CERT_FILE = resolve-path "D:/dropbox/bin/support/cacert.pem"

# force ruby to parse in utf-8
$env:LC_ALL = "en_US.UTF-8"
$env:LANG = "en_US.UTF-8"

# COLORS
#####################

$console = $host.UI.RawUI
$console.BackgroundColor = "black"
$console.ForegroundColor = "white"
$colors = $host.PrivateData
$colors.VerboseForegroundColor = "white"
$colors.VerboseBackgroundColor = "blue"
$colors.WarningForegroundColor = "yellow"
$colors.WarningBackgroundColor = "darkgreen"
$colors.ErrorForegroundColor = "white"
$colors.ErrorBackgroundColor = "red"


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

# LOAD PLUGINS
#####################

$scripts_path = $PSScriptRoot + "\powershell\"
Get-ChildItem ( $scripts_path + "*.ps1") | ForEach-Object {. (Join-Path $scripts_path $_.Name) }

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

cd ~
