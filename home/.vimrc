set tabstop=4           " use 4 spaces to represent tab
set noexpandtab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" http://stackoverflow.com/a/65122
" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" Treat anything ending in html as a html document
au BufRead,BufNewFile *html setf html
au BufRead,BufNewFile *inc setf html

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                           " show line and column number
syntax on                       " syntax highlighting
set showcmd                     " show (partial) command in status line

" Smart searching
set ignorecase          " Case insensitive
set smartcase           " Case senstivite if not all lower case
set hlsearch
