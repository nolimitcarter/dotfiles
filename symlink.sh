#!/bin/bash
## Symlink my dotfiles

cwd="$PWD"

# WM/Env
ln -sf "cwd"/i3/config ~/.config/i3/config
ln -sf "cwd"/.config/polybar/config ~/.config/polybar/config
## Make sure to create the launch.sh, check-all-updates, abd pavolume.sh scripts before running
ln -sf "cwd"/.config/polybar/launch.sh ~/.config/polybar/launch.sh
ln -sf "cwd"/.config/polybar/scripts/check-all-updates.sh ~/.config/polybar/scripts/check-all-updates.sh
ln -sf "cwd"/.config/polybar/scripts/pavolume.sh ~/.config/polybar/scripts/pavolume.sh
ln -sf "cwd"/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Vim
ln -sf "cwd"/vim/vimrc ~/.vimrc

# Alacritty
ln -sf "cwd"/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# Bash
ln -sf "cwd"/bash/bashrc ~/.bashrc
ln -sf "cwd"/bash/bash_aliases ~/.bash_aliases
ln -sf "cwd"/bash/bash_profile ~/.profile

# Rofi
## Make sure to make the nord.rasi file in /usr/share/rofi/themes
touch /usr/share/rofi/themes/nord.rasi
ln -sf "cwd"/.config/rofi/nord.rasi /usr/share/rofi/themes/nord.rasi

# Etc. 
ln -sf "cwd"/.config/zathura/zathurarc ~/.config/zathura/zathurarc
ln -sf "cwd"/.config/conky/conkyrc ~/.config/conky/conkyrc
ln -sf "cwd"/.fonts ~/.fonts


