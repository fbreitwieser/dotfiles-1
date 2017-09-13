#!/bin/bash

set -xeu

sudo pacman -Syu
sudo pacman -S --needed gvim

sudo pacman -S --needed xorg-server xorg-xinit xorg-server-xwayland xorg-xev
sudo pacman -S --needed gnome-shell gnome-terminal gnome-control-center gdm gnome-shell-extensions nautilus gnome-screenshot gnome-backgrounds dconf-editor
sudo systemctl enable gdm
sudo pacman -S --needed gnome-tweak-tool 
yaourt -S gnome-shell-extension-installer
sudo pacman -S --needed virtualbox-guest-utils
sudo pacman -S --needed chromium gtk2

## Gnome settings
# disable animations:
gsettings set org.gnome.desktop.interface enable-animations false
# Nautilus
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'small'
gsettings set org.gnome.nautilus.list-view default-zoom-level 'small'
gsettings set org.gnome.nautilus.list-view use-tree-view true
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences recursive-search 'never'
gsettings set org.gnome.nautilus.preferences search-filter-time-type 'last_modified'
gsettings set org.gnome.nautilus.preferences search-view 'list-view'
# Terminal
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
# Shell
gsettings set org.gnome.shell favorite-apps ['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'chromium.desktop']
gsettings set org.gnome.shell enabled-extensions ['apps-menu@gnome-shell-extensions.gcampax.github.com']
