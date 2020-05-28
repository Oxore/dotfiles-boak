let c_space_errors=1
let c_no_curly_error=1
setlocal expandtab
setlocal nowrap
if expand('%:p') =~ 'modem-3.0'
  set tabstop=2 shiftwidth=2 tw=80
else
  set tabstop=4 shiftwidth=4 tw=80
endif
