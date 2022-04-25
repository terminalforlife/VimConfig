"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/textwidth.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 25 Apr 18:11:42 BST 2022
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Toggles `textwidth` setting between 80 and 0, to help you keep your output
" consistent and tidy. This is especially nice when writing text files and
" command-line tools.
"------------------------------------------------------------------------------

func! TFL_TextWidth() abort
	if &textwidth == 80
		set textwidth=0
	elseif &textwidth == 0
		set textwidth=80
	endif
endfunc

noremap <silent> <leader>tw :call TFL_TextWidth()<CR>
