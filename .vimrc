"----------------------------------------------------------------------------------
" Project Name      - vimconfig/.vimrc
" Started On        - Wed 20 Sep 09:36:54 BST 2017
" Last Change       - Mon  5 Mar 22:40:16 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------

" Useful in DocMode(). Traverse lines normally.
noremap k gj
noremap l gk

" Set the initial variable values, prior to further processing.
let g:hardmodestate="false"
let mapleader=","

" Source TFL Plugins.
source $HOME/.vim/plugin/sanekeys.vim
source $HOME/.vim/plugin/moredoc.vim
source $HOME/.vim/plugin/datepaste.vim
source $HOME/.vim/plugin/comtog.vim
source $HOME/.vim/plugin/headup.vim
source $HOME/.vim/plugin/banger.vim
source $HOME/.vim/plugin/virtedit.vim
source $HOME/.vim/plugin/mouseon.vim
source $HOME/.vim/plugin/autoscroll.vim
source $HOME/.vim/plugin/listmode.vim
source $HOME/.vim/plugin/altnums.vim
source $HOME/.vim/plugin/textwidth.vim

" Function Calls.
silent call TFL_AutoScroll()

" Allow recursive fuzzy finding.
set path+=**

" Disable modelines.
set modeline

" Stop asking VIM to act like ancient vi.
set nocompatible

" Don't clutter your drive with swap and backup files.
set noswapfile
set nobackup

" ???
set matchtime=0

" Disable text wrapping.
set nowrap

" Allow 256 colors. Redundant?
set t_Co=256

" Make the ESC timeout sane.
set ttimeout
set ttimeoutlen=10

" ???
set viewoptions=folds,options,cursor,unix,slash

"Longer command history. Default is apparently 20.
set history=4000

" Disable the ruler.
set noruler

" ???
set cmdheight=1

" Display VIM's current mode; insert and visual.
set showmode

" Set the way in which folds are registered.
set foldmethod=marker

" Set the marker used to recognise a fold.
set foldmarker=#\ {{{,#\ }}}

" Disable search highlighting.
set nohlsearch

" ???
set wildchar=<TAB>

" Display a menu in : when tab shows multiple possibilities.
set wildmenu

" ???
set wrapmargin=0

" ???
set nomore

" Enables live searching; search as you type.
set incsearch

" Superficially use 8-space tabs; set this for reference.
set tabstop=8

" The function for toggling HardMode. Incomplete.
func! TFL_HardMode()
	if(g:hardmodestate == "false")
		let g:hardmodestate="true"
		noremap j <Nop>
		noremap k <Nop>
		noremap l <Nop>
		noremap ; <Nop>
		echo "Hard mode is enabled."
	elseif(g:hardmodestate == "true")
		let g:hardmodestate="false"
		noremap ; l
		noremap l k
		noremap k j
		noremap j h
		echo "Hard mode is disabled."
	endif
endfunc

" Set colors depending on terminal type.
if(&ttytype == "xterm-256color")
	colorscheme tfl
	set background=dark
	set ttyfast
else
	colorscheme darkblue
	set background=dark
	set nottyfast
endif

" Select different color presets.
func! TFL_ColorPreset(preset)
	if(a:preset == "default")
		colorscheme default
		set background=dark
	elseif(a:preset == "tfl")
		colorscheme tfl
		set background=dark
	else
		echo "ERROR: Invalid color preset selected."
	endif
endfunc

" Function to insert just the XERR and ERR functions into a shell script.
func! TFL_Err()
	exe "silent normal! 0iXERR(){ printf \"[L%0.4d] ERROR: %s\\n\" \"$1\" \"$2\" 1>&2; exit 1; }\<CR>"
	exe "silent normal! 0iERR(){ printf \"[L%0.4d] ERROR: %s\\n\" \"$1\" \"$2\" 1>&2; }\<CR>"
endfunc

" ???
func! TFL_ML()
	exe "silent normal! mc"

	if(search("^[#/\"]* vim: ", "p") == 0)
		exe "silent normal! G0i# vim: noexpandtab colorcolumn=84 tabstop=8 noswapfile nobackup\<Esc>`c"
	else
		echo "ERROR: VIM Modeline already present."
	endif
endfunc

" Lol. Why didn't I use a snippet file? Oh well, very useful for shell (bash).
func! TFL_Setup()
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
endfunc

" Enable syntax highlighting.
syntax on

" Sets Insert Remappings
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>

" Press spacebar to clear search highlighting.
noremap <silent> <SPACE> :noh<CR>

" Disable the arrow keys.
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>

" Switch to a different color preset.
noremap <silent> <leader>color1 :call TFL_ColorPreset("default")<CR>
noremap <silent> <leader>color2 :call TFL_ColorPreset("tfl")<CR>

" Re-source the .vimrc file; can cause issues.
noremap <silent> <leader>rc :source $HOME/.vimrc<CR>

" Work in progress. Toggles a stricter VIM.
noremap <silent> <leader>hard :call TFL_HardMode()<CR>

" Adds a lot of nice shell (bash) code in preperation.
noremap <silent> <leader>setup :call TFL_Setup()<CR>

" Add a VIM modeline to the bottom of the current file.
noremap <silent> <leader>modeline :call TFL_ML()<CR>

" Add just the XERR and ERR functions.
noremap <silent> <leader>err :call TFL_Err()<CR>

" Underline below the current; uses the same length.
noremap <silent> <leader>ul mmyypVr-<Esc>`m

" Use VIM's window splitting and switching.
noremap <silent> <leader>ws :split<CR>
noremap <silent> <leader>wvs :vsplit<CR>
noremap <silent> <leader>wc :close<CR>

" Current line text alignment.
noremap <silent> <leader>ac :center<CR>
noremap <silent> <leader>ar :right<CR>
noremap <silent> <leader>al :left<CR>

" Jump to the next or previous file.
noremap <silent> <leader>nn :next<CR>
noremap <silent> <leader>pp :prev<CR>

" Write file and then execute current file with...
noremap <silent> <leader>rwP :w<CR>:!/usr/bin/python %<CR>
noremap <silent> <leader>rwp :w<CR>:!/usr/bin/python3.5 %<CR>
noremap <silent> <leader>rwb :w<CR>:!/bin/bash %<CR>
noremap <silent> <leader>rws :w<CR>:!/bin/sh %<CR>

" Execute current file with...
noremap <silent> <leader>rP :!/usr/bin/python %<CR>
noremap <silent> <leader>rp :!/usr/bin/python3.5 %<CR>
noremap <silent> <leader>rb :!/bin/bash %<CR>
noremap <silent> <leader>rs :!/bin/sh %<CR>

" Because I keep forgetting to sudo rvim FILE.
noremap <silent> <leader>sudosave :w !/usr/bin/sudo /usr/bin/tee %<CR>

" Toggle the spellchecking feature.
noremap <leader>spell :set spell!<CR>

" Toggle the search highlighting.
noremap <leader>hl :set hlsearch!<CR>

" Display a comment bar, using a hash.
noremap <silent> <leader>bar 0i#<Esc>82a-<Esc>0

" Remove the single quotes, double quotes, parens, and graves. (left to right)
noremap <silent> <leader>rdq mmF"xf"x`m
noremap <silent> <leader>rsq mmF'xf'x`m
noremap <silent> <leader>rg mmF`xf`x`m
"noremap <silent> <leader>rp mmF(xf)x`m

"TODO - Fix. Seems to just stop after the first key.
" Easy insert scrolling.
"inoremap <C-L> <C-X><C-E>
"inoremap <C-K> <C-X><C-Y>

" Sets Jump Points (rough)
noremap <silent> K 10j
noremap <silent> L 10k

" Sets Jump Points (smooth)
"noremap <silent> K jjjjjjjjjj
"noremap <silent> L kkkkkkkkkk

" Sets Visual Remappings
vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>

" Correct stupid typo.
ab teh the

" Adds security.
set secure
