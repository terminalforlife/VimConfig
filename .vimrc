"----------------------------------------------------------------------------------
" Project Name      - vimconfig/.vimrc
" Started On        - Wed 20 Sep 09:36:54 BST 2017
" Last Change       - Mon  5 Mar 23:14:56 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------

" Useful in DocMode(). Traverse lines normally.
noremap k gj
noremap l gk

" Set the initial variable values, prior to further processing.
let g:hardmodestate="false"
let mapleader=","

" Load all of the TFL plugins.
for p in [globpath(",", "$HOME/.vim/plugin/*.vim")]
	if filereadable(p) | source p | endif
endfor

" Set colors depending on terminal type.
if(&ttytype == "xterm-256color")
	colorscheme tfl
	set ttyfast
else
	colorscheme darkblue
	set background=dark
	set nottyfast
endif

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
