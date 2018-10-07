" Remove search highlighting
nnoremap <ESC> :noh<CR><CR>
nnoremap <CR> :noh<CR><CR>

" I often press shift+j accidentally
map J <Nop>

" Russian controls stuff
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖХЪБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:{}<>,фисвуапршолдьтщзйкыегмцчняхъю;abcdefghijklmnopqrstuvwxyz[].
map О J
map h <Nop>
map l <Nop>

" save by Ctrl-S
nnoremap <c-s> :w<CR>

" edit init.vim
nnoremap Je :e ~/.config/nvim/init.vim<CR>
autocmd! bufwritepost ~/.config/nvim/init.vim execute "normal! :source ~/.config/nvim/init.vim"

" toggle auto Neomake!
nnoremap Jc :call ToggleCProject()<CR>

" latex macros
vnoremap ,v s\verb\|\|<C-[>Pll

" search selected text
vnoremap // y/<C-R>"<CR>
vnoremap /. y/\V\<<C-R>"\><CR>

" remove trailing whitespaces
nnoremap Jt :%s/\s\+$//g<CR>
nnoremap Js :%s/\t/    /g<CR>
nnoremap ci<CR> viwy:%s/\V\<<C-R>"\>/<C-R>"/g<Left><Left>

" Arrange windows
nnoremap Jw :call Arrange()<CR>

" Exit from terminal input mode
tnoremap <Esc> <C-\><C-n>

" Reverse search completion on Ctrl+p and Ctrl+n
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
