#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

install_homebrew() {
  if ! cmd_exists "brew"; then
    printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
    #  └─ simulate the ENTER keypress
  fi

  print_result $? "Homebrew"
}

main() {
  print_in_purple "\n • Homebrew\n\n"

  install_homebrew

  execute \
    "brew update" \
    "Homebrew (update)"

  execute \
    "brew upgrade" \
    "Homebrew (upgrade)"
}

main
