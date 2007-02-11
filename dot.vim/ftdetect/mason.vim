autocmd BufNewFile,BufRead *.mhtml setfiletype mason
autocmd BufNewFile,BufRead journal/entry/* setfiletype mason
autocmd BufNewFile,BufRead *.pl,*.html if getline(1) =~ '^<\?[&%]' || getline(line("$")) =~ '^</%' | set filetype=mason | endif
