" Plugin manager:
" - plug.vim: ~/.local/share/nvim/site/autoload/plug.vim

source $HOME/.config/nvim/neomake-c-flags.vim

source $HOME/.config/nvim/auto.vim
source $HOME/.config/nvim/custom.vim
source $HOME/.config/nvim/map.vim

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'matze/vim-move'
Plug 'danro/rename.vim'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'pboettch/vim-highlight-cursor-words', { 'for': ['c', 'cpp', 'rust'] }
Plug 'tikhomirov/vim-glsl'
Plug 'vim-scripts/paredit.vim'
Plug 'wsdjeg/vim-fetch'
Plug 'easymotion/vim-easymotion'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'aklt/plantuml-syntax'
Plug 'ollykel/v-vim'
Plug 'digitaltoad/vim-pug'
Plug 'cespare/vim-toml'
Plug 'pest-parser/pest.vim'
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'peterhoeg/vim-qml'
Plug 'ziglang/zig.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mcchrish/nnn.vim'
Plug 'jceb/vim-orgmode'
Plug 'BurntSushi/ripgrep'
call plug#end()

source $HOME/.config/nvim/plugins.vim

set nomodeline " disable interpreting 'vi:', 'vim:' and 'ex:' lines in comments
set path+=**
filetype plugin on
syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set bg=dark
let &colorcolumn='81,101'
set number
set termguicolors
set shortmess+=I
set statusline=\ %-3.(%n%)>\ %t\ %h%w%m%r%q%=%{&ft}\ %{&enc}[%{&ff}]\ %-10.(%l,%v%)\ %P
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
match TrailingWhitespace /\s\+$/
hi def link TrailingWhitespace Error

" filebrowser options
let g:netrw_banner=0 " remove top banner
let g:netrw_liststyle=3 " tree liststyle
