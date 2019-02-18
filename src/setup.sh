#!/bin/bash

maybe_restart() {
  print_in_purple "\n • Restart\n\n"

  ask_for_confirmation "Do you want to restart?"
  printf "\n"

  if answer_is_yes; then
    sudo shutdown -r now &> /dev/null
  fi
}

main() {
  # Ensure that the following actions are made relative to this file's path.
  cd "$(dirname "${BASH_SOURCE[0]}")"  || exit 1
  # Load utils
  . "utils.sh" || exit 1

  ask_for_sudo

  ./install/xcode.sh
  ./install/homebrew.sh
  ./install/zsh.sh
  ./install/brews.sh
  ./install/ssh_keys.sh
  ./preferences/macos.sh
  ./preferences/git.sh

  maybe_restart
}

main "@"
