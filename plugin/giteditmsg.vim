"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/giteditmsg.vim
" Started On        - Tue  5 Nov 17:44:41 GMT 2019
" Last Change       - Tue  5 Nov 19:05:47 GMT 2019
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" To be written...
"----------------------------------------------------------------------------------

func! TFL_GitEditMSG()
	func! TFL_CursorMoved()
		let a:pos=getcurpos()

		if(a:pos[1] == 2)
			set colorcolumn=50
		elseif(a:pos[1] >= 4)
			set colorcolumn=72
		else
			set colorcolumn=0
		endif
	endfunc

	if(&ft == "gitcommit")
		exe "silent normal! ggdG"
		exe "silent normal! i# Enter summary in under fifty characters:\<Enter>\<Enter>"
		exe "silent normal! i# Enter main body of Markdown text:\<Enter>\<Esc>2G"
	endif

	autocmd CursorMoved * call TFL_CursorMoved()
endfunc

autocmd BufRead * call TFL_GitEditMSG()
