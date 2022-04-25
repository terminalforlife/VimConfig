#!/bin/sh

#------------------------------------------------------------------------------
# Project Name      - VimConfig/devutils/links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Mon 25 Apr 18:21:43 BST 2022
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#------------------------------------------------------------------------------

exec 2> /dev/null

if cd "$HOME/GitHub/terminalforlife/Personal/VimConfig/source"; then
	mkdir -pv "$HOME/.vim/plugin"
	mkdir -pv "$HOME/.vim/snippet"
	mkdir -pv "$HOME/.vim/colors"

	for File in plugin/*.vim; do
		ln -vf "$File" $HOME/.vim/plugin/${File##*/}
	done

	for File in snippet/*; do
		ln -vf "$File" $HOME/.vim/snippet/${File##*/}
	done

	ln -vf colors/tfl.vim $HOME/.vim/colors/
	ln -vf colors/tfl-subtle.vim $HOME/.vim/colors/
	ln -vf .vimrc $HOME/
fi
