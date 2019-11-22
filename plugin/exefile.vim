"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/exefile.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Fri 22 Nov 12:34:18 GMT 2019
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Write file and then execute current file with, or execute current file with.
"----------------------------------------------------------------------------------

noremap <silent> <leader>rwpl :w<CR>:!/usr/bin/perl "%"<CR>
noremap <silent> <leader>rwpy :w<CR>:!/usr/bin/python "%"<CR>
noremap <silent> <leader>rwb :w<CR>:!/bin/bash "%"<CR>
noremap <silent> <leader>rws :w<CR>:!/bin/sh ""%<CR>

noremap <silent> <leader>rpl :!/usr/bin/perl "%"<CR>
noremap <silent> <leader>rpy :!/usr/bin/python "%"<CR>
noremap <silent> <leader>rb :!/bin/bash "%"<CR>
noremap <silent> <leader>rs :!/bin/sh "%"<CR>
