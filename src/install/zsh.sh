#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

update_shell() {
  local shell_path;
  shell_path="$(command -v zsh)"

  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    execute \
      "sudo sh -c \"echo $shell_path >> /etc/shells\"" \
      "Adding '$shell_path' to /etc/shells"
  fi
  execute \
    "sudo chsh -s \"$shell_path\" \"$USER\"" \
    "Use Zsh as default shell"
}

main() {
  print_in_purple "\n • Zsh\n\n"

  brew_install "Zsh" "zsh"

  update_shell

  brew_install "Zsh Completions" "zsh-completions"
}

main
