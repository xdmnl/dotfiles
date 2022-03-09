# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bullet-train"

plugins=(brew nvm z)

# User configuration

NVM_AUTOLOAD=1

# Bullet train theme configuration
BULLETTRAIN_PROMPT_ORDER=(
  dir
  nvm
  git
  status
  cmd_exec_time
)
BULLETTRAIN_GIT_DIRTY=""

# Prefer US English and use UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US'
# vim as default
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh
