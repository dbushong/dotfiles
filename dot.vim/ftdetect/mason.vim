autocmd BufNewFile,BufRead *.mhtml setfiletype mason
autocmd BufNewFile,BufRead *.pl,*.html if getline(1) =~ '^<%' | set filetype=mason | endif
