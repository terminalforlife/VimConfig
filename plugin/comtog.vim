"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/comtog.vim
" Started On        - Mon  5 Mar 17:08:12 GMT 2018
" Last Change       - Wed  7 Mar 23:23:27 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle one or more lines of text, depending on the laguage the currently edited
" file is using or marked as. Currently supports shell, python, c, and vimscript.
"
" Use <leader>jf to [j]ust toggle the [c]ommenting of lines. Be careful when
" toggling multiple lines, as they will all be toggled.
"----------------------------------------------------------------------------------

func! TFL_ComTog()
	exe "silent normal! mc"

	func! TFL_SearchLine(value)
		if(search(a:value, "cbnp", line(".")) == 1)
			return 1
		endif
	endfunc

	if(&ft == "python" || &ft == "sh")
		if ! TFL_SearchLine("^#")
			exe "silent normal! 0i#"
		else
			exe "silent normal! 0x"
		endif
	elseif(&ft == "vim")
		if ! TFL_SearchLine("^\"")
			exe "silent normal! 0i\""
		else
			exe "silent normal! 0x"
		endif
	elseif(&ft == "c")
		if ! TFL_SearchLine("^//")
			exe "silent normal! 0i//"
		else
			exe "silent normal! 0xx"
		endif
	else
		echo "ERROR: Cannot comment -- unknown file type."
	endif

	exe "silent normal! `c"
endfunc

noremap <silent> <leader>jc :call TFL_ComTog()<CR>
