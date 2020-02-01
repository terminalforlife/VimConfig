"------------------------------------------------------------------------------
" Project Name      - vimconfig/.vimrc
" Started On        - Wed 20 Sep 09:36:54 BST 2017
" Last Change       - Sat  1 Feb 15:07:36 GMT 2020
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

" Set the special <leader> key.
let mapleader=","

if has("gui_running")
	colorscheme desert
	set linespace=4
	set lines=40 columns=160
	set guifont=Monospace
	set guioptions=aegitM

	if has("winaltkeys")
		set winaltkeys=no
	endif
else
	colorscheme tfl
	set ttyfast
endif

if has("syntax")
	filetype on
	syntax on
endif

" Load all of the TFL plugins. (also: set loadplugins)
"for p in [globpath(",", "$HOME/.vim/plugin/*.vim")]
"	if filereadable(p) | source p | endif
"endfor

set nowrap
set showmode
set ttimeout
set nomodeline
set noswapfile
set equalalways
set matchtime=0
set nocompatible
set ttimeoutlen=0
set helpheight=30
set undolevels=3000
set history=10000
set wrapmargin=0
set cmdheight=1
set nohlsearch
set tabstop=4
set incsearch
set t_Co=256
set nobackup
set path+=**
set nomore

if has("folding")
	set foldmethod=marker
	set foldmarker=#\ {{{,#\ }}}
	set viewoptions=folds,options,cursor,unix,slash
endif

if has("wildmenu")
	set wildmenu
	set wildchar=<TAB>
endif

if has("cmdline_info")
	set noruler
endif

noremap <silent> <SPACE> :noh<CR>
noremap <silent> <leader>rc :source $HOME/.vimrc<CR>
noremap <silent> <leader>ul mmyypVr-<Esc>`m
noremap <silent> <leader>ac :center<CR>
noremap <silent> <leader>ar :right<CR>
noremap <silent> <leader>al :left<CR>
noremap <silent> <leader>nn :next<CR>
noremap <silent> <leader>pp :prev<CR>
noremap <leader>hl :set hlsearch!<CR>
noremap <silent> <leader>rdq mmF"xf"x`m
noremap <silent> <leader>rsq mmF'xf'x`m
noremap <silent> <leader>rg mmF`xf`x`m
noremap <silent> K 10j
noremap <silent> L 10k

if has("windows")
	noremap <silent> <leader>ws :split<CR>
	noremap <silent> <leader>wvs :vsplit<CR>
	noremap <silent> <leader>wc :close<CR>
endif

if has("spell")
	noremap <leader>spell :set spell!<CR>
endif

ab teh the

set secure
