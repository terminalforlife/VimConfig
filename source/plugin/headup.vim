"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/headup.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Thu 13 Jul 15:47:28 BST 2023
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

func! TFL_HeadUp(action) abort
	if exists('*strftime')
		exe 'silent normal! mc'

		if (a:action ==# "place")
			exe "silent normal! i#\<Esc>78a-\<Esc>o"
			exe "silent normal! i# Project Name      - \<CR>"
			exe "silent normal! i# Started On        - \<Esc>\"_\"=strftime(\"%a %_d %b %T %Z %Y\")\<CR>po"
			exe "silent normal! i# Last Change       - \<Esc>\"_\"=strftime(\"%a %_d %b %T %Z %Y\")\<CR>po"
			exe "silent normal! i# Author E-Mail     - terminalforlife@yahoo.com\<CR>"
			exe "silent normal! i# Author GitHub     - https://github.com/terminalforlife\<CR>"
			exe "silent normal! i#\<Esc>78a-\<Esc>0o"
		elseif (a:action ==# 'update')
			if search("^[#/\"]* Last Change\\s*- ", 'ep')
				exe "silent normal! ld$\"_\"=strftime(\"%a %_d %b %T %Z %Y\")\<CR>p"

				" Update version string, for Shell and PERL.
				if search('^_VERSION_="', 'ep')
					exe "silent normal! di\"\"=strftime(\"%F\")\<CR>P"
				elseif search("^CurVer='", 'ep')
					exe "silent normal! di'\"=strftime(\"%F\")\<CR>P"
				elseif search("^CurVer = '", 'ep')
					exe "silent normal! di'\"=strftime(\"%F\")\<CR>P"
				elseif search('^my $CurVer = "', 'ep')
					exe "silent normal! di\"\"=strftime(\"%F\")\<CR>P"
				elseif search("^my $CurVer = '", 'ep')
					exe "silent normal! di'\"=strftime('%F')\<CR>P"
				elseif search("^use constant VERSION => '", 'ep')
					exe "silent normal! di'\"=strftime('%F')\<CR>P"
				endif
			endif
		endif

		exe "silent normal! `c"
	else
		echo 'Err: Unable to find `strftime()` builtin.'
	endif
endfunc

noremap <silent> <leader>header :call TFL_HeadUp('place')<CR>
noremap <silent> <leader>save :call TFL_HeadUp('update')<CR>
