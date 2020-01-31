"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/listmode.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Fri 31 Jan 22:06:31 GMT 2020
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------
" Toggle the list vim setting, with the <leader>ls keys.
"------------------------------------------------------------------------------

set listchars=tab:»→,trail:␣,extends:#,nbsp:⊗
noremap <silent> <leader>ls :set list!<CR>
