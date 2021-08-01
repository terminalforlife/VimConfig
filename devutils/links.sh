#!/bin/sh

#------------------------------------------------------------------------------
# Project Name      - VimConfig/devutils/links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Sun  1 Aug 20:41:23 BST 2021
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#------------------------------------------------------------------------------

{
	if cd "$HOME/GitHub/terminalforlife/Personal/VimConfig/source"; then
		mkdir -pv "$HOME/.vim/plugin"
		mkdir -pv "$HOME/.vim/snippet"
		mkdir -pv "$HOME/.vim/colors"
		mkdir -pv "$HOME/.config/nvim"

		if command -v vim 1> /dev/null; then
			for FILE in plugin/*.vim; do
				rm -v $HOME/.vim/plugin/${FILE##*/} &&
					ln -v "$FILE" $HOME/.vim/plugin/${FILE##*/}
			done

			for FILE in snippet/*; do
				rm -v $HOME/.vim/snippet/${FILE##*/} &&
					ln -v "$FILE" $HOME/.vim/snippet/${FILE##*/}
			done

			rm -v $HOME/.vim/colors/tfl.vim &&
				ln -v colors/tfl.vim $HOME/.vim/colors/

			rm -v $HOME/.vim/colors/tfl-subtle.vim &&
				ln -v colors/tfl-subtle.vim $HOME/.vim/colors/

			rm -v $HOME/.vimrc && ln -v .vimrc $HOME/

			rm -v $HOME/init.vim && ln -v .vimrc $HOME/.config/nvim/
		fi
	fi
} 2> /dev/null
