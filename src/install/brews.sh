#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

main () {
  print_in_purple "\n • Security & privacy\n\n"

  brew_install "1Password" "1password"
  brew_install "Keybase" "keybase"

  print_in_purple "\n • Browsers\n\n"

  brew_install "Chrome" "google-chrome"
  brew_install "Brave" "brave-browser"
  brew_install "Firefox Developer Edition" "firefox-developer-edition"

  print_in_purple "\n • Dev\n\n"

  brew_install "Git" "git"
  brew_install "GitHub tools" "gh"
  brew_install "Delta" "git-delta"
  brew_install "iTerm2" "iterm2"
  execute "open ../extra/Solarized\ Dark.itermcolors" \
    "Install iTerm2 theme"
  brew_install "Vim" "vim" "--with-override-system-vi"
  brew_install "Visual Studio Code" "visual-studio-code"
  # TODO: Restore Visual Studio Code preferences / plugins?
  brew_install "Golang" "go"
  brew_install "Node" "node"
  brew_install "Yarn" "yarn"
  execute "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash" \
    "Node Version Manager"

  print_in_purple "\n • Tools\n\n"

  brew_install "ag" "the_silver_searcher"
  brew_install "Dropbox" "dropbox"
  brew_install "Numi" "numi"
  brew_install "Rectangle" "rectangle"
  # TODO: Restore Rectangle preferences?
  brew_install "Postman" "postman"
  brew_install "ngrok" "ngrok"
  brew_install "Kap" "kap"

  print_in_purple "\n • Misc\n\n"

  brew_install "Font: Fira Code" "font-fira-code"
  brew_install "rcm" "rcm"
}

main
