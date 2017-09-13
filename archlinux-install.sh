#!/bin/bash

set -xeu

sudo pacman -Syu
#sudo pacman -S vim # conflicts with gvim
sudo pacman --needed -S rsync tmux reflector expac yajl bash-completion

## Update to fastest mirrot
if ! grep -q reflector /etc/pacman.d/mirrorlist; then
  reflector -l 100 -f 50 -c US --sort rate --threads 5 --verbose --save mirrorlist.tmp
  rankmirrors -n 0 mirrorlist.tmp > ranked.mirrorlist.tmp
  sudo mv ranked.mirrorlist.tmp /etc/pacman.d/mirrorlist
  rm mirrorlist.tmp
fi


. .aliases-linux 
aurinstall package-query yaourt


