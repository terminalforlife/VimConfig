"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/exefile.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 23:36:42 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Write file and then execute current file with, or execute current file with.
"----------------------------------------------------------------------------------

noremap <silent> <leader>rwP :w<CR>:!/usr/bin/python %<CR>
noremap <silent> <leader>rwp :w<CR>:!/usr/bin/python3.5 %<CR>
noremap <silent> <leader>rwb :w<CR>:!/bin/bash %<CR>
noremap <silent> <leader>rws :w<CR>:!/bin/sh %<CR>

noremap <silent> <leader>rP :!/usr/bin/python %<CR>
noremap <silent> <leader>rp :!/usr/bin/python3.5 %<CR>
noremap <silent> <leader>rb :!/bin/bash %<CR>
noremap <silent> <leader>rs :!/bin/sh %<CR>
