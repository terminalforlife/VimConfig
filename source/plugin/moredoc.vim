"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/moredoc.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Sun  1 Aug 23:39:10 BST 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Display helpful screen information; good for code. Use <leader>more to
" toggle. Use VIM as a standard text editor, for non-code. Use with <leader>doc
" to toggle.
"
" Will also animate open and close the `colorcolumn`.
"
" Regarding `redraw`: must force Vim to redraw, as it otherwise doesn't work.
"------------------------------------------------------------------------------

func! TFL_DocMode(...)
	if ! (exists("g:docmodestate"))
		set linebreak
		set wrap
		syntax off

		let g:docmodestate='true'
		echo 'Document Mode is enabled.'
	elseif (g:docmodestate == 'true')
		set nolinebreak
		set nowrap
		syntax on

		unlet g:docmodestate
		echo 'Document Mode is disabled.'
	endif
endfunc

func! TFL_MoreMode()
	if ! has('statusline')
		echo 'ERROR: One or more missing features.'
		finish
	endif

	if (exists("g:moremodestate") == 0)
		set showmatch
		set ruler
		set norelativenumber
		set number

		" Sexy wee open animation.
		while &colorcolumn < 80
			redraw
			let &colorcolumn = &colorcolumn + 1
			sleep 1m
		endwhile

		set laststatus=2

		" Disabled because `cursorline` is too slow.
		"set cursorline

		let g:moremodestate='true'
		echo 'More mode is enabled.'
	elseif (g:moremodestate == 'true')
		set noshowmatch
		set noruler
		set norelativenumber
		set nonumber
		set laststatus=1

		" Sexy wee close animation.
		while &colorcolumn > 0
			redraw
			let &colorcolumn = &colorcolumn - 1
			sleep 1m
		endwhile

		" Disabled because `cursorline` is too slow.
		"set nocursorline

		unlet g:moremodestate
		echo 'More mode is disabled.'
	endif
endfunc

noremap <silent> <leader>more :call TFL_MoreMode()<CR>
noremap <silent> <leader>doc :call TFL_DocMode('true')<CR>
