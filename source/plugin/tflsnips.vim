"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/tflsnips.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Wed 19 Jan 14:05:56 GMT 2022
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Snippets I use quite often.
"------------------------------------------------------------------------------

if filereadable(expand("$HOME/.vim/snippet/args"))
	noremap <silent> <leader>args :r $HOME/.vim/snippet/args<CR>
endif

if filereadable(expand("$HOME/.vim/snippet/setup"))
	noremap <silent> <leader>setup :r $HOME/.vim/snippet/setup<CR>
endif

if filereadable(expand("$HOME/.vim/snippet/bsetup"))
	noremap <silent> <leader>bsetup :r $HOME/.vim/snippet/bsetup<CR>
endif

if filereadable(expand("$HOME/.vim/snippet/psetup"))
	noremap <silent> <leader>psetup :r $HOME/.vim/snippet/psetup<CR>
endif

if filereadable(expand("$HOME/.vim/snippet/die"))
	noremap <silent> <leader>die :r $HOME/.vim/snippet/die<CR>
endif

if filereadable(expand("$HOME/.vim/snippet/bdie"))
	noremap <silent> <leader>bdie :r $HOME/.vim/snippet/bdie<CR>
endif

if filereadable(expand("$HOME/.vim/snippet/usage"))
	noremap <silent> <leader>usage :r $HOME/.vim/snippet/usage<CR>
endif

if filereadable(expand("$HOME/.vim/snippet/busage"))
	noremap <silent> <leader>busage :r $HOME/.vim/snippet/busage<CR>
endif

noremap <silent> <leader>bar 0i#<Esc>78a-<Esc>0
