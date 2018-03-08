#!/bin/bash

#----------------------------------------------------------------------------------
# Project Name      - miscellaneous/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Thu  8 Mar 06:01:03 GMT 2018
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#----------------------------------------------------------------------------------

XERR(){ printf "[L%0.4d] ERROR: %s\n" "$1" "$2" 1>&2; exit 1; }
ERR(){ printf "[L%0.4d] ERROR: %s\n" "$1" "$2" 1>&2; }

declare -i DEPCOUNT=0
for DEP in /bin/{ln,rm}; {
	if ! [ -x "$DEP" ]; then
		ERR "$LINENO" "Dependency '$DEP' not met."
		DEPCOUNT+=1
	fi
}

[ $DEPCOUNT -eq 0 ] || exit 1

if ! [ "${PWD//*\/}" == "vimconfig" ]; then
	XERR "$LINENO" "Not in the repository's root directory."
fi

for FILE in plugin/*.vim; {
	/bin/rm -v $HOME/.vim/plugin/${FILE//*\/} 2> /dev/null
	/bin/ln -v "$FILE" $HOME/.vim/plugin/${FILE//*\/} 2> /dev/null
}

/bin/rm -v $HOME/.vim/colors/tfl.vim 2> /dev/null
/bin/ln -v colors/tfl.vim $HOME/.vim/colors/ 2> /dev/null

/bin/rm -v $HOME/.vimrc 2> /dev/null
/bin/ln -v .vimrc $HOME/ 2> /dev/null

# vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup
