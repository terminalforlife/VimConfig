"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/gcmsg/gcmsg.vim
" Started On        - Tue  5 Nov 17:44:41 GMT 2019
" Last Change       - Mon 25 Apr 19:41:51 BST 2022
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

func! TFL_GCMSG() abort
	if &ft == 'gitcommit'
		func! s:TFL_GCMSG_CursorMoved() abort
			let l:Position = getcurpos()
			let l:Subject = getline('.')

			if has('spell')
				set spell
			endif

			if l:Position[1] == 2
				set colorcolumn=50
				set textwidth=0

				if len(l:Subject) >= 50
					exe "silent normal! 2G49ld$"
					echo "Err: Subject length too long -- snipped."
				endif
			elseif l:Position[1] >= 5
				set colorcolumn=72
				set textwidth=71
			else
				set colorcolumn=0
			endif
		endfunc

		exe "silent normal! ggdG"
		exe "silent normal! i# Enter subject in under fifty characters:\<Enter>\<Enter>"
		exe "silent normal! i\<Enter># Enter main body of Markdown text:\<Enter>\<Esc>2G"

		autocmd CursorMoved * call s:TFL_GCMSG_CursorMoved()
	endif
endfunc

autocmd BufRead * call TFL_GCMSG()
