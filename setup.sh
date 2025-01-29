# !/bin/bash
set -Eeuo pipefail # so that if any line fails it'll exit, bash specific !!

## setup.sh to setup any new machine that you want to import dotfiles into
## this is for linux machines, will have mac alternates in comments
# brew install fzf ripgrep stow neovim

sudo apt-get update && sudo apt-get install stow fzf ripgrep vim bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
PATH=$PATH:~/.local/bin
git clone https://github.com/orangejuicetin/.dotfiles.git
cd .dotfiles && stow vim tmux

