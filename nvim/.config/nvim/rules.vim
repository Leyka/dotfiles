" General
syntax on
filetype plugin indent on

set encoding=utf-8
set shiftwidth=4
set softtabstop=4
set tabstop=4
set mouse=v
set mouse=a
set clipboard=unnamedplus

set number
set ruler
set visualbell
set showmatch
set nocompatible
set showmatch
set autoindent
set smartindent
set smarttab
set ttyfast
set cursorline
set hlsearch
set smartcase
set ignorecase
set incsearch

:set completeopt-=preview " For No Previews

" Nerdtree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$']

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Air-line
let g:airline_powerline_fonts = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>
