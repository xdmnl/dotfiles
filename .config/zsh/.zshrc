# Setup Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# Initialize Starship prompt
eval "$(starship init zsh)"

setopt EXTENDED_HISTORY         # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY            # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS         # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE        # Do not record an event starting with a space.
setopt HIST_VERIFY              # Do not execute immediately upon history expansion.

unsetopt LIST_BEEP              # Turn off autocomplete beeps.

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'
alias -g ......='cd ../../../../..'

# Dotfiles setup (https://www.atlassian.com/git/tutorials/dotfiles)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# -----------------------------------------------------------------------------
# Completions
# -----------------------------------------------------------------------------

autoload -U compinit; compinit

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"

# Allow you to select in a menu
zstyle ':completion:*' menu select

# -----------------------------------------------------------------------------
# Key bindings
# -----------------------------------------------------------------------------

typeset -gA keys=(
  Up                   '^[[A'
  Down                 '^[[B'
  Right                '^[[C'
  Left                 '^[[D'
  Esc                  '^['
  Tab                  '^I'

  Shift+Up             '^[[1;2A'
  Shift+Down           '^[[1;2B'
  Shift+Right          '^[[1;2C'
  Shift+Left           '^[[1;2D'
  Shift+Tab            '^[[Z'

  Alt+Up               '^[[1;3A'
  Alt+Down             '^[[1;3B'
  Alt+Right            '^[[1;3C'
  Alt+Left             '^[[1;3D'

  Ctrl+Up              '^[[1;5A'
  Ctrl+Down            '^[[1;5B'
  Ctrl+Right           '^[[1;5C'
  Ctrl+Left            '^[[1;5D'
)

bindkey -- "${keys[Up]}"                history-substring-search-up
bindkey -- "${keys[Down]}"              history-substring-search-down
bindkey -- "${keys[Esc]}"               autosuggest-clear
bindkey -- "${keys[Tab]}${keys[Tab]}"   autosuggest-accept
bindkey -- "${keys[Shift+Tab]}"         reverse-menu-complete

# -----------------------------------------------------------------------------
# Plugins
# -----------------------------------------------------------------------------

source "$HOMEBREW_PREFIX/etc/profile.d/z.sh"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

source "$ZDOTDIR/plugins/npm.zsh"
source "$ZDOTDIR/plugins/nvm.zsh"
source "$ZDOTDIR/plugins/ssh.zsh"
source "$ZDOTDIR/plugins/work.zsh"
