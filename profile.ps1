# import our computed ssl cert for openssl
$env:SSL_CERT_FILE = resolve-path "~/dropbox/bin/support/cacert.pem"

# force ruby to parse in utf-8
$env:LC_ALL = "en_US.UTF-8"
$env:LANG = "en_US.UTF-8"


# Load posh-git example profile
# TODO: point this to dropbox dir?
. '~\Dropbox\bin\tools\posh-git\profile.example.ps1'

# set git\bin into the ENVIRONMENT
$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"


function prompt {
  $p = Split-Path -leaf -path (Get-Location)
  "$p> "
}


# ALIASES
#####################

# just a quick shortcut to my src directory
function toSrc{Set-Location ~\src}

# openFirstSolution will open the first .sln file it encounters in the current directory tree
# thanks to Sebastien Lambla -> http://codebetter.com/sebastienlambla/2011/03/15/opening-a-solution-from-the-command-line-in-powershell/
function openFirstSolution{ ls -in *.sln -r | select -first 1 | %{ ii $_.FullName } }

# function to grep history
function grepHistory ([string] $word) {
  Get-History -c 1000 | where {$_.commandline.contains($word)}
}

function grepServices ( [string] $svcName ) {
  Get-Service | Where-Object { $_.name.contains($svcName) }
}

Set-Alias find-service grepServices
Set-Alias src toSrc
Set-Alias vsopen openFirstSolution
Set-Alias i invoke-history
Set-Alias gh grepHistory
Set-Alias vs "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe"
Set-Alias subl "~\Dropbox\bin\apps\sublime3\sublime_text.exe"

cd ~
