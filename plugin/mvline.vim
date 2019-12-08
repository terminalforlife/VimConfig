"----------------------------------------------------------------------------------
" Project Name      - VimConfig/plugin/mvline.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Sun  8 Dec 21:13:24 GMT 2019
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Move the current line up or down with Ctrl + l (up) and Ctrl + k (down). These
" bindings only work if you're using the noarrows plugin, otherwise it'll use the
" default VIM Ctrl + k (up) and Ctrl + j (down) keybindings.
"----------------------------------------------------------------------------------

func! TFL_MVLine(where)
	if(a:where == "up")
		exe "silent normal! :move .-2\<CR>"
	elseif(a:where == "down")
		exe "silent normal! :move +1\<CR>"
	endif
endfunc

if(exists("$HOME/.vim/plugin/mvline.vim") == 1)
	noremap <silent> <C-l> :call TFL_MVLine("up")<CR>
	noremap <silent> <C-k> :call TFL_MVLine("down")<CR>

	inoremap <silent> <C-l> \<Esc>mc:call TFL_MVLine("up")<CR>`cil
	inoremap <silent> <C-k> \<Esc>mc:call TFL_MVLine("down")<CR>`cil

	vnoremap <silent> <C-l> :call TFL_MVLine("up")<CR>
	vnoremap <silent> <C-k> :call TFL_MVLine("down")<CR>
else
	noremap <silent> <C-k> :call TFL_MVLine("up")<CR>
	noremap <silent> <C-j> :call TFL_MVLine("down")<CR>

	inoremap <silent> <C-k> \<Esc>mc:call TFL_MVLine("up")<CR>`cil
	inoremap <silent> <C-j> \<Esc>mc:call TFL_MVLine("down")<CR>`cil

	vnoremap <silent> <C-k> :call TFL_MVLine("up")<CR>
	vnoremap <silent> <C-j> :call TFL_MVLine("down")<CR>
endif
