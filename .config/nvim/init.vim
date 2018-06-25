" Plugin manager:
" - plug.vim: ~/.local/share/nvim/site/autoload/plug.vim
"

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/map.vim
source $HOME/.config/nvim/deoplete.init.vim

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Oxore/vim-kolor'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'matze/vim-move'
Plug 'danro/rename.vim'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'neomake/neomake'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ihacklog/HiCursorWords', { 'for': 'c' }
Plug 'tikhomirov/vim-glsl'
Plug 'fidian/hexmode'
call plug#end()

source $HOME/.config/nvim/plugins-after.vim

syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set bg=dark
let &colorcolumn=join(range(81,82),",")
setlocal shiftwidth=2
setlocal tabstop=2
setlocal expandtab
set number
set termguicolors
set shortmess+=I
set spell spelllang=ru_yo,en_us
set spellfile=$HOME/.config/nvim/spell.ru-en.utf-8.add
" Persistent undo
set undofile
set undodir=$HOME/.local/share/nvim/swap/undo.history
set undolevels=1000
set undoreload=10000
set hidden

" filebrowser options
let g:netrw_banner=0 " remove top banner
let g:netrw_liststyle=3 " tree liststyle

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.c set filetype=c
    autocmd BufWritePost *.h,*.c,*.cpp :Neomake!
augroup END

augroup LibRocket
    autocmd!
    autocmd BufReadPre,FileReadPre *.rml set ft=html
    autocmd BufReadPre,FileReadPre *.rcss set ft=css
augroup END
