"----------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/listmode.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon 23 Dec 00:06:24 GMT 2019
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle the list vim setting, with the <leader>ls keys.
"----------------------------------------------------------------------------------

set listchars=tab:»→,trail:␣,extends:#,nbsp:⊗
noremap <silent> <leader>ls :set list!<CR>
