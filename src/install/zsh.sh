#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

main() {
  print_in_purple "\n • Zsh\n\n"

  execute \
    "sh -c \"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
    "Instaall Oh My Zsh"

  brew_install "Zsh Completions" "zsh-completions"
}

main
