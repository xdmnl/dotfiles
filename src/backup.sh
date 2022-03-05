#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"  && . "utils.sh"

declare backupDirectory="$HOME/backup"

declare -a BACKUP_TARGETS=(
  "$HOME/.zsh_history"
  "$HOME/.gitconfig.local"
  # /!\ SSH keys should be rotated as soon as possible.
  "$HOME/.ssh"
  "$HOME/.z"
  # "$HOME/Desktop"
  # "$HOME/Documents"
  # "$HOME/Downloads"
  # "$HOME/Pictures"
)

print_in_purple "\n • Create backup\n\n"

mkd "$backupDirectory/home"
mkd "$backupDirectory/rootLibrary/Preferences/SystemConfiguration/"

execute \
  "brew leaves > $backupDirectory/brew-list.txt" \
  "Backup the list of top-level brew installs"

execute \
  "brew list --cask > $backupDirectory/cask-list.txt" \
  "Backup the list brew cask installs"

execute \
  "cp -Rp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist $backupDirectory/rootLibrary/Preferences/SystemConfiguration/" \
  "Backup wifi preferences"

for i in "${BACKUP_TARGETS[@]}"; do
  execute \
    "cp -RLp $i $backupDirectory/home" \
    "Backup $i"
done
