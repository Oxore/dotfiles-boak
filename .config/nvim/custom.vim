let s:no_distraction_mode = 0
function! ToggleNodistractionMode()
    if s:no_distraction_mode  == 0
        let s:no_distraction_mode = 1
        let &colorcolumn=''
        set nonumber
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let &colorcolumn='81,101'
        let s:no_distraction_mode = 0
        set number
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
