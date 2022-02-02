" Remove search highlighting
nnoremap <ESC> :noh<CR>
nnoremap <CR> :noh<CR><CR>

" I often press shift+j accidentally
map J <Nop>

" I often press shift+K in visual string mode accidentally
vmap K <Nop>

" Russian controls stuff
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖХЪБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:{}<>,фисвуапршолдьтщзйкыегмцчняхъю;abcdefghijklmnopqrstuvwxyz[].
map О J

" wrap in quotes
vnoremap J" s""<ESC>PF"
nnoremap J" ciw""<ESC>PF"

" save by Ctrl-S
nnoremap <c-s> :w<CR>

" copy by Ctrl-C
vnoremap <c-c> "+y

" start ranger by Alt-o
nnoremap <a-o> :Ranger<CR>

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

" Search for merge conflict markers
nnoremap Jm /^<<<<<<<\\|^=======\\|^>>>>>>><CR>

" Exit from terminal input mode
tnoremap <Esc> <C-\><C-n>

" Reverse search completion on Ctrl+p and Ctrl+n
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" ESC returns from terminal mode to normal mode
tnoremap <Esc> <C-\><C-n>

" Ctrl-c returns from input mode into normal mode
inoremap <C-c> <Esc>

" Print current line number and number of lines in current file
nnoremap JL :echo line('.') . "/" . line('$')<CR>
