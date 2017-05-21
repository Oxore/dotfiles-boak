" Vim syntax file
" Language: ST
" Version: 1.0
" Last Change:	2016/01/14
" Maintainer:  Tom Pinkas <tom.pinkas@gmail.com>

" Contributors: 
"
"
if exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword stplcBoolean true false
syn keyword stplcConditional if else then elseif end_if case end_case
syn keyword stplcStatement function_block end_function_block var end_var var_input var_output var_in_out var_config program end_program
syn keyword stplcType string bool sint dint int


" control flow function
syn keyword stplcFunction return

syn region stplcComment	start="(\*\|{"  end="\*)\|}" contains=pascalTodo,pascalSpaceError


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_my_syn_inits")
  if version < 508
    let did_my_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink stplcBoolean		Boolean
  HiLink stplcComment		Comment
  HiLink stplcConditional	Conditional
  HiLink stplcType		Type
  HiLink stplcFunction		Function
  HiLink stplcStatement		Statement


  delcommand HiLink
endif



let b:current_syntax = "stplc"
" vim: ts=4 sw=2
