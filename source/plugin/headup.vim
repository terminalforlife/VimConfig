"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/headup.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  2 Aug 12:34:41 BST 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Add and update header and its timestamp, including instances of `CurVer=''`
" or `_VERSION_=""` variable (assignment) datestamp in shell scripts, if this
" variable is found. Also cleans up spacing. Does not save; that's up to you.
"
" For now, you'll have to change header information (E-Mail and GitHub entries)
" to match your own; it'll hopefully be more user-friendly in the future.
"
" To use, enter <leader>header to place it, and <leader>save to update it & the
" aforementioned variable's value, if it's found at the very start of a line.
"------------------------------------------------------------------------------

func! TFL_HeadUp(action)
	if (exists("*strftime") == 1)
		if (a:action == "place")
			exe "silent normal! i#\<Esc>78a-\<Esc>o"
			exe "silent normal! i# Project Name      - \<CR>"
			exe "silent normal! i# Started On        - \<Esc>\"_\"=strftime(\"%a %_d %b %T %Z %Y\")\<CR>po"
			exe "silent normal! i# Last Change       - \<Esc>\"_\"=strftime(\"%a %_d %b %T %Z %Y\")\<CR>po"
			exe "silent normal! i# Author E-Mail     - terminalforlife@yahoo.com\<CR>"
			exe "silent normal! i# Author GitHub     - https://github.com/terminalforlife\<CR>"
			exe "silent normal! i#\<Esc>78a-\<Esc>0o"
		elseif (a:action == 'update')
			exe 'silent normal! mc'

			if (search("^[#/\"]* Last Change\\s*- ", 'ep') > 0)
				exe "silent normal! ld$\"_\"=strftime(\"%a %_d %b %T %Z %Y\")\<CR>p"
				if (search('^_VERSION_="', 'ep') > 0)
					" Shell syntax support. (pre: 2019-11-29)
					exe "silent normal! di\"\"=strftime(\"%F\")\<CR>P"
				elseif (search("^CurVer='", 'ep') > 0)
					" Alternative shell syntax support. (post: 2019-11-29)
					exe "silent normal! di'\"=strftime(\"%F\")\<CR>P"
				elseif (search('^my $CurVer = "', 'ep') > 0)
					" Perl syntax support.
					exe "silent normal! di\"\"=strftime(\"%F\")\<CR>P"
				elseif (search("^my $CurVer = '", 'ep') > 0)
					" Alternative Perl syntax support. (post: 2020-02-02)
					exe "silent normal! di'\"=strftime('%F')\<CR>P"
				endif
			endif
		endif

		exe "silent normal! `c"
	else
		echo "ERROR: Unable to find strftime() builtin."
	endif
endfunc

noremap <silent> <leader>header :call TFL_HeadUp('place')<CR>
noremap <silent> <leader>save :call TFL_HeadUp('update')<CR>
