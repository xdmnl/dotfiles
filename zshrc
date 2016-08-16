# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

plugins=(brew gulp npm z)

# Bullet train theme configuration
BULLETTRAIN_GIT_DIRTY=""
BULLETTRAIN_GO_SHOW=true
BULLETTRAIN_NVM_SHOW=false
BULLETTRAIN_VIRTUALENV_SHOW=false
BULLETTRAIN_HG_SHOW=false

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Prefer US English and use UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US'
# vim as default
export EDITOR='vim'

alias git=hub