" Install Plug if not installed (*nix specific)
if empty (glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter *PlugInstall --sync|source $MYVIMRC
endif

" ------- Deoplete --------------
let g:deoplete#enable_at_startup = 1
let deoplete#tag#cache_limit_size = 5000000
" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" no preview window on autocomplete
set completeopt-=preview
" ru autocomplete
let g:deoplete#keyword_patterns =  {
        \ '_': '[a-zA-Zа-яА-Я_]\k*',
        \ 'tex': '\\?[a-zA-Zа-яА-Я_]\w*',
        \ }
" rust autocomplete
let g:deoplete#sources#rust#racer_binary=systemlist('which racer')[0]
let g:deoplete#sources#rust#rust_source_path='/home/oxore/.cargo/rust/src'
" ------- /Deoplete --------------

" vim-move options
let g:move_key_modifier = 'C'

" vim-airline options
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0

" Statusline customization
let g:airline_section_z='%3p%% :%3v'

" Neomake tex warnings
let g:neomake_tex_chktex_maker = {
        \ 'args': ['--warn=no'],
        \ }

" Prevent paredit from pushing closing parenthesis to next line
let g:paredit_electric_return=0

" Gutentag statusline indicator
set statusline+=%{gutentags#statusline()}
let g:gutentags_enabled=0

" Easymotion
" Jump to anywhere with `<CTRL+Space>{char}{target}`
nmap f <Plug>(easymotion-overwin-f)
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
