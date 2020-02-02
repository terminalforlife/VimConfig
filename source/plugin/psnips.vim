"------------------------------------------------------------------------------
" Project Name      - VimConfig/source/plugin/psnips.vim
" Started On        - Sun  2 Feb 02:16:18 GMT 2020
" Last Change       - Sun  2 Feb 02:44:52 GMT 2020
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"------------------------------------------------------------------------------

noremap <silent> <leader>pif1 :normal! iif (){<Esc>o}<Esc>ko<Tab>
noremap <silent> <leader>pif2 :normal! iif (){<Esc>o}<Esc>kf(li

noremap <silent> <leader>pfor1 :normal! iforeach (){<Esc>o}<Esc>ko<Tab>
noremap <silent> <leader>pfor2 :normal! iforeach (){<Esc>o}<Esc>kf(li

noremap <silent> <leader>pwhi1 :normal! iwhile (){<Esc>o}<Esc>ko<Tab>
noremap <silent> <leader>pwhi2 :normal! iwhile (){<Esc>o}<Esc>kf(li

noremap <silent> <leader>psub1 :normal! isub Name{<Esc>o}<Esc>ko<Tab>
noremap <silent> <leader>psub2 :normal! isub Name{<Esc>o}<Esc>kfNciw

noremap <silent> <leader>perr1 :normal! iErr(1, '');<Esc>F'i
noremap <silent> <leader>perr2 :normal! iErr(1, "");<Esc>F"i

noremap <silent> <leader>pfer1 :normal! iFErr(1, __LINE__, '');<Esc>F'i
noremap <silent> <leader>pfer2 :normal! iFErr(1, __LINE__, "");<Esc>F"i

noremap <silent> <leader>pbas :normal! im{(?:.*/)(.*)}<Esc>

noremap <silent> <leader>pdir :normal! im{(.*)(?:/.*)}<Esc>
