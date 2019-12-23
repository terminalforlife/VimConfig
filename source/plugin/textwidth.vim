"----------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/textwidth.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 23 Dec 00:07:05 GMT 2019
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle between textwidth 84 and textwidth 0, with <leader>tw keys.
"----------------------------------------------------------------------------------

func! TFL_TextWidth()
	if(exists("g:textwidthmode") == 0)
		set textwidth=84

		let g:textwidthmode="true""
		echo "TextWidth() is enabled."
	else
		set textwidth=0

		unlet g:textwidthmode
		echo "TextWidth() is disabled."
	endif
endfunc

noremap <silent> <leader>tw :call TFL_TextWidth()<CR>
