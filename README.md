dotfiles
========

Just all the dot files I use day-to-day.

## Features

Features vary by which OS these are being installed to.

### OSX Features

* ZSH install, with [a custom theme](https://github.com/codeimpossible/dotfiles/blob/master/zsh/jared.zsh-theme)
* VIMRC configured with [various plugins](https://github.com/codeimpossible/dotfiles/blob/master/.vimrc#L95-L109). Overrides or customizations for the local machine can be made within a `~/.vimrc.local` file.
* TMUX configured including [a fix for 256 color mode](https://github.com/codeimpossible/dotfiles/blob/master/.tmux.conf#L5-L9)
* RubyGems [configured to not download docs](https://github.com/codeimpossible/dotfiles/blob/master/.gemrc) (faster installs)
* Bash configured to load zsh.
  * Custom aliases and shortcuts are configured in [a `.localrc` file](https://github.com/codeimpossible/dotfiles/blob/master/.localrc)


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
