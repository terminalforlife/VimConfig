"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/sudosave.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 23:46:39 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Because it's easy to keep forgetting to sudo. Use with <leader>sudosave keys.
"----------------------------------------------------------------------------------

if executable("/usr/bin/sudo") && executable("/usr/bin/tee")
	noremap <silent> <leader>sudosave :w !/usr/bin/sudo /usr/bin/tee %<CR>
else
	echo "ERROR: Files '/usr/bin/sudo' and/or '/usr/bin/tee' missing."
endif
