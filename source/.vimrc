"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/.vimrc
" Started On        - Wed 20 Sep 09:36:54 BST 2017
" Last Change       - Mon 18 Apr 15:28:59 BST 2022
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

" Don't load all plugins; I do this more specifically below.
set noloadplugins

" Vim can ignore or make more concise various messages, which `shortmess`
" handles. The original values are `filnxtToO`, with the ones below being
" appended to that list of single-character flags. These two disable Vim's
" splash screen and terms like 'readonly' are instead the shorthand 'RO'.
set shortmess+=Ia

" I know `<SPACE>` is probably more common, but I find a comma more convenient.
let mapleader=','

" Set the goofy animation from the `moredoc.vim` plugin.
let g:MoreDoc_Animate = 1

" I prefer 'jkl;' VS 'hjkl', because it's the touch-typing standard.
noremap j h
noremap k j
noremap l k
noremap ; l

" Ignore wrapping. You can move to the visual start of end of a line with `g0`
" and `g$`, respectively.
noremap k gj
noremap l gk

" Use EMACS-style mappings for command mode. Just missing the ALT mappings, but
" Vim is refusing to let the ALT key be mapped, which is apparently a common
" problem; how has this not been fixed?!
"
" Although <C-E> is already defined, I included it anyway.
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-A> <Home>

if ! has('gui_running')
	colorscheme tfl-subtle
	set ttyfast
endif

if has('syntax')
	filetype on
	syntax on
endif

" The plugins I wish to source.
source ~/.vim/plugin/gcmsg/gcmsg.vim
source ~/.vim/plugin/moredoc/moredoc.vim
source ~/.vim/plugin/comtog.vim
source ~/.vim/plugin/headup.vim
source ~/.vim/plugin/textwidth.vim
source ~/.vim/plugin/tflsnips.vim
source ~/.vim/plugin/virtedit.vim

" Miscellaneous settings.
set ttimeout
set nomodeline
set matchtime=0
set nocompatible
set ttimeoutlen=0
set helpheight=30
set undolevels=3000
set history=10000
set cmdheight=1
set t_Co=256
set path+=**
set nomore

" Undo persistence. Disabled for security/privacy.
"if has('persistent_undo')
"	set undofile
"	set undodir=~/.vim/undo
"
"	if ! isdirectory(&undodir)
"		call mkdir(&undodir, '', 0700)
"	endif
"endif

" I disable this to begin with, but More Mode ('modedoc.vim') uses it. Note
" that it's possible to set multiple columns. IE: `set colorcolumn=80,82,84`
set colorcolumn=0

" Disable line-wrapping; I use this with 'docmode'.
set nowrap
set wrapmargin=0

" When splitting, always have the windows be 50% the size.
set equalalways

" Show which mode I'm in, such as `-- INSERT --`.
set showmode

" I disable Vim swap & backup files, because they bug me.
set noswapfile
set nobackup

" The width of my tabs. The default is 8, which I hate.
set tabstop=4

" The characters shown when `<leader>list` (`set list`) is used.
set listchars=tab:»→,trail:␣

" Temporarily highlights the currently searched string.
set incsearch

" Affords me a far, far better peripheral, vertically and horizontally.
set sidescrolloff=999
set scrolloff=999

" I don't bother with folding, but it's here if I need it.
if has('folding')
	set foldmethod=marker
	set foldmarker=#\ {{{,#\ }}}
	set viewoptions=folds,options,cursor,unix,slash
endif

" The cool menu you see when you press <TAB> in `:` mode.
if has('wildmenu')
	set wildmenu
	set wildchar=<TAB>
endif

if has('cmdline_info')
	set noruler
endif

" Center-, right-, or left-align one or more lines.
noremap <silent> <leader>ac :center<CR>
noremap <silent> <leader>ar :right<CR>
noremap <silent> <leader>al :left<CR>

" Go to the next or previous file in the queue.
noremap <silent> <leader>nn :next<CR>
noremap <silent> <leader>pp :prev<CR>

" Toggle the highlighting or searches. Use the spacebar to clear the highlight.
noremap <silent> <leader>hl :set hlsearch!<CR>
noremap <silent> <SPACE> :noh<CR>

" Source this file again.
noremap <silent> <leader>rc :source ~/.vimrc<CR>

" Underline the current line, based on its length.
noremap <silent> <leader>ul mmyypVr-<Esc>`m

" Show the 'list' characters.
noremap <silent> <leader>ls :set list!<CR>

" Remove double- or single-quotes, or graves wrapped around a string.
noremap <silent> <leader>rdq mmF"xf"x`m
noremap <silent> <leader>rsq mmF'xf'x`m
noremap <silent> <leader>rg mmF`xf`x`m

" Jump up or down by 10 lines.
noremap <silent> K 10j
noremap <silent> L 10k

" Split the window horizontally or vertically, or close the window. To switch
" windows, use <C-W> followed by <C-H> for left, <C-L> for right, <C-J> for
" down, and <C-K> for up. Or tap <C-W><C-W> to switch between each.
if has('windows')
	noremap <silent> <leader>ws :split<CR>
	noremap <silent> <leader>wvs :vsplit<CR>
	noremap <silent> <leader>wc :close<CR>
endif

" If spelling is enabled, you can use `z=` over an incorrect word, to display a
" menu of possible corrections from which you can choose.
if has('spell')
	" Toggle spell-checking.
	noremap <silent> <leader>spell :set spell!<CR>

	" Try to lazily fix the current spelling mistake.
	noremap <silent> <leader>fix mc1z=`c<CR>
endif

" Autocorrect 'teh' to 'the'.
ab teh the

" Save with 'root' access, using sudo(8) and tee(1), for when I forget.
if executable('sudo') && executable('tee')
	noremap <silent> <leader>sudosave :w !/usr/bin/sudo /usr/bin/tee %<CR>
endif

" Place timestamps, be it date (YYYY-MM-DD) or time (HH:MM:SS).
if (exists("*strftime"))
	noremap <silent> <leader>date "=strftime("%F")<CR>p9h
	noremap <silent> <leader>time "=strftime("%X")<CR>p7h
endif

" Execute the current line with BASH.
noremap <silent> <leader>rl :.w !bash<CR>

" Move the current line up or down.
noremap <silent> <C-l> :move -2<CR>
noremap <silent> <C-k> :move +1<CR>

" Run the current file with PERL, Python, BASH, or a Bourne Shell derivative.
noremap <silent> <leader>rpl :!clear; perl %<CR>
noremap <silent> <leader>rpy :!clear; python %<CR>
noremap <silent> <leader>rb :!clear; bash %<CR>
noremap <silent> <leader>rs :!clear; sh %<CR>

" Disable arrow keys for normal mode.
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>

" Disable arrow keys for insert mode.
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>

" Disable arrow keys for visual mode.
vnoremap <up> <Nop>
vnoremap <down> <Nop>
vnoremap <left> <Nop>
vnoremap <right> <Nop>

" Disable arrow keys for command mode.
cnoremap <up> <Nop>
cnoremap <down> <Nop>
cnoremap <left> <Nop>
cnoremap <right> <Nop>

" Automatically clear whitespaces when you write a file/buffer. For some reason
" you have to use BufWrite* not FileWrite* for this to work.
autocmd BufWritePre * exe "silent normal! mc:%s/[\\t ]*$//\<CR>`c"

" A line I always want to go to when I open this file to add to my notes.
autocmd BufReadPost Useful_Commands call search('#END', 'bep')

" Prohibit certain unsecure VimScript.
set secure
