"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/tflstatus.vim
" Started On        - Thu  8 Mar 08:53:56 GMT 2018
" Last Change       - Thu  8 Mar 08:55:33 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------

if(len(&statusline) == 0)
	func! StatusLine()
		let a:fn=expand("%")
		if(len(a:fn) == 0)
			let a:fn="N/A"
		endif

		let a:mod=&modified
		let a:wc=wordcount().words
		let a:final="FILE{'" . a:fn . "'} "
		let a:final=a:final . "WC{'" . a:wc . "'} "
		let a:final=a:final . "MOD{'" . a:mod . "'}"
		return a:final
	endfunc

	set statusline=%!StatusLine()
endif
