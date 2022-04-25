"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/codedoc.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 25 Apr 18:07:39 BST 2022
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

func! TFL_DocMode() abort
	set linebreak!
	set wrap!

	if has('syntax')
		if exists('g:syntax_on')
			syntax off
		else
			syntax on
		endif
	endif

	echo 'DocMode toggled.'
endfunc

func! TFL_CodeMode() abort
	set showmatch!
	set number!

	if &colorcolumn == 80
		set colorcolumn=0
	elseif &colorcolumn == 0
		set colorcolumn=80
	endif

	echo 'CodeMode toggled.'
endfunc

noremap <silent> <leader>code :call TFL_CodeMode()<CR>
noremap <silent> <leader>doc :call TFL_DocMode()<CR>
