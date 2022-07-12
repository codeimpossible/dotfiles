dotfiles
========

Just all the dot files I use day-to-day.


## Installing

### OSX

```shell
$ ./osx/install.sh
```

### Windows

I think this will work? I've not setup a windows machine in a while...

```powershell
$localProfile = $(Get-ChildItem -Path "$(Get-Location)" -Filter profile.ps1 -Recurse | Select-Object -ExpandProperty FullName)
"& $localProfile " > $PSHOME\Profile.ps1
```
