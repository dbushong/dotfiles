" Vim Compiler File
" Compiler:     Mason syntax checks (using masoncw script)

if exists("current_compiler")
  finish
endif
let current_compiler = "mason"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:savecpo = &cpo
set cpo&vim

CompilerSet makeprg=masoncw\ %

CompilerSet errorformat=
	\%-G%.%#had\ compilation\ errors.,
	\%-G%.%#syntax\ OK,
	\%m\ at\ %f\ line\ %l.,
	\%+A%.%#\ at\ %f\ line\ %l\\,%.%#,
	\%+C%.%#

" Explanation:
" %-G%.%#had\ compilation\ errors.,  - Ignore the obvious.
" %-G%.%#syntax\ OK,                 - Don't include the 'a-okay' message.
" %m\ at\ %f\ line\ %l.,             - Most errors...
" %+A%.%#\ at\ %f\ line\ %l\\,%.%#,  - As above, including ', near ...'
" %+C%.%#                            -   ... Which can be multi-line.

let &cpo = s:savecpo
unlet s:savecpo
