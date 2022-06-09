" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"-----------------------" 
" Custom configurations "
"-----------------------"

" for line number
set number

" for indentation:
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cindent
set expandtab

" for rainbow:
let g:rainbow_active = 1

" for leader:
let mapleader = ","

" for mapping:
nnoremap <F1> :bp<CR>
nnoremap <F2> :bn<CR>
nnoremap <F3> :bd<CR>
vnoremap <C-c> "+y

" for coc-lists:
nnoremap <Leader>l :CocList<CR>

" for coc-explorer:
nnoremap <Leader>e :CocCommand explorer<CR>

" for tagbar:
nnoremap <Leader>t :TagbarToggle<CR>

" for neoformat:
nnoremap <Leader>f :Neoformat<CR>

" for nerdcommenter:
let g:NERDSpaceDelims = 1

" for vim-airline:
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty = '⚡'

" for vim-airline-themes:
let g:airline_theme = 'dark'

" for coc.nvim:
let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-snippets', 'coc-pairs', 'coc-explorer', 'coc-tabnine', 'coc-lists']

" for vim-plug:
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'sbdchd/neoformat'
Plug 'bfrg/vim-cpp-modern'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'preservim/tagbar'

call plug#end()
