#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "../utils.sh"

main () {
  print_in_purple "\n • Security & privacy\n\n"

  brew_cask_install "1Password" "1password"
  brew_cask_install "Keybase" "keybase"

  print_in_purple "\n • Browsers\n\n"

  brew_cask_install "Chrome" "google-chrome"
  brew_cask_install "Firefox Developer Edition" "firefox-developer-edition" "caskroom/versions"

  print_in_purple "\n • Dev\n\n"

  brew_install "Git" "git"
  brew_install "GitHub tools" "gh"
  brew_install "Better git diff" "diff-so-fancy"
  brew_cask_install "Dash" "dash"
  brew_install "Golang" "go"
  brew_cask_install "iTerm2" "iterm2"
  execute "open ../extra/Solarized\ Dark.itermcolors" \
    "Install iTerm2 theme"
  brew_install "Node" "node"
  brew_cask_install "ngrok" "ngrok"
  brew_cask_install "Postman" "postman"
  brew_install "TL;DR" "tldr"
  brew_install "Vim" "vim" "--with-override-system-vi"
  brew_cask_install "Visual Studio Code" "visual-studio-code"
  brew_install "Yarn" "yarn"

  print_in_purple "\n • Daily\n\n"

  brew_install "ag" "the_silver_searcher"
  brew_cask_install "Dropbox" "dropbox"
  brew_cask_install "istat Menus" "istat-menus"
  brew_cask_install "Numi" "numi"
  brew_cask_install "Kap" "kap"
  brew_cask_install "Spectacle" "spectacle"
  execute "cp -r ../extra/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null" \
    "Set up Spectacle keyboard shortcuts"

  brew_cask_install "Spotify" "spotify"

  print_in_purple "\n • Misc\n\n"

  brew_cask_install "AppCleaner" "appcleaner"
  brew_cask_install "Font: Source Code Pro" "font-source-code-pro" "" "homebrew/cask-fonts"
  brew_install "rcm" "thoughtbot/formulae/rcm" "" "thoughtbot/formulae"
}

main
