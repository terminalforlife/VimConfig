"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/tflstatus.vim
" Started On        - Thu  8 Mar 08:53:56 GMT 2018
" Last Change       - Thu  8 Mar 09:04:35 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" A custom statusline, courtesy of TFL (terminalforlife; me!).
"----------------------------------------------------------------------------------

if(len(&statusline) == 0)
	func! StatusLine()
		" Grab the filename, if available.
		let a:fn=expand("%")
		if(len(a:fn) == 0)
			let a:fn="N/A"
		endif

		" Get the status of whether modified or not.
		let a:mod=&modified

		" Get the total word count.
		let a:wc=wordcount().words

		" Initiating this variable for easy organising.
		let a:final=""

		" These will be concatenated and sent to statusline.
		let a:final="FILE{'" . a:fn . "'} "
		let a:final=a:final . "MOD{'" . a:mod . "'} "
		let a:final=a:final . "WC{'" . a:wc . "'} "

		return a:final
	endfunc

	set statusline=%!StatusLine()
endif
