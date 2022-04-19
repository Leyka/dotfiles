call plug#begin("~/.config/nvim/autoload")

    " File explorer
    Plug 'scrooloose/nerdtree'

    " Icons for file explorer
    Plug 'ryanoasis/vim-devicons'

    " Status/tabline for vim
    Plug 'vim-airline/vim-airline'

    " Themes
    Plug 'rafi/awesome-vim-colorschemes'

    " Better syntax highlight
    Plug 'sheerun/vim-polyglot'

    " Comment stuff out (gcc & gc)
    Plug 'tpope/vim-commentary'

    " Insert or delete brackets, parens, quotes in pair
    Plug 'jiangmiao/auto-pairs'

    " Delete/change/add parentheses/quotes/XML-tags/much more with ease
    Plug 'tpope/vim-surround'

    " Start page with lots of customizations
    Plug 'mhinz/vim-startify'

    " Code completion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Multiple cursors
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    " Displays tags in a window, ordered by scope
    Plug 'preservim/tagbar'

call plug#end()
