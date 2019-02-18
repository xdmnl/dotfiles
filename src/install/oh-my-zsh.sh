#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

main() {
  print_in_purple "\n • Oh My Zsh\n\n"

  brew_install "Zsh" "zsh"

  execute \
    "chsh -s $(which zsh)"
    "Use Zsh as default shell"

  brew_install "Zsh Completions" "zsh-completions"

  execute \
    "sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"" \
    "Oh My Zsh"
}

main
