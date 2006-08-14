" turn off some defaults
let loaded_matchparen=1
let xml_use_xhtml=1

" syntax related settings
syntax on
set bg=dark
hi clear NonText

" load filetype plugins and indent
filetype plugin indent on
autocmd BufNewFile,BufRead *.p[lm] compiler perl
autocmd BufNewFile,BufRead *.rb    compiler ruby
autocmd BufNewFile,BufRead *.php   compiler php

" general settings
set noshowmode
set matchpairs+=<:>
set backspace=indent,eol
set ignorecase
set smartcase
set incsearch
set wildmode=list:longest,full
set shiftround
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set writebackup
set nobackup
set wrapscan
set tildeop
set showmatch
set tags=tags;/

" new normal-mode mappings
nmap <Space> <C-F>
nmap S
\ :if exists("syntax_on") <Bar>
\   syntax off <Bar>
\ else <Bar>
\   syntax enable <Bar>
\ endif <CR>

" new commands and command aliases
com -nargs=? -complete=file E split <args>
