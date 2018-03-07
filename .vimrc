"----------------------------------------------------------------------------------
" Project Name      - vimconfig/.vimrc
" Started On        - Wed 20 Sep 09:36:54 BST 2017
" Last Change       - Wed  7 Mar 15:13:45 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------

" Set the special <leader> key.
let mapleader=","

" Load all of the TFL plugins.
for p in [globpath(",", "$HOME/.vim/plugin/*.vim")]
	if filereadable(p) | source p | endif
endfor

colorscheme tfl
syntax on

set ttyfast
set path+=**
set nomodeline
set nocompatible
set noswapfile
set nobackup
set matchtime=0
set nowrap
set t_Co=256
set ttimeout
set ttimeoutlen=10
set viewoptions=folds,options,cursor,unix,slash
set history=4000
set noruler
set cmdheight=1
set showmode
set foldmethod=marker
set foldmarker=#\ {{{,#\ }}}
set nohlsearch
set wildchar=<TAB>
set wildmenu
set wrapmargin=0
set nomore
set incsearch
set tabstop=8

noremap <silent> <SPACE> :noh<CR>
noremap <silent> <leader>rc :source $HOME/.vimrc<CR>
noremap <silent> <leader>ul mmyypVr-<Esc>`m
noremap <silent> <leader>ws :split<CR>
noremap <silent> <leader>wvs :vsplit<CR>
noremap <silent> <leader>wc :close<CR>
noremap <silent> <leader>ac :center<CR>
noremap <silent> <leader>ar :right<CR>
noremap <silent> <leader>al :left<CR>
noremap <silent> <leader>nn :next<CR>
noremap <silent> <leader>pp :prev<CR>
noremap <leader>spell :set spell!<CR>
noremap <leader>hl :set hlsearch!<CR>
noremap <silent> <leader>rdq mmF"xf"x`m
noremap <silent> <leader>rsq mmF'xf'x`m
noremap <silent> <leader>rg mmF`xf`x`m
noremap <silent> K 10j
noremap <silent> L 10k

ab teh the

set secure
