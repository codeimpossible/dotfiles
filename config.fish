set fish_greeting ''
set -gx EDITOR vim
set -gx SUDO_EDITOR vim

# source all of the files in the function directory
for f in (find ~/.config/fish/functions -type f)
    . $f
end
