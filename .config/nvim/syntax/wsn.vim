" Vim syntax file
" Language:         WSN (Wirth Syntax Notation)
" Maintainer:       Vladimir Novikov <oxore@protonmail.com>
" Latest Revision:  2021-29-09

function GetWsnIndent()
  let l:line = getline(v:lnum-1)
  let l:position = match(l:line, "=")
  if l:position > 0 && match(l:line, '^\s*[[:alnum:]\+_-]\+\s*=') >= 0
    return l:position
  endif
  return -1
endfunction

set indentexpr=GetWsnIndent()

syn region wsnLiteral start='"' skip='""' end='"'
syn match wsnIdentifier /[[:alnum:]_-]\+/
syn match wsnFlow /[{}()\[\]|=.]/

if (!exists("g:vim_wsn_warnings") || g:vim_wsn_warnings==1)
	syn match wsnInvalidSymbol /[~`!@#$%^&*+\\/?,<>']/
	syn match wsnMultipleFlow /[|=.]\{2,\}/
	syn match wsnMultipleDelim /\(=\_s*=\)\|\(|\_s*|\)/
	syn match wsnEmptyRepetitionBlock /\({\s*|\s*}\)\|\({\s*[|}]\)\|\([{|]\s*}\)/
	syn match wsnEmptyOptionalBlock /\([\[|]\s*\]\)\|\(\[\s*[|\]]\)/
	syn match wsnEmptyGroupBlock /\([(|]\s*)\)\|\((\s*[|)]\)/
endif

hi def link wsnLiteral                String
hi def link wsnIdentifier             Identifier
hi def link wsnFlow                   Operator
hi def link wsnInvalidSymbol          Error
hi def link wsnMultipleFlow           Error
hi def link wsnMultipleDelim          Error
hi def link wsnEmptyRepetitionBlock   Error
hi def link wsnEmptyOptionalBlock     Error
hi def link wsnEmptyGroupBlock        Error
