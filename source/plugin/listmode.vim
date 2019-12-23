"----------------------------------------------------------------------------------
" Project Name      - VimConfig/plugin/listmode.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Sun  8 Dec 21:13:18 GMT 2019
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Toggle the list vim setting, with the <leader>ls keys.
"----------------------------------------------------------------------------------

set listchars=tab:»→,trail:␣,extends:#,nbsp:⊗
noremap <silent> <leader>ls :set list!<CR>
