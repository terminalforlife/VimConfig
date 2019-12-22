#!/bin/sh

#----------------------------------------------------------------------------------
# Project Name      - VimConfig/_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Sun 22 Dec 23:58:35 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#----------------------------------------------------------------------------------

set -e
. /usr/lib/tflbp-sh/Err
. /usr/lib/tflbp-sh/ChkDep
set +e

ChkDep ln rm

if ! [ "${PWD##*/}" == 'VimConfig' ]; then
	Err 1 "Not in the repository's root directory."
fi

for FILE in plugin/*.vim; do
	rm -v $HOME/.vim/plugin/${FILE//*\/} 2> /dev/null
	ln -v "$FILE" $HOME/.vim/plugin/${FILE//*\/} 2> /dev/null
done

for FILE in snippet/*; do
	rm -v $HOME/.vim/snippet/${FILE//*\/} 2> /dev/null
	ln -v "$FILE" $HOME/.vim/snippet/${FILE//*\/} 2> /dev/null
done

rm -v $HOME/.vim/colors/tfl.vim 2> /dev/null
ln -v colors/tfl.vim $HOME/.vim/colors/ 2> /dev/null

rm -v $HOME/.vimrc 2> /dev/null
ln -v .vimrc $HOME/ 2> /dev/null
