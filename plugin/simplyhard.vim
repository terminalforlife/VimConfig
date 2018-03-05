"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/simplyhard.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 23:41:40 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggles a stricter VIM, in a simpler way. Use with <leader>hard keys.
"----------------------------------------------------------------------------------

func! TFL_SimplyHard()
	if(exists("g:simplyhardstate") == 0)
		noremap j <Nop>
		noremap k <Nop>
		noremap l <Nop>
		noremap ; <Nop>

		let g:simplyhardstate="true"
		echo "SimplyHard is enabled."
	elseif(g:simplyhardstate == "true")
		noremap ; l
		noremap l k
		noremap k j
		noremap j h

		unlet g:simplyhardstate
		echo "SimplyHard is disabled."
	endif
endfunc

noremap <silent> <leader>hard :call TFL_SimplyHard()<CR>
