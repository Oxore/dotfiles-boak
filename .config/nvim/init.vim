" Plugin manager:
" - plug.vim: ~/.local/share/nvim/site/autoload/plug.vim
"

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/map.vim
source $HOME/.config/nvim/deoplete.init.vim

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Oxore/vim-kolor'
Plug 'matze/vim-move'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tweekmonster/deoplete-clang2', { 'for': 'c' }
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'neomake/neomake'
Plug 'ihacklog/HiCursorWords', { 'for': 'c' }
call plug#end()

source $HOME/.config/nvim/plugins-after.vim

syntax on
colorscheme kolor
let &colorcolumn=join(range(81,82),",")
setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab
set number
set termguicolors
set shortmess+=I
set spell spelllang=ru_yo,en_us
set spellfile=$HOME/.config/nvim/spell.ru-en.utf-8.add

" filebrowser options
let g:netrw_banner=0 " remove top banner
let g:netrw_liststyle=3 " tree liststyle

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

