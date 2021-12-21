" Update configuration files on changes
augroup VimrcHooks
    au!
    autocmd bufwritepost init.vim,plugins.vim,auto.vim,map.vim source ~/.config/nvim/init.vim
augroup END

" Invoke external make to get compilation errors in Rust code
augroup RustProject
    autocmd!
    autocmd BufWritePost *.rs :Neomake
augroup END

" Store clipboard content after exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Disable spell check in terminal buffer
autocmd TermOpen * setlocal nospell
