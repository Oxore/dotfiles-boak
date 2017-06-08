"C++11 lambda expression
syn match cCpp11Lambda "\[[^\]]*\]\(\s\|\n\)*\((\|{\)"me=e-1,he=e-1
hi def link cCpp11Lambda Function

"libstdc++ helper function
syn keyword cCppHelperFunction __gcd __lg

"macro highlight
syn keyword cMyLoop rep perm
syn keyword cMyTypedefs lint ldouble vint vlint vdouble vldouble vstring ulint
syn keyword cMyFunc all chmax chmin uniquenize

hi def link cMyLoop Keyword
hi def link cMyTypedefs cType
hi def link cMyFunc Function
hi def link cCppHelperFunction Function

syn match FoldMarker /{\{3,}\d*\|}\{3,}/
hi def link FoldMarker SpellCap
