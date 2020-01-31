"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/autoscroll.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Fri 31 Jan 22:00:47 GMT 2020
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Toggle moving cursor and screen simultaneously, with <leader>scroll keys.
"------------------------------------------------------------------------------

func! TFL_AutoScroll()
	if(&sidescrolloff == 0 )
		set sidescrolloff=999
		set scrolloff=999

		echo "Automatic scrolling is enabled."
	elseif(&sidescrolloff > 0)
		set sidescrolloff=0
		set scrolloff=0

		echo "Automatic scrolling is disabled."
	endif
endfunc

silent call TFL_AutoScroll()

noremap <silent> <leader>scroll :call TFL_AutoScroll()<CR>
