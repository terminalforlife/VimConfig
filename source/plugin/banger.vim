"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/banger.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 22 Mar 15:30:59 GMT 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Enter a shell user-specified (position 1) shebang, of method (position 2).
"------------------------------------------------------------------------------

func! TFL_Banger(shell, method)
	exe 'silent normal! mc'

	if (a:method == 'direct')
		if (a:shell == 'bash')
			exe "normal! ggi#!/bin/bash\<CR>\<CR>\<Esc>"
		elseif (a:shell == 'sh')
			exe "normal! ggi#!/bin/sh\<CR>\<CR>\<Esc>"
		elseif (a:shell == 'perl')
			exe "normal! ggi#!/usr/bin/perl\<CR>\<CR>\<Esc>"
		endif
	elseif (a:method == 'env')
		if (a:shell == 'bash')
			exe "normal! ggi#!/usr/bin/env bash\<CR>\<CR>\<Esc>"
		elseif (a:shell == 'sh')
			exe "normal! ggi#!/usr/bin/env sh\<CR>\<CR>\<Esc>"
		elseif (a:shell == 'perl')
			exe "normal! ggi#!/usr/bin/env perl\<CR>\<CR>\<Esc>"
		endif
	endif

	exe 'silent normal! `c'
endfunc

noremap <silent> <leader>perl :call TFL_Banger('perl', 'env')<CR>
noremap <silent> <leader>bash :call TFL_Banger('bash', 'env')<CR>
noremap <silent> <leader>shell :call TFL_Banger('sh', 'direct')<CR>
