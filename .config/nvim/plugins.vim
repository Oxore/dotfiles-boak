" Install Plug if not installed (*nix specific)
if empty (glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter *PlugInstall --sync|source $MYVIMRC
endif

" vim-move options
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'

" Neomake tex warnings
let g:neomake_tex_chktex_maker = {
        \ 'args': ['--warn=no'],
        \ }
let g:neomake_rust_cargo_command = ['test', '--no-run']

" Prevent paredit from pushing closing parenthesis to next line
let g:paredit_electric_return=0

" Easymotion
" Jump to anywhere with `<CTRL+Space>{char}{target}`
nmap f<Tab> <Plug>(easymotion-overwin-f)
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gr <plug>(coc-references)
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ CheckBackspace() ? "\<S-Tab>" :
      \ coc#refresh()
