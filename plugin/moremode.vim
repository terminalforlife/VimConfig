"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/headup.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 17:33:47 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Display helpful screen information; good for code. Use <leader>more to toggle.
"----------------------------------------------------------------------------------

let g:moremodestate="false"

func! MoreMode()
	set showmatch!
	set ruler!
	set cursorline!

	if(&relativenumber == 1 || &number == 1)
		set norelativenumber
		set nonumber
	elseif(&relativenumber == 0 && &number == 0)
		silent call LineNumAlt()
	endif

	if(g:moremodestate == "false")
		let g:moremodestate="true"
		set colorcolumn=84
		set laststatus=2
		echo "More mode is enabled."
	elseif(g:moremodestate == "true")
		let g:moremodestate="false"
		set colorcolumn=0
		set laststatus=1
		echo "More mode is disabled."
	endif
endfunc

noremap <silent> <leader>more :call MoreMode()<CR>

" vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup
