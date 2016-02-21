# copy paste this file in bit by bit.
# don't run it.
echo "Do not run this script in one go. hit ctrl-c NOW"
read -n 1

################################################################################
# Migration from old machine

# z history file.
cp ~/.z ~/migration
# You shouldn't share ssh-keys between computers but lets backup them
cp -R ~/.ssh ~/migration
# .gitconfig.local is ignored but managed by rcup too
cp -i ~/.gitconfig.local ~/migration

# end of migration
################################################################################

# Setup osx
./extra/osx.sh

# Homebrew!
./extra/brew.sh
./extra/brew-cask.sh

# Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh#basic-installation)
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Symlink dotfiles
rcup -d ~/code/dotfiles -v

# iTerm
# Preferences > General > Load preferences from folder ~/code/dotfiles/extra/com.googlecode.iterm2.plist
