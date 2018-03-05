"----------------------------------------------------------------------------------
" Project Name      - vimconfig/VimPlugins/datepaste
" Started On        - Mon  5 Mar 15:34:45 GMT 2018
" Last Change       - Mon  5 Mar 15:55:11 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------

func! DatePaste(method)
	if(a:method == "strftime")
		exe "silent normal! test"
	else
		echo "ERROR: Invalid method selected."
	endif
endfun
