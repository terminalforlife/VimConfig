"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/virtedit.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 25 Apr 18:14:57 BST 2022
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

func! TFL_VirtualEdit()
	if has('virtualedit')
		if &virtualedit == ''
			set virtualedit=all
		elseif &virtualedit == 'all'
			set virtualedit=
		endif
	else
		echo "Err: Virtual editing unavailable."
	endif
endfunc

noremap <silent> <leader>virt :call TFL_VirtualEdit()<CR>
