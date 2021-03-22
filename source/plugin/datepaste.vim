"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/datepaste.vim
" Started On        - Mon  5 Mar 15:34:45 GMT 2018
" Last Change       - Mon 22 Mar 15:03:19 GMT 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Display the date or time using <leader>date or <leader>time, respectively.
" The date and time are shown using the %F and %X parameters.
"------------------------------------------------------------------------------

if (exists("*strftime"))
	func! TFL_DatePaste(Type)
		exe "silent normal! mc"

		if (a:Type == 'date')
			exe "silent normal! \"_\"=strftime(\"%F\")\<CR>p"
		elseif (a:Type == 'time')
			exe "silent normal! \"_\"=strftime(\"%X\")\<CR>p"
		endif

		exe 'silent normal! `c'
	endfun
else
	echom 'ERROR: Unable to load datepaste plugin.'
endif

noremap <silent> <leader>date :silent call TFL_DatePaste('date')<CR>
noremap <silent> <leader>time :silent call TFL_DatePaste('time')<CR>
