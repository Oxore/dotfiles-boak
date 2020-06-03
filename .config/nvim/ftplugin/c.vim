let c_space_errors=1
let c_no_curly_error=1
setlocal expandtab
setlocal nowrap
setlocal textwidth=80
autocmd Filetype c,cpp set comments^=:///
if expand('%:p') =~ 'modem-3.0'
  setlocal tabstop=2 shiftwidth=2
else
  setlocal tabstop=4 shiftwidth=4
endif
