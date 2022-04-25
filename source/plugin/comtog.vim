"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/comtog.vim
" Started On        - Mon  5 Mar 17:08:12 GMT 2018
" Last Change       - Mon 25 Apr 18:17:36 BST 2022
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

func! TFL_ComTog()
	exe 'silent normal! mc'

	func! TFL_SearchLine(v)
		if search(a:v, 'cbnp', line('.')) >= 1
			return 1
		endif
	endfunc

	func! TFL_CT_CheckLine(v1, v2, v3, v4)
		if getline('.')[a:v4] == a:v1
			call cursor('.', 1)
			exe 'silent normal!' . a:v2
		else
			exe 'silent normal!' . a:v3
		endif
	endfunc

	if &ft == 'python' || &ft == 'sh' || &ft == 'perl'
		if ! TFL_SearchLine('^\(\|[ \t]\+\)#')
			exe 'silent normal! 0i#'
		else
			call TFL_CT_CheckLine('#', 'x', '0f#x', '0')
		endif
	elseif &ft == 'vim'
		if ! TFL_SearchLine('^\(\|[ \t]\+\)"')
			exe 'silent normal! 0i"'
		else
			call TFL_CT_CheckLine('"', 'x', '0f"x', '0')
		endif
	elseif &ft == 'c'
		if ! TFL_SearchLine('^\(\|[ \t]\+\)//')
			exe 'silent normal! 0i//'
		else
			call TFL_CT_CheckLine('//', 'xx', '0f/x', '0:1')
		endif
	else
		echo 'ERROR: Cannot comment -- unknown file type.'
	endif

	exe 'silent normal! `c'
endfunc

noremap <silent> <leader>jc :call TFL_ComTog()<CR>
