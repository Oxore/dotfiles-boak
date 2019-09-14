" Remove search highlighting
nnoremap <ESC> :noh<CR>
nnoremap <CR> :noh<CR><CR>

" I often press shift+j accidentally
map J <Nop>

" Russian controls stuff
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖХЪБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:{}<>,фисвуапршолдьтщзйкыегмцчняхъю;abcdefghijklmnopqrstuvwxyz[].
map О J
map h <Nop>
map l <Nop>

" wrap in quotes
vnoremap J" s""<ESC>Pb
nnoremap J" ciw""<ESC>Pb

" save by Ctrl-S
nnoremap <c-s> :w<CR>

" copy by Ctrl-C
vnoremap <c-c> "+y

" start ranger by Ctrl-o
nnoremap <c-o> :Ranger<CR>

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

" find and replace selected text in current buffer
vnoremap <c-r> y:%s/\V<C-R>"/<C-R>"/g<Left><Left>

" remove trailing whitespaces
nnoremap Jt :%s/\s\+$//g<CR>

" change all tabs with 4 spaces
nnoremap Js :%s/\t/    /g<CR>

" find and replace word under cursor in current buffer
nnoremap ci<CR> viwy:%s/\V\<<C-R>"\>/<C-R>"/g<Left><Left>

" Arrange windows
nnoremap Jw :call Arrange()<CR>

" :ls :b<Space>
nnoremap Jl :ls<CR>:b<Space>

" Compile C file and view disasm of the result object
nnoremap Jd :call CViewMixedSrcDisasm()<CR>

" Exit from terminal input mode
tnoremap <Esc> <C-\><C-n>

" Reverse search completion on Ctrl+p and Ctrl+n
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
