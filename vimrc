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

" Solarized colour scheme
syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

" Fixes arrows and esc inside of command-t
" From https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux
set ttimeoutlen=50

if &term =~ "xterm" || &term =~ "screen" || &term =~ "rxvt"
	let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
	let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
	let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif


"
" Handling Whitespace
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /^\s* \s* \s*/
autocmd BufWinLeave * call clearmatches()
