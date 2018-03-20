"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/mouseon.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Tue 20 Mar 15:05:31 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" If in a PTS, toggle mouse support with <leader>mouse keys.
"----------------------------------------------------------------------------------

func! TFL_MouseSupport()
	if ! has("gui_running")
		if ! has("mouse")
			echo "ERROR: Mouse support is unavailable."
			finish
		endif

		if(len($DISPLAY) > 0 )
			if(exists("g:mousesupportstate") == 0)
				set nomousehide
				set mouse=a

				let g:mousesupportstate="true"
				echo "Mouse support enabled."
			elseif(g:mousesupportstate == "true")
				set mousehide
				set mouse=

				unlet g:mousesupportstate
				echo "Mouse support disabled."
			endif
		else
			echo "ERROR: Uknown display -- are you in a TTY?"
		endif
	else
		echo "ERROR: Mouse support already enabled in GUI."
	endif
endfunc

silent call TFL_MouseSupport()

noremap <silent> <leader>mouse :call TFL_MouseSupport()<CR>
