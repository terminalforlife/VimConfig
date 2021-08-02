"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/gcmsg/gcmsg.vim
" Started On        - Tue  5 Nov 17:44:41 GMT 2019
" Last Change       - Mon  2 Aug 17:17:18 BST 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" For information, refer to 'readme.txt' file in this directory.
"------------------------------------------------------------------------------

if !exists('g:GCMSG_Sections')
	let g:GCMSG_Sections = 0
endif

func! TFL_GCMSG() abort
	if &ft == 'gitcommit'
		func! TFL_CursorMoved() abort
			let l:Position = getcurpos()
			let l:Subject = getline('.')

			if has('spell')
				set spell
			endif

			if l:Position[1] == 2
				set colorcolumn=50
				set textwidth=0

				if(len(l:Subject) >= 50)
					exe "silent normal! 2G49ld$"
					echo "ERROR: Subject length was too long."
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

		if g:GCMSG_Sections
			exe "silent normal! GiBugFixes:\<Enter>\<Enter>  * \<Enter>\<Enter>\<Esc>"
			exe "silent normal! iFeatures:\<Enter>\<Enter>  * \<Enter>\<Enter>\<Esc>"
			exe "silent normal! iCodeBits:\<Enter>\<Enter>  * \<Esc>2G"
		endif

		autocmd CursorMoved * call TFL_CursorMoved()
	endif
endfunc

autocmd BufRead * call TFL_GCMSG()
