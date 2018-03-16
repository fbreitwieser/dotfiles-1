#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;
#git submodule update --init --recursive --remote

#curl -fLo .vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


function doIt() {
	rsync $1 --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".macos" \
		--exclude ".archlinux" \
		--include "/bin/" \
		--exclude "/[a-zA-Z]*" \
		-avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	echo "Proposed changes: "
	doIt -n
	read -p "Do it? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
		source ~/.bash_profile;
	fi;
fi;
unset doIt;
