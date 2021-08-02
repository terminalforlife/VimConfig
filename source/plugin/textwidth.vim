"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/textwidth.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  2 Aug 17:33:57 BST 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Toggle between textwidth 84 and textwidth 0, with <leader>tw keys.
"------------------------------------------------------------------------------

func! TFL_TextWidth() abort
	if ! (exists("s:TextWidthMode"))
		set textwidth=80

		let s:TextWidthMode='true'
		echo 'Parameter `textwidth` set to `80`.'
	else
		set textwidth=0

		unlet s:TextWidthMode
		echo 'Parameter `textwidth` disabled.'
	endif
endfunc

noremap <silent> <leader>tw :call TFL_TextWidth()<CR>
