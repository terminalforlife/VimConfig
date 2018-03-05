"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/headup.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 19:12:25 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Enter a shell user-specified (position 1) shebang, of method (position 2).
"----------------------------------------------------------------------------------

func! TFL_Banger(shell, method)
	if(a:method == "default")
		if(a:shell == "bash")
			exe "normal! ggi#!/bin/bash\<CR>\<CR>\<Esc>G"
		elseif(a:shell == "sh")
			exe "normal! ggi#!/bin/sh\<CR>\<CR>\<Esc>G"
		else
			echo "ERROR: Invalid shell type."
		endif
	elseif(a:method == "env")
		if(a:shell == "bash")
			exe "normal! ggi#!/usr/bin/env bash\<CR>\<CR>\<Esc>G"
		elseif(a:shell == "sh")
			exe "normal! ggi#!/usr/bin/env sh\<CR>\<CR>\<Esc>G"
		else
			echo "ERROR: Invalid shell environment type."
		endif
	endif
endfunc

noremap <silent> <leader>bash :call TFL_Banger("bash", "default")<CR>
noremap <silent> <leader>shell :call TFL_Banger("sh", "default")<CR>
