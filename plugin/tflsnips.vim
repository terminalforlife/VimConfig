"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/virtedit.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Fri 30 Mar 02:04:58 BST 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Various incredibly useful snippet-like things. Edit as needed... good luck.
"----------------------------------------------------------------------------------

if filereadable(expand("$HOME") . "/.vim/snippet/setup")
	noremap <silent> <leader>setup :r $HOME/.vim/snippet/setup<CR>
endif

if filereadable(expand("$HOME") . "/.vim/snippet/modeline")
	noremap <silent> <leader>modeline :r $HOME/.vim/snippet/modeline<CR>
endif

if filereadable(expand("$HOME") . "/.vim/snippet/error")
	noremap <silent> <leader>err :r $HOME/.vim/snippet/error<CR>
endif

noremap <silent> <leader>bar 0i#<Esc>82a-<Esc>0
