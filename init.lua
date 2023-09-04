vim.cmd([[
  set nocompatible
  filetype off
  set nofoldenable

  call plug#begin(stdpath('data') . '/plugged')

  " PLUGINS
  " Icons
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  " Colorscheme
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }

  " Go to project's root automatically
  Plug 'airblade/vim-rooter'

  match errorMsg /\s\+$/ " highlight trailing whitespaces

  highlight NvimTreeFolderIcon guibg=blue

  nnoremap <silent> <C-c> <cmd>bd<cr>

  " LANGUAGE-SPECIFIC
  " Haskell
  Plug 'neovimhaskell/haskell-vim'
  let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
  let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
  let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
  let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
  let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
  let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

  " Scala
  Plug 'derekwyatt/vim-scala'
  let g:scala_scaladoc_indent = 1
  au BufRead,BufNewFile *.sbt set filetype=scala

  set signcolumn=number
  set nobackup
  set nowritebackup

  Plug 'scalameta/nvim-metals'

  " All of your Plugins must be added before the following line
  call plug#end()

  filetype plugin indent on

  " Put your non-Plugin stuff after this line
  " SETTINGS
  if !exists("g:syntax_on")
  syntax enable
  endif

  " Colour scheme configuration goes here, for some reason it is not recognised
  " when declared from within the vundle statement
  set colorcolumn=100
  set t_Co=256
  let g:material_terminal_italics = 1
  let g:material_theme_style = 'palenight'
  colorscheme material

  " Tab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab

  " Search
  set ignorecase
  set smartcase
  set hlsearch
  set incsearch

  " Substitution
  set gdefault

  " Files
  set noswapfile
  set nobackup
  set hidden

  " Matching braces
  " set showmatch
  " set matchtime=3

  " Miscellaneous
  " Don't mess indentation up when pasting
  " set pastetoggle=<F2>
  " Relatve and absolute line numbers
  set number relativenumber
  set encoding=utf8
  set fileencoding=utf8
  set backspace=indent,eol,start
  set clipboard^=unnamed,unnamedplus
  set history=200
  set undolevels=200
  set shell=/bin/zsh
  set showcmd
  set number

  " Git Wrap Text
  au FileType gitcommit set tw=72

  " HIGHLIGHT
  " Hit F2 to stop get rid of search highlighting
  nnoremap <F2> :nohlsearch<CR>
  " Hit F8 to highlight all the other occurences of the current word in the file
  nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

  " KEY MAPPINGS
  let mapleader=","

  inoremap <silent><C-]> ⇒

  " Matching braces
  noremap % v%

  " Buffer
  nmap <silent> <leader>n :bnext<CR>
  nmap <silent> <leader>p :bprevious<CR>

  " Pane navigation
  map <up> <C-w><up>
  map <down> <C-w><down>
  map <left> <C-w><left>
  map <right> <C-w><right>
]])

require('plugins')
