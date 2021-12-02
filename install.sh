#!/bin/bash

sudo pacman -S stow curl vim

#install powerline fonts
git clone git@github.com:powerline/fonts.git
pushd fonts
./install.sh
popd
rm -r fonts
