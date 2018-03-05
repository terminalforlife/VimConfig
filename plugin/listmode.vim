"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/listmode.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 22:31:42 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle ListMode, with the <leader>list keys.
"----------------------------------------------------------------------------------

set listchars=tab:»→,trail:␣,extends:#,nbsp:⊗

func! TFL_ListMode()
	set list!

	if &list
		echo "List mode is enabled."
	else
		echo "List mode is disabled."
	endif
endfunc

noremap <silent> <leader>list :call TFL_ListMode()<CR>
