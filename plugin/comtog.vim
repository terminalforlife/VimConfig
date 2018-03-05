"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/comtog.vim
" Started On        - Mon  5 Mar 17:08:12 GMT 2018
" Last Change       - Mon  5 Mar 17:58:00 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" A function responsible for both un- and commenting lines of text, depending on
" the laguage the currently edited file is using or marked as. Currently supports
" shell, python, and vimscript.
"
" Use <leader>co to [c]omment [o]ut a line, and use <leader>uc to [u]n[c]omment.
"----------------------------------------------------------------------------------

func! TFL_ComTog(action)
	exe "silent normal! mc"

	if(a:action == "comment")
		if(&filetype == "python" || &filetype == "sh")
			exe "silent normal! 0i#\<Esc>"
		elseif(&filetype == "vim")
			exe "silent normal! 0i\"\<Esc>"
		elseif(len(&filetype) == 0)
			echo "ERROR: Cannot comment -- missing file type."
		else
			echo "ERROR: Cannot comment -- unknown file type."
		endif
	elseif(a:action == "uncomment")
		if(len(&filetype) > 0)
			exe "silent normal! 0x"
		elseif(len(&filetype) == 0)
			echo "ERROR: Cannot comment -- missing file type."
		else
			echo "ERROR: Cannot comment -- unknown file type."
		endif
	else
		echo "ERROR: Invalid action at position 1."
	endif

	exe "silent normal! `c"
endfunc

noremap <silent> <leader>co :call TFL_ComTog("comment")<CR>
noremap <silent> <leader>uc :call TFL_ComTog("uncomment")<CR>

" vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup
