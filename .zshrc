# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/Users/bertrandjunqua/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

############
### MISC ###
############

# DEFAULT TEXT EDITOR
export VISUAL=vim
export EDITOR="$VISUAL"

###########
### NVM ###
###########

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###########################
### BULLET TRAIN PROMPT ###
###########################

export BULLETTRAIN_PROMPT_ADD_NEWLINE="false"
export BULLETTRAIN_TIME_BG="green"
export BULLETTRAIN_TIME_FG="black"
export BULLETTRAIN_DIR_FG="black"
export BULLETTRAIN_CONTEXT_DEFAULT_USER="bertrand"
export BULLETTRAIN_EXEC_TIME_ELAPSED=1
export BULLETTRAIN_DIR_EXTENDED="2"
export BULLETTRAIN_GIT_PROMPT_CMD=\${\$(git_prompt_info)//\\//\ \ }
export BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  custom
  dir
  screen
  virtualenv
  git
  hg
  cmd_exec_time
)
# DEFAULT BULLETTRAIN_PROMPT_ORDER
# time status custom context dir screen perl ruby virtualenv nvm aws go rust elixir git hg cmd_exec_time

###############
### ALIASES ###
###############

alias vim='~/Code/nvim-osx64/bin/nvim'
alias k="kubectl"
alias weather='curl -s https://wttr.in'
alias less="bat"
alias ll="exa -larh -t modified"
alias ls="exa"

# GIT
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gca='git commit -am'
alias gd='git diff --color-words'
alias gl="git log --graph --all --decorate --pretty=format:'''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'''"
alias glo='git log --graph --decorate --all'
alias gpl='git pull'
alias gpls='gpl && gps'
alias gs='git status'
alias gcl='git clone --depth=1'
alias gco='git checkout'
alias gr='git reset HEAD'
alias got='cd $(git rev-parse --show-toplevel)'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

export PATH="/Users/bertrandjunqua/Library/Python/3.7/bin:$PATH"


# Needed by Go
export GOBIN="/Users/bertrandjunqua/go/bin"
export PATH="$PATH:$GOBIN:$(go env GOPATH)/bin"

# Needed by Stack (Haskell)
export PATH="/Users/bertrandjunqua/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /Users/bertrandjunqua/Code/dev-toolbox/setup-workstation/aws-ssh.sh
export PATH="/usr/local/opt/llvm/bin:$PATH"

export SBT_OPTS="-Xmx4G"
