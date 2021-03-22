"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/mvline.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 22 Mar 15:09:39 GMT 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Move the current line up or down with Ctrl + l (up) and Ctrl + k (down).
"------------------------------------------------------------------------------

func! TFL_MVLine(Where)
	if (a:Where == 'up')
		exe "silent normal! :move .-2\<CR>"
	elseif (a:Where == 'down')
		exe "silent normal! :move +1\<CR>"
	endif
endfunc

noremap <silent> <C-l> :call TFL_MVLine('up')<CR>
noremap <silent> <C-k> :call TFL_MVLine('down')<CR>
