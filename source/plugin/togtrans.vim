"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/togtrans.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Fri 31 Jan 22:08:10 GMT 2020
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" [T]oggle background [t]ransparency. (for the terminal) Use with: <leader>tt
"------------------------------------------------------------------------------

func! TFL_TogTrans()
	if ! has("gui_running")
		let a:buffer = synIDattr(hlID("Normal"), "bg")

		if(len(a:buffer) == 0)
			hi Normal ctermbg=0
		else
			hi Normal ctermbg=NONE
		endif

		unlet a:buffer
	else
		echo "ERROR: Cannot toggle transparency in a GUI."
	endif
endfunc

noremap <silent> <leader>tt :call TFL_TogTrans()<CR>
