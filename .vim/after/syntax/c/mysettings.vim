"operator
syntax match OperatorChar "?\|+\|-\|\*\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|\.\|\!"
hi def link OperatorChar Operator

"constsnt
syn keyword cConstant INF MOD EPS
syn keyword cConstant LONG_LONG_MAX

syn match FoldMarker /{\{3,}\d*\|}\{3,}/
hi def link FoldMarker SpellCap
