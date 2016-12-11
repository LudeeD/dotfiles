"===============# Ludee's Vimrc #===============#

"--------------
" Vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'myusuf3/numbers.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

"--------------
" Preferences

" Allow backspace on anything
set backspace=indent,eol,start

" Disable swap files
set noswapfile

" Indentation
set expandtab           " Use spaces instead of tabs
set tabstop=4           " 1 tab := 4 spaces
set shiftwidth=4        " Use 4 spaces for indentation
set softtabstop=4       " Backspace removes 4 spaces
set encoding=utf8       " Use UTF-8 as default encoding
set numberwidth=3       " Width of numbers column

" UI
set number              " show line numbers
set showcmd             " show command in bottom bar
set showmatch           " highlight matching parenthesis
a"set noshowmode          " Remove default vim mode information
set cursorline          " Highlight current line
match ErrorMsg '\s\+$'  " Highlight trailing Space

" Searching
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

"---------------
" Key Bindings

" Define leader
let mapleader=","

" Write with sudo
noremap <leader>W :w !sudo tee % > /dev/null

"Enter to insert a newline after, Shift+Enter to insert a newline before
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

"-----------
" Theme

set background=dark
colorscheme hybrid
syntax enable
"set laststatus=2

"---------------
" Plugin Config

" NerdTree
noremap <S-q> :NERDTreeToggle<CR>
let NERDTreeWinSize = 25

" BufExplorer
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" vim-gutter
set updatetime=250

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybridline'
set laststatus=2
