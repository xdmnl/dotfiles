#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

create_gitconfig_local() {

  declare -r FILE_PATH="../../gitconfig.local"

  if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

      printf "%s\n" \
"[commit]

  # Sign commits using GPG.
  # https://help.github.com/articles/signing-commits-using-gpg/

  # gpgsign = true

[user]

  name =
  email =
  # signingkey =" \
    >> "$FILE_PATH"
  fi

  print_result $? "Create gitconfig.local"
}

initialize_git_repository() {
  if ! is_git_repository; then

    # Run the following Git commands in the root of the dotfiles directory.
    cd ../../ || print_error "Failed to 'cd ../../'"

    execute "git init" \
      "Initialize the Git repository"

  fi
}

is_git_repository() {
  git rev-parse &> /dev/null
}

main() {
  print_in_purple "\n • Git preferences\n\n"

  initialize_git_repository
  create_gitconfig_local

  print_warning "Don't forget to fill the gitconfig.local"
}
