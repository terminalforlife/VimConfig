"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/listmode.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Wed  7 Mar 19:06:36 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle the list vim setting, with the <leader>ls keys.
"----------------------------------------------------------------------------------

set listchars=tab:»→,trail:␣,extends:#,nbsp:⊗
noremap <silent> <leader>ls :set list!<CR>
