"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/togtrans.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Tue  6 Mar 19:56:54 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle background transparency. (for use in a terminal) Use with: <leader>trans
"----------------------------------------------------------------------------------

func! TFL_TogTrans()
	let a:buffer = synIDattr(hlID("Normal"), "bg")

	if(len(a:buffer) == 0)
		hi Normal ctermbg=0
	else
		hi Normal ctermbg=NONE
	endif

	unlet a:buffer
endfunc

noremap <silent> <leader>trans :call TFL_TogTrans()<CR>
