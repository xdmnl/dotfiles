#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

agree_with_xcode_licence() {

  # Automatically agree to the terms of the `Xcode` license.
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license accept &> /dev/null
  print_result $? "Agree to the terms of the Xcode licence"
}

are_xcode_command_line_tools_installed() {
  xcode-select --print-path &> /dev/null
}

install_xcode() {

  # If necessary, prompt user to install `Xcode`.

  if ! is_xcode_installed; then
    open "macappstores://itunes.apple.com/en/app/xcode/id497799835"
  fi

  # Wait until `Xcode` is installed.

    execute "until is_xcode_installed; do \
              sleep 5; \
            done" \
      "Xcode.app"

}

install_xcode_command_line_tools() {

  # If necessary, prompt user to install the `Xcode Command Line Tools`.

  xcode-select --install &> /dev/null

  # Wait until the `Xcode Command Line Tools` are installed.

  execute "until are_xcode_command_line_tools_installed; do \
            sleep 5; \
           done" \
    "Xcode Command Line Tools"
}

is_xcode_installed() {
  [ -d "/Applications/Xcode.app" ]
}

main() {
  print_in_purple "\n • Xcode\n\n"

  install_xcode_command_line_tools
  # install_xcode
  agree_with_xcode_licence
}

main
