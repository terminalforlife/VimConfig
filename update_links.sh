#!/bin/bash

#----------------------------------------------------------------------------------
# Project Name      - miscellaneous/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Fri 26 Apr 14:49:18 BST 2019
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
	/bin/rm -v $HOME/.vim/plugin/${FILE//*\/} 2>&-
	/bin/ln -v "$FILE" $HOME/.vim/plugin/${FILE//*\/} 2>&-
}

for FILE in snippet/*; {
	/bin/rm -v $HOME/.vim/snippet/${FILE//*\/} 2>&-
	/bin/ln -v "$FILE" $HOME/.vim/snippet/${FILE//*\/} 2>&-
}

/bin/rm -v $HOME/.vim/colors/tfl.vim 2>&-
/bin/ln -v colors/tfl.vim $HOME/.vim/colors/ 2>&-

/bin/rm -v $HOME/.vimrc 2>&-
/bin/ln -v .vimrc $HOME/ 2>&-

# vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup
