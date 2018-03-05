"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/virtedit.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 20:26:55 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle virtual editing functionality. Use with: <leader>virt
"----------------------------------------------------------------------------------

func! TFL_VirtualEdit()
	if(exists("g:virtualeditstate") == 0)
		set virtualedit=all

		let g:virtualeditstate="true"
		echo "Virtual editing is enabled."
	elseif(g:virtualeditstate == "true")
		set virtualedit=

		unlet g:virtualeditstate
		echo "Virtual editing is disabled."
	endif
endfunc

noremap <silent> <leader>virt :call TFL_VirtualEdit()<CR>
