function __fish_git_prompt --description "Prompt function for Git"
  set -l git_app (which git)
  test -n "$git_app"; or return

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __fish_git_prompt_dirtycolor
    set -g __fish_git_prompt_dirtycolor (set_color -o purple)
  end
  if not set -q __fish_git_prompt_stagedcolor
    set -g __fish_git_prompt_stagedcolor (set_color -o green)
  end
  if not set -q __fish_git_prompt_boxcolor
    set -g __fish_git_prompt_boxcolor (set_color red)
  end
  if not set -q __fish_git_prompt_branchcolor
  set -g __fish_git_prompt_branchcolor (set_color cyan)
  end
  if not set -q __fish_git_prompt_upstreamcolor
    set -g __fish_git_prompt_upstreamcolor (set_color -o yellow)
  end


  set -l git_dir
  set -l git_branch
  set -l git_remote
  set -l git_upstream
  set -l git_dirty
  set -l git_staged

  if test -d .git
    set git_dir .git
  else
    set git_dir (git rev-parse --git-dir ^/dev/null)
  end
  test -n "$git_dir"; or return

  set git_branch (git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if test -n "$git_branch"
    set git_remote (git branch -r 2> /dev/null | grep "^ *origin/$git_branch\$" | sed 's/^ *//;s/$//')
    set git_dirty (git status --porcelain | grep -e '^ .*' -e '^??.*')
    set git_staged (git diff-index --cached HEAD)
  end

  if test -n "$git_remote"
    set -l count (git rev-list --count --left-right $git_remote...HEAD ^/dev/null)
    echo $count | read -l behind ahead
    switch "$count"
    case ""
    case "0	0" # equal to upstream
      set git_upstream "="
    case "0	*" # ahead of upstream
      set git_upstream "+$ahead"
    case "*	0" # behind upstream
      set git_upstream "-$behind"
    case "*" # diverged from upstream
      set git_upstream "+$ahead-$behind"
    end
  end

  if test -n "$git_staged"
    set git_staged "+"
  end

  if test -n "$git_dirty"
    set git_dirty "*"
  end

  printf "%s%s" "$__fish_git_prompt_boxcolor" "[" "$__fish_prompt_normal"
  printf "%s%s" "$__fish_git_prompt_dirtycolor" "$git_dirty" "$__fish_prompt_normal"
  printf "%s%s" "$__fish_git_prompt_stagedcolor" "$git_staged" "$__fish_prompt_normal"
  printf "%s%s" "$__fish_git_prompt_branchcolor" "$git_branch" "$__fish_prompt_normal"
  printf "%s%s" "$__fish_git_prompt_upstreamcolor" "$git_upstream" "$__fish_prompt_normal"
  printf "%s%s" "$__fish_git_prompt_boxcolor" "]" "$__fish_prompt_normal"
end
