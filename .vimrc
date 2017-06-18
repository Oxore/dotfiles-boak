set nocp
call pathogen#infect()
filetype plugin on
syntax on
au BufNewFile,BufRead *.st set filetype=stplc
set tabstop=8
set shiftwidth=4
set smartindent
set number
set ttyfast
set mouse=a
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='wombat'
let &colorcolumn=join(range(81,999),",")
let g:move_key_modifier = 'C'
colorscheme kolor

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}
