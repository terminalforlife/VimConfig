"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/textwidth.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 22 Mar 15:53:51 GMT 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Toggle between textwidth 84 and textwidth 0, with <leader>tw keys.
"------------------------------------------------------------------------------

func! TFL_TextWidth()
	if ! (exists("g:TextWidthMode"))
		set textwidth=84

		let g:TextWidthMode='true'
		echo 'TextWidth() is enabled.'
	else
		set textwidth=0

		unlet g:TextWidthMode
		echo 'TextWidth() is disabled.'
	endif
endfunc

noremap <silent> <leader>tw :call TFL_TextWidth()<CR>
