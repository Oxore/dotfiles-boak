
" ------- Deoplete --------------
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
" ------- /Deoplete --------------

" vim-move options
let g:move_key_modifier = 'C'

" vim-airline options
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
"let g:airline_theme='wombat'
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0

" vim-kolor options
let g:kolor_inverted_matchparen=1
let g:kolor_alternative_matchparen=1

" Statusline customization
let g:airline_section_z='%3p%% :%3v'

" Neomake tex warnings
let g:neomake_tex_chktex_maker = {
                \ 'args': ['--warn=no'],
                \ }
"let g:neomake_c_enabled_makers = ['gcc']
"let g:neomake_c_gcc_maker = {'args': ['-fsyntax-only', '-Wall', '-Wextra', '-Wpedantic']}
