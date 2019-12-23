"----------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/autoscroll.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 23 Dec 00:05:45 GMT 2019
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle moving the cursor and the screen simultaneously, with <leader>scroll keys.
"----------------------------------------------------------------------------------

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
