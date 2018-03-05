"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/virtedit.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 23:21:18 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Various incredibly useful snippet-like things. Edit as needed... good luck.
"----------------------------------------------------------------------------------

func! TFL_Snips(action)
	if(a:action == "setup")
		exe "silent normal! 0i_VERSION_=\"\<ESC>\"_\"=strftime(\"%F\")\<CR>pa\"\<CR>\<CR>"
		exe "silent normal! 0iXERR(){ printf \"[L%0.4d] ERROR: %s\\n\" \"$1\" \"$2\" 1>&2; exit 1; }\<CR>"
		exe "silent normal! 0iERR(){ printf \"[L%0.4d] ERROR: %s\\n\" \"$1\" \"$2\" 1>&2; }\<CR>\<CR>"
		exe "silent normal! 0ideclare -i DEPCOUNT=0\<CR>"
		exe "silent normal! 0ifor DEP in PATH; {\<CR>"
		exe "silent normal! 0i\<Tab>[ -x \"$DEP\" ] || {\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>ERR \"$LINENO\" \"Dependency '$DEP' not met.\"\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>DEPCOUNT+=1\<CR>\<Tab>}\<CR>}\<CR>\<CR>"
		exe "silent normal! 0i[ $DEPCOUNT -eq 0 ] || exit 1\<CR>\<CR>"
		exe "silent normal! 0iUSAGE(){\<CR>\<Tab>while read -r; do\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>printf \"%s\\n\" \"$REPLY\"\<CR>\<Tab>done <<-EOF\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>            EXAMPLE ($_VERSION_)\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>            Written by terminalforlife (terminalforlife@yahoo.com)\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>            Dummy description for this template.\<CR>\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>SYNTAX:     example [OPTS]\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>OPTS:       --help|-h|-?            - Displays this help information.\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>            --version|-v            - Output only the version datestamp.\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>            --quiet|-q              - Runs in quiet mode. Errors still output.\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>            --debug|-D              - Enables the built-in bash debugging.\<CR>"
		exe "silent normal! 0i\<Tab>EOF\<CR>}\<CR>\<CR>"
		exe "silent normal! 0iwhile [ \"$1\" ]; do\<CR>\<Tab>case \"$1\" in\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>--help|-h|-\\?)\<CR>\<Tab>\<Tab>\<Tab>USAGE; exit 0 ;;\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>--debug|-D)\<CR>\<Tab>\<Tab>\<Tab>DEBUGME=\"true\" ;;\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>--quiet|-q)\<CR>\<Tab>\<Tab>\<Tab>BEQUIET=\"true\" ;;\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>--version|-v)\<CR>\<Tab>\<Tab>\<Tab>printf \"%s\\n\" \"$_VERSION_\" ;;\<CR>"
		exe "silent normal! 0i\<Tab>\<Tab>*)\<CR>\<Tab>\<Tab>\<Tab>XERR \"$LINENO\" \"Incorrect argument(s) specified.\" ;;\<CR>"
		exe "silent normal! 0i\<Tab>esac\<CR>\<CR>\<Tab>shift\<CR>done\<CR>\<CR>"
		exe "silent normal! 0i[ $UID -eq 0 ] && XERR \"$LINENO\" \"Root access isn't required.\"\<CR>\<CR>"
		exe "silent normal! 0i[ \"$BEQUIET\" == \"true\" ] && exec 1> /dev/null\<CR>"
		exe "silent normal! 0i[ \"$DEBUGME\" == \"true\" ] && set -x\<CR>\<CR>"
		exe "silent normal! 0i\<CR>\<CR># vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup\<Esc>kk"
	if(a:action == "error")
		exe "silent normal! 0iXERR(){ printf \"[L%0.4d] ERROR: %s\\n\" \"$1\" \"$2\" 1>&2; exit 1; }\<CR>"
		exe "silent normal! 0iERR(){ printf \"[L%0.4d] ERROR: %s\\n\" \"$1\" \"$2\" 1>&2; }\<CR>"
	if(a:action == "modeline")
		exe "silent normal! mc"

		if(search("^[#/\"]* vim: ", "p") == 0)
			exe "silent normal! G0i# vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup\<Esc>`c"
		else
			echo "ERROR: VIM Modeline already present."
		endif
	endif
endfunc

noremap <silent> <leader>setup :call TFL_Snips("setup")<CR>
noremap <silent> <leader>modeline :call TFL_ML()<CR>
noremap <silent> <leader>err :call TFL_Err()<CR>
noremap <silent> <leader>bar 0i#<Esc>82a-<Esc>0
