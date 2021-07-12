"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/.vimrc
" Started On        - Wed 20 Sep 09:36:54 BST 2017
" Last Change       - Mon 12 Jul 12:38:27 BST 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

set noloadplugins

let mapleader=','

noremap j h
noremap k j
noremap l k
noremap ; l

noremap k gj
noremap l gk

if has('gui_running')
	colorscheme desert
	set linespace=4
	set lines=40 columns=160
	set guifont=Monospace
	set guioptions=aegitM

	if has('winaltkeys')
		set winaltkeys=no
	endif
else
	colorscheme tfl-subtle
	set ttyfast
endif

if has('syntax')
	filetype on
	syntax on
endif

let Plugs = ['banger', 'comtog', 'datepaste', 'exefile',
	\ 'giteditmsg', 'headup', 'moredoc', 'noarrows',
	\ 'sudosave', 'textwidth', 'tflsnips', 'virtedit']

for Plug in Plugs
	exe 'source' . "$HOME/.vim/plugin/" . Plug . '.vim'
endfor

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
set tabstop=4
set incsearch
set t_Co=256
set nobackup
set path+=**
set nomore
set listchars=tab:»→,trail:␣,extends:#,nbsp:⊗
set sidescrolloff=999
set scrolloff=999

if has('folding')
	set foldmethod=marker
	set foldmarker=#\ {{{,#\ }}}
	set viewoptions=folds,options,cursor,unix,slash
endif

if has('wildmenu')
	set wildmenu
	set wildchar=<TAB>
endif

if has('cmdline_info')
	set noruler
endif

noremap <silent> <leader>ac :center<CR>
noremap <silent> <leader>ar :right<CR>
noremap <silent> <leader>al :left<CR>

noremap <silent> <leader>nn :next<CR>
noremap <silent> <leader>pp :prev<CR>

noremap <silent> <SPACE> :noh<CR>
noremap <silent> <leader>rc :source $HOME/.vimrc<CR>
noremap <silent> <leader>ul mmyypVr-<Esc>`m
noremap <silent> <leader>hl :set hlsearch!<CR>
noremap <silent> <leader>ls :set list!<CR>

noremap <silent> <leader>rdq mmF"xf"x`m
noremap <silent> <leader>rsq mmF'xf'x`m
noremap <silent> <leader>rg mmF`xf`x`m

noremap <silent> K 10j
noremap <silent> L 10k

if has('windows')
	noremap <silent> <leader>ws :split<CR>
	noremap <silent> <leader>wvs :vsplit<CR>
	noremap <silent> <leader>wc :close<CR>
endif

if has('spell')
	noremap <silent> <leader>spell :set spell!<CR>
endif

ab teh the

if executable('/usr/bin/sudo') && executable('/usr/bin/tee')
	noremap <silent> <leader>sudosave :w !/usr/bin/sudo /usr/bin/tee %<CR>
endif

noremap <silent> <leader>rl :.w !bash<CR>

noremap <silent> <C-l> :move -2<CR>
noremap <silent> <C-k> :move +1<CR>

noremap <silent> <leader>rpl :!perl %<CR>
noremap <silent> <leader>rpy :!python %<CR>
noremap <silent> <leader>rb :!bash %<CR>
noremap <silent> <leader>rs :!sh %<CR>

set secure
