" Plugin manager:
" - plug.vim: ~/.local/share/nvim/site/autoload/plug.vim

source $HOME/.config/nvim/neomake-c-flags.vim

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/auto.vim
source $HOME/.config/nvim/map.vim

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rafi/awesome-vim-colorschemes'
Plug 'matze/vim-move'
Plug 'danro/rename.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'pboettch/vim-highlight-cursor-words', { 'for': ['c', 'rust'] }
Plug 'tikhomirov/vim-glsl'
Plug 'copy/deoplete-rust'
Plug 'vim-scripts/paredit.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'bogado/file-line'
Plug 'francoiscabrol/ranger.vim', { 'branch': 'alt-implementation' }
Plug 'easymotion/vim-easymotion'
call plug#end()

syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set bg=dark
let &colorcolumn='81,101'
set shiftwidth=2
set tabstop=2
set expandtab
set number
set termguicolors
set shortmess+=I
set spell spelllang=ru_yo,en_us
set spellfile=$HOME/.config/nvim/spell.ru-en.utf-8.add
set undofile
set undodir=$HOME/.local/share/nvim/swap/undo.history
set undolevels=1000
set undoreload=10000
set hidden
set scrolloff=4
set tags=./tags;$HOME/
set cinoptions=:0
set textwidth=80

" filebrowser options
let g:netrw_banner=0 " remove top banner
let g:netrw_liststyle=3 " tree liststyle
let g:ranger_replace_netrw = 1
