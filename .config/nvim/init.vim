" Plugin manager:
" - plug.vim: ~/.local/share/nvim/site/autoload/plug.vim
"

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'Oxore/vim-kolor'
Plug 'matze/vim-move'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Rip-Rip/clang_complete'
call plug#end()

syntax on
set number
set termguicolors
" filebrowser options
let g:netrw_banner=0 " remove top banner
let g:netrw_liststyle=3 " tree liststyle
" vim-move options
let g:move_key_modifier = 'C'
" vim-airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:kolor_inverted_matchparen=1
colorscheme kolor
let &colorcolumn=join(range(81,999),",")
