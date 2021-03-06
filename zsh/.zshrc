
#set -x
lastDir=$(pwd)
currentFilePath="$(readlink ~/.zshrc)"
zshHomeDir="$(dirname $currentFilePath)"
dotFilesHome="$(cd $zshHomeDir && cd .. && pwd)"

DIR="$dotFilesHome"
ZSH="$zshHomeDir/.oh-my-zsh"
pushd $DIR > /dev/null 2>&1
source .localrc
popd > /dev/null 2>&1

if [[ ! -d $ZSH ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH > /dev/null 2>&1
fi

if [[ ! -f $ZSH/themes/jared.zsh-theme ]] || [[ $DIR/zsh/jared.zsh-theme -nt $ZSH/themes/jared.zsh-theme ]]; then
    cp $DIR/zsh/jared.zsh-theme $ZSH/themes/jared.zsh-theme
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx rbenv docker node docker-compose osx tmux vscode nvm npm yarn)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"



# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


########################################
# Aliases
########################################
alias rake='noglob rake'

#######################################
# Exports
#######################################

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="jared"
#export ZSH_THEME="robbyrussell"
export PATH="$HOME/.yarn/bin:$PATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

export DOTFILES_HOME="$DIR"

########################################
# Load ZSH
########################################
source $ZSH/oh-my-zsh.sh


########################################
# Load Custom Auto Completion
########################################

# Load Git completion
zstyle ':completion:*:*:git:*' script $DIR/zsh/git-completion.bash
fpath=($DIR/zsh $fpath)

autoload -Uz compinit && compinit

########################################
# Serverless Options
########################################
d=$(nvm which 8.11.3)
e=$(dirname $d)
SLS_NODE_ROOT="${e}/lib"

# echo "Serverless will use $SLS_NODE_ROOT"
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f $SLS_NODE_ROOT/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . $SLS_NODE_ROOT/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f $SLS_NODE_ROOT/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . $SLS_NODE_ROOT/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f $SLS_NODE_ROOT/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . $SLS_NODE_ROOT/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh


