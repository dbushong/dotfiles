" Vim Compiler File
" Compiler:     JavaScript syntax checks (using spidermonkey js)

if exists("current_compiler")
  finish
endif
let current_compiler = "javascript"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:savecpo = &cpo
set cpo&vim

CompilerSet makeprg=smjs\ -C\ -w\ -x\ -f\ %

CompilerSet errorformat=
        \%-Z%.%#strict\ warning:\ %p^,
        \%W%f:%l:\ strict\ warning:\ %m:,
	\%-Z%.%#:%\\d%\\d%#:\ %p^,
        \%C%.%#,
	\%E%f:%l:\ %m:

" Explanation:
"   %-Z%.%#:%\\d%\\d%#:\ %p^,  end the multi-line by matching the ...^
"   %C%.%#,                    snarf the reprint of the line
"   %A%f:%l:\ %m:              match the start of the error w/ the msg and line

let &cpo = s:savecpo
unlet s:savecpo
