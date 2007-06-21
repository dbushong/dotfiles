autocmd BufNewFile,BufRead *.mhtml setfiletype mason
autocmd BufNewFile,BufRead journal/entry/* setfiletype mason|setlocal tw=78 spell spelllang=en_us
autocmd BufNewFile,BufRead *.pl,*.html if getline(1) =~ '^<\?[&%]' || getline(line("$")) =~ '^</%' | set filetype=mason | endif
