augroup VimrcHooks
    au!
    autocmd bufwritepost init.vim,plugins.vim,auto.vim,map.vim source ~/.config/nvim/init.vim
augroup END

" Unfocused window has usual line numbers
augroup LineNumberHook
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave *
          \ if &modifiable | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter   *
          \ if &modifiable | set norelativenumber | endif
augroup END

" Arrange windows split:
"   two small vsplit at the left
"   one large at the right
function! Arrange()
    while winnr('$') > 3
        execute "normal \<c-w>q"
    endwhil
    while winnr('$') < 3
        execute "split"
    endwhil
    if winnr() == 1
        execute "normal \<c-w>J\<c-w>k\<c-w>J\<c-w>k\<c-w>L"
    else
        execute "normal \<c-w>K\<c-w>j\<c-w>K\<c-w>j\<c-w>L"
    endif
endfunction

" Invoke external make to get compilation errors in C code
function! ToggleCProject()
    if !exists('#CProject#BufWritePost')
        augroup CProject
            autocmd!
            autocmd BufRead,BufNewFile *.c set filetype=c
            autocmd BufWritePost *.c,*.cpp call CNeomakeFn()
        augroup END
        let g:gutentags_enabled=1
        let g:neomake_c_enabled_makers=['gcc']
        echom "CProject automake on"
    else
        augroup CProject
            autocmd!
            autocmd BufRead,BufNewFile *.c set filetype=c
        augroup END
        let g:gutentags_enabled=0
        let g:neomake_c_enabled_makers=[]
        echom "CProject automake off"
    endif
endfunction

" Invoke external make to get compilation errors in Rust code
augroup RustProject
    autocmd!
    autocmd BufWritePost *.rs :Neomake
augroup END

augroup LibRocket
    autocmd!
    autocmd BufReadPre,FileReadPre *.rml set ft=html
    autocmd BufReadPre,FileReadPre *.rcss set ft=css
augroup END

augroup FuseSoC
    autocmd!
    autocmd BufReadPre,FileReadPre *.core set ft=yaml
augroup END
