# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

plugins=(brew npm z zsh-nvm)

# Bullet train theme configuration
BULLETTRAIN_PROMPT_ORDER=(
  dir
  screen
  git
  status
  cmd_exec_time
)
BULLETTRAIN_CONTEXT_DEFAULT_USER="xavier"
BULLETTRAIN_GIT_DIRTY=""

# Zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Prefer US English and use UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US'
# vim as default
export EDITOR='vim'

alias git=hub
