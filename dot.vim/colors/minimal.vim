" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "minimal"

hi clear NonText
hi clear comment
hi clear constant
hi clear comment
hi clear identifier
hi identifier term=bold cterm=bold
hi clear statement
hi statement term=bold cterm=bold
hi clear preproc
hi clear type
hi type term=bold cterm=bold
hi clear special
