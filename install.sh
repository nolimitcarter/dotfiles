#!/bin/bash
# !! Does not include git cloning the repository.
# Make sure you run this script from the directory containting it.

ln -sf ~/repos/github.com/nolimitcarter/dotfiles/vim/vimrc ~/.vimrc && ln -sf ~/repos/github.com/nolimitcarter/dotfiles/bash/bashrc ~/.bashrc && ~/repos/github.com/nolimitcarter/dotfiles/bash/bash_aliases ~/.bash_aliases && ~/repos/github.com/nolimitcarter/dotfiles/alacritty/alacritty.yml  ~/.config/alacritty.yml && ln -sf ~/repos/github.com/nolimitcarter/dotfiles/tmux/tmux.conf ~/.tmux.conf 

## should i put i3 setup in here?
