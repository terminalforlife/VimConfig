#!/bin/bash

#----------------------------------------------------------------------------------
# Project Name      - VimConfig/update_links.sh
# Started On        - Sun 22 Oct 00:15:02 BST 2017
# Last Change       - Mon 18 Nov 16:18:50 GMT 2019
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#----------------------------------------------------------------------------------
# Just a simple, quick script to update the hard links when changing branches.
#----------------------------------------------------------------------------------

FAIL(){
	printf "[L%0.4d] ERROR: %s\n" "$2" "$3" 1>&2
	[ $1 -eq 1 ] && exit 1
}

declare -i DEPCOUNT=0
for DEP in rm ln; {
	if ! type -fP "$DEP" > /dev/null 2>&1; then
		FAIL 0 "$LINENO" "Dependency '$DEP' not met."
		DEPCOUNT+=1
	fi
}

[ $DEPCOUNT -eq 0 ] || exit 1

if ! [ "${PWD//*\/}" == "VimConfig" ]; then
	FAIL 1 "$LINENO" "Not in the repository's root directory."
fi

for FILE in plugin/*.vim; {
	rm -v $HOME/.vim/plugin/${FILE//*\/} 2>&-
	ln -v "$FILE" $HOME/.vim/plugin/${FILE//*\/} 2>&-
}

for FILE in snippet/*; {
	rm -v $HOME/.vim/snippet/${FILE//*\/} 2>&-
	ln -v "$FILE" $HOME/.vim/snippet/${FILE//*\/} 2>&-
}

rm -v $HOME/.vim/colors/tfl.vim 2>&-
ln -v colors/tfl.vim $HOME/.vim/colors/ 2>&-

rm -v $HOME/.vimrc 2>&-
ln -v .vimrc $HOME/ 2>&-
