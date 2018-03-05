"----------------------------------------------------------------------------------
" Project Name      - vimconfig/VimPlugins/datepaste
" Started On        - Mon  5 Mar 15:34:45 GMT 2018
" Last Change       - Mon  5 Mar 15:36:38 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------

let _VERSION_="2018-03-05"

func! DatePaste(method)
	if(a:method == "strftime")
		exe "silent normal! iasdfas"
	else
		echo "ERROR: Invalid method selected."
	endif
endfun

call DatePaste("strftime")
