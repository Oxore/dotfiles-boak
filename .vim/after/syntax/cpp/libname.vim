highlight Conceal ctermfg=196 ctermbg=153 cterm=bold

"//[lib]raryname
syn match LibnameSymbol "/\/\[lib\]" conceal cchar=# contained
highlight def link LibnameSymbol Conceal
syn match Libname "\/\/\[lib\].*$"hs=s+7 contains=LibnameSymbol
highlight Libname ctermfg=28 ctermbg=153 cterm=bold

"//[exp]lanation
syn match ExpSymbol "/\/\[exp\]" conceal cchar=# contained
highlight def link ExpSymbol Conceal
syn match Exp "\/\/\[exp\].*$"hs=s+7 contains=ExpSymbol
highlight Exp ctermfg=26 ctermbg=153 cterm=bold

"//[var]iables
syn match VarSymbol "/\/\[var\]" conceal cchar=# contained
highlight def link VarSymbol Conceal
syn match Var "\/\/\[var\].*$"hs=s+7 contains=VarSymbol
highlight Var ctermfg=127 ctermbg=153 cterm=bold
