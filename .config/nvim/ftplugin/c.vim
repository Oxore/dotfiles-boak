let c_space_errors=1
let c_no_curly_error=1
setlocal expandtab
setlocal nowrap
setlocal textwidth=80
setlocal tabstop=4 shiftwidth=4
set cinoptions+=g0
set cinoptions+=N-s
autocmd Filetype c,cpp set comments^=:///
autocmd Filetype c,cpp syn keyword NoteMarker BUG DEBUG UNDONE NOTE HACK BODGE KLUDGE containedin=cComment,cCommentL
autocmd Filetype c,cpp hi def link NoteMarker	Todo
