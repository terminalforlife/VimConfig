"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/.vimrc
" Started On        - Wed 20 Sep 09:36:54 BST 2017
" Last Change       - Mon  2 Aug 12:40:24 BST 2021
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

set noloadplugins

let mapleader=','

noremap j h
noremap k j
noremap l k
noremap ; l

" Ignore wrapping. You can move to the visual start of end of a line with `g0`
" and `g$`, respectively.
noremap k gj
noremap l gk

if !has('gui_running')
	colorscheme tfl-subtle
	set ttyfast
endif

if has('syntax')
	filetype on
	syntax on
endif

let Plugs = ['comtog', 'giteditmsg', 'headup',
	\ 'moredoc', 'textwidth', 'tflsnips', 'virtedit']

for Plug in Plugs
	exe 'source $HOME/.vim/plugin/' . Plug . '.vim'
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

noremap <silent> <leader>hl :set hlsearch!<CR>
noremap <silent> <SPACE> :noh<CR>

noremap <silent> <leader>rc :source $HOME/.vimrc<CR>
noremap <silent> <leader>ul mmyypVr-<Esc>`m
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

" If spelling is enabled, you can use `z=` over an incorrect word, to display a
" menu of possible corrections from which you can choose.
if has('spell')
	noremap <silent> <leader>spell :set spell!<CR>
	noremap <silent> <leader>fix mc1z=`c<CR>
endif

ab teh the

if executable('/usr/bin/sudo') && executable('/usr/bin/tee')
	noremap <silent> <leader>sudosave :w !/usr/bin/sudo /usr/bin/tee %<CR>
endif

if (exists("*strftime"))
	noremap <silent> <leader>date "=strftime("%F")<CR>p9h
	noremap <silent> <leader>time "=strftime("%X")<CR>p7h
endif

noremap <silent> <leader>rl :.w !bash<CR>

noremap <silent> <C-l> :move -2<CR>
noremap <silent> <C-k> :move +1<CR>

noremap <silent> <leader>rpl :!perl %<CR>
noremap <silent> <leader>rpy :!python %<CR>
noremap <silent> <leader>rb :!bash %<CR>
noremap <silent> <leader>rs :!sh %<CR>

noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>

inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>

vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>

" Automatically clear whitespaces when you write a file/buffer. For some reason
" you have to use BufWrite* not FileWrite* for this to work.
autocmd BufWritePre * exe "silent normal! mc:%s/[\\t ]*$//\<CR>`c"

set secure
