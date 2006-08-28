autocmd BufNewFile,BufRead *.pl,*.html if getline(1) =~ '^<\?%' || getline(line("$")) =~ '^</%' | set filetype=mason | endif
