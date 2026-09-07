" ========================================
" General
" ========================================

set number		" Show Line numbers
set relativenumber	" Relative numbers make motions easier

syntax on
filetype plugin indent on

set cursorline		" Highlight current line
highlight CursorLine cterm=NONE ctermbg=236 guibg=#303030
set ruler 		" Show cursor position
set showcmd		" Show partially typed commands
set wildmenu		" Better command-line completion
set hidden		" Allow switching buffers without saving
set mouse=a		" Enable mouse support

" ========================================
" Indentation
" ========================================

set expandtab		" Use spaces instead of tabs
set tabstop=4		" A tab looks like 4 spaces
set shiftwidth=4	" Indentation width
set softtabstop=4	" Tab key uses 4 spaces
set autoindent
set smartindent

" ========================================
" Searching
" ========================================

set ignorecase		" Case-insensitive search...
set smartcase		"...unless uppercase is used
set incsearch		" Seach as you type
set hlsearch		" Highlight search results

" ========================================
" Searching
" ========================================

" Clear Search highlighting
nnoremap <Esc><Esc> :nohlsearch<CR>

" Bind <j><k> to <ESC> in insert mode
inoremap jk <Esc>

" ========================================
" Scrolling
" ========================================

set scrolloff=8		" Keep 8 lines visible around cursor
set sidescrolloff=8

" ========================================
" Splits
" ========================================

set splitbelow		" Horizontal splits open below
set splitright		" Vertical splits open to the right

" ========================================
" Undo
" ========================================

set undofile		" Persistent undo history

" ========================================
" Appearance
" ========================================

set termguicolors	" Better colors in modern terminals
set background=dark

" ========================================
" Performance / behavior
" ========================================

set updatetime=250
set timeoutlen=500

" ========================================
" Quality of life
" ========================================

set backspace=indent,eol,start
set clipboard=unnamed
