# Setup the prompt
function fish_prompt --description "Write out gwax's prompt"
  # Just calculate this once
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  set -l __fish_prompt_character "\$"
  set -l __fish_prompt_usercolor (set_color -o green)
  set -l __fish_prompt_atcolor (set_color -o cyan)
  set -l __fish_prompt_hostcolor (set_color -o red)
  set -l __fish_prompt_coloncolor (set_color -o purple)
  set -l __fish_prompt_cwdcolor (set_color -o blue)
  set -l __fish_prompt_promptcolor (set_color -o yellow)

  printf '%s%s%s' "$__fish_prompt_usercolor" $USER "$__fish_prompt_normal"
  printf '%s%s%s' "$__fish_prompt_atcolor" "@" "$__fish_prompt_normal"
  printf '%s%s%s' "$__fish_prompt_hostcolor" $__fish_prompt_hostname "$__fish_prompt_normal"
  printf '%s%s%s' "$__fish_prompt_coloncolor" ":" "$__fish_prompt_normal"
  printf '%s%s%s' "$__fish_prompt_cwdcolor" (prompt_pwd) "$__fish_prompt_normal"
  if functions -q __fish_git_prompt
    __fish_git_prompt
  end
  printf " "
  printf '%s%s%s' "$__fish_prompt_promptcolor" $__fish_prompt_character "$__fish_prompt_normal"
  printf " "
end
