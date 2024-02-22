# !/bin/bash

## setup.sh to setup any new machine that you want to import dotfiles into
## this is for linux machines, will have mac alternates in comments
# brew install fzf ripgrep stow

sudo apt-get update && sudo apt-get install stow 
git clone https://github.com/orangejuicetin/.dotfiles.git 
cd .dotfiles && stow vim tmux zsh

