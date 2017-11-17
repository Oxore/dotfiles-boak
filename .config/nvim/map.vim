" Clear the search highlighting when ESC or RETURN pressed
nnoremap <ESC> :noh<CR><CR>
nnoremap <CR> :noh<CR><CR>

" Russian controls stuff
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖХЪБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:{}<>,фисвуапршолдьтщзйкыегмцчняхъю;abcdefghijklmnopqrstuvwxyz[].

" save by Ctrl-S
nnoremap <c-s> :w<CR>

" edit init.vim
map ,v :vsp ~/.config/nvim/init.vim<CR>
autocmd! bufwritepost ~/.config/nvim/init.vim execute "normal! :source ~/.config/nvim/init.vim"
" search selected text
vnoremap // y/<C-R>"<CR>
