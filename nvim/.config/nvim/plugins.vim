call plug#begin("~/.config/nvim/autoload")
    " Dracula theme
    Plug 'dracula/vim'
    " Better syntax highlight
    Plug 'sheerun/vim-polyglot'
    " File explorer
    Plug 'scrooloose/nerdtree'
    " Icons for file explorer
    Plug 'ryanoasis/vim-devicons'
     " Easy way for commenting out lines
    Plug 'preservim/nerdcommenter'
    " Insert or delete brackets, parens, quotes in pair
    Plug 'jiangmiao/auto-pairs'
    " Start page with lots of customizations
    Plug 'mhinz/vim-startify'
    " Code completion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()