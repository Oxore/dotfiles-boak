" GNU C code style autoformating
function! GnuCFormatting()
  setlocal shiftwidth=2 tabstop=8 textwidth=78
  setlocal cinoptions=>2s,e-s,n-s,f0,{s,^-s,:s,=s,g0,+.5s,p2s,t0,(0 cindent
  " Set 'formatoptions' to break comment lines but not other lines,
  " and insert the comment leader when hitting <CR> or using "o".
  setlocal fo-=t fo+=croql
  " Set 'comments' to format dashed lists in comments.
  setlocal comments=sO:*\ -,mO:\ \ \ ,exO:*/,s1:/*,mb:\ ,ex:*/
  set cpoptions-=C

  " " Second option of setting GNU C indent
  " setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
endfunction

" Update configuration files on changes
augroup VimrcHooks
    au!
    autocmd bufwritepost init.vim,plugins.vim,auto.vim,map.vim source ~/.config/nvim/init.vim
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
    if !exists('g:c_project_enabled')
        let g:c_project_enabled=0
    endif

    if g:c_project_enabled==0
        let g:c_project_enabled=1
        augroup CProject
            autocmd BufRead,BufNewFile *.c set filetype=c
            autocmd BufWritePost *.c,*.cpp call CNeomakeFn()
        augroup END
        let g:gutentags_enabled=1
        let g:neomake_c_enabled_makers=['anygcc']
        echom "CProject automake on"
    else
        let g:c_project_enabled=0
        augroup CProject
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
