"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/headup.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 19:02:25 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Display helpful screen information; good for code. Use <leader>more to toggle.
"----------------------------------------------------------------------------------

if(len(&statusline) == 0)
	set statusline=\ %F%m%r%h%w\ \ FF=%{&ff}\ \ T=%Y\ \ A=\%03.3b\ \ H=\%02.2B\ \ POS=%04l,%04v\ \ %p%%\ \ LEN=%L
endif

func! TFL_MoreMode()
	func! TFL_ToggleNums(action)
		if(a:action == "on")
			set norelativenumber
			set number
		else
			set norelativenumber
			set nonumber
		endif
	endfunc

	if(exists("g:moremodestate") == 0)
		if(&showmatch == 0)
			set showmatch
		endif

		if(&ruler == 0)
			set ruler
		endif

		if(&cursorline == 0)
			set cursorline
		endif

		silent call TFL_ToggleNums("on")

		set colorcolumn=84
		set laststatus=2

		let g:moremodestate="true"
		echo "More mode is enabled."
	elseif(g:moremodestate == "true")
		if(&showmatch == 1)
			set noshowmatch
		endif

		if(&ruler == 1)
			set noruler
		endif

		if(&cursorline == 1)
			set nocursorline
		endif

		silent call TFL_ToggleNums("off")

		set colorcolumn=0
		set laststatus=1

		unlet g:moremodestate
		echo "More mode is disabled."
	endif
endfunc

noremap <silent> <leader>more :call TFL_MoreMode()<CR>

" vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup
