#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

generate_ssh_keys() {
  ask "Please provide an email address: " && printf "\n"
  ssh-keygen -o -a 100 -t ed25519 -C "$(get_answer)" -f "$HOME/.ssh/id_ed25519"

  print_result $? "Generate SSH keys"
}

main() {
  print_in_purple "\n • Set up SSH keys\n\n"

  generate_ssh_keys
}

main
