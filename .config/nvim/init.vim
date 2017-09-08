" Plugin manager:
" - plug.vim: ~/.local/share/nvim/site/autoload/plug.vim
"

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'zeis/vim-kolor'
Plug 'matze/vim-move'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax on
set number
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:move_key_modifier = 'C'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
colorscheme kolor
let &colorcolumn=join(range(81,999),",")
