"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/tflstatus.vim
" Started On        - Thu  8 Mar 08:53:56 GMT 2018
" Last Change       - Thu  8 Mar 09:59:18 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" A custom statusline, courtesy of TFL (terminalforlife; me!).
"----------------------------------------------------------------------------------

if(len(&statusline) == 0)
	func! StatusLine()
		let a:fn=expand("%:t")
		if(len(a:fn) == 0)
			let a:fn="N/A"
		endif

		let a:mod=&modified
		let a:wc=wordcount().words

		let a:bytes=getfsize(expand("%"))
		if ! (a:bytes == "-1")
			if(a:bytes < 1024)
				let a:bytes=a:bytes . "B"
			elseif(a:bytes >= 1024)
				let a:bytes=a:bytes/1024 . "K"
			elseif(a:bytes >= 1048576)
				let a:bytes=a:bytes/1024/1024 . "M"
			endif
		else
			let a:bytes="N/A"
		endif

		let a:ft=&ft
		if(len(a:ft) == 0)
			let a:ft="N/A"
		endif

		let a:final="FILE{'" . a:fn . "'} "
		let a:final=a:final . "MOD{'" . a:mod . "'} "
		let a:final=a:final . "TYPE{'" . a:ft . "'} "
		let a:final=a:final . "WC{'" . a:wc . "'} "
		let a:final=a:final . "SIZE{'" . a:bytes . "'} "

		return a:final
	endfunc

	set statusline=%!StatusLine()
endif
