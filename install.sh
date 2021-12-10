#!/bin/bash
sudo pacman -Syu
sudo pacman -Sy stow curl vim gcc cmake g++ zsh

#install powerline fonts
git clone git@github.com:powerline/fonts.git
pushd fonts
./install.sh
popd
rm -r fonts

# stow dotfiles
./stowfiles.sh

#make zsh default 
sudo chsh -s $(which zsh) $USER
# anitbody zsh framework
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
