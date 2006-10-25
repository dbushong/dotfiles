" turn off some defaults
let g:loaded_matchparen=1     " don't do matchparen nastiness
let g:xml_use_xhtml=1         " put /> on singleton tags in HTML
let g:sql_type_default='psql' " default to PostgreSQL style SQL syntax
let g:php_sql_query=1         " assume strings in PHP are SQL

" syntax related settings
syntax on
set background=dark
highlight clear NonText
highlight clear Underlined
highlight link  Underlined CursorLine

" filetype-based settings
filetype plugin indent on

" compiler setup
autocmd BufNewFile,BufRead * if &ft == 'perl'  | compiler perl  | endif
autocmd BufNewFile,BufRead * if &ft == 'mason' | compiler mason | endif
autocmd BufNewFile,BufRead * if &ft == 'ruby'  | compiler ruby  | endif
autocmd BufNewFile,BufRead * if &ft == 'php'   | compiler php   | endif

" general settings
set noshowmode
set noruler
set backspace=indent,eol
set ignorecase
set smartcase
set incsearch
set wildmode=list:longest,full
set shiftround
set shiftwidth=2
set tabstop=8
set softtabstop=2
set expandtab
set autoindent
set writebackup
set nobackup
set wrapscan
set tildeop
set showmatch
set exrc
set tags=tags;/

" pesky laptop F1
map <F1> <Esc>
map! <F1> <Esc>

" new normal-mode mappings
nmap <Space> <C-F>
nmap S
\ :if exists("syntax_on") <Bar>
\   syntax off <Bar>
\ else <Bar>
\   syntax enable <Bar>
\ endif <CR>

" new commands and command aliases
command -nargs=? -complete=file E split <args>
