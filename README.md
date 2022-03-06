# Xavier's dotfiles

This repo is a collection of my dotfiles managed by [rcm](https://github.com/thoughtbot/rcm).

## Installation

1. Download & extract the repo to ~/code/dotfiles
```bash
mkdir -p ~/code/dotfiles && curl -L https://github.com/xdmnl/dotfiles/tarball/master | tar -xzv --strip-components=1 -C ~/code/dotfiles
```
2. Execute the setup script
```bash
sh ~/code/dotfiles/src/setup.sh
```
3. Symlink your files
```bash
rcup -d ~/code/dotfiles -x README.md -x src
```

## Credits

Inspiration and code from:
* [Paul's dotfiles](https://github.com/paulirish/dotfiles)
* [Cătălin’s dotfiles](https://github.com/alrra/dotfiles)
