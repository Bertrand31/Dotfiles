set nocompatible
filetype off

call plug#begin(stdpath('data') . '/plugged')

" PLUGINS

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  "

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Colorscheme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Show git diff in the gutter column + git blame (leader + hb)
Plug 'lewis6991/gitsigns.nvim'
" Copy the Github URL in the clipboard (leader + gy)
Plug 'ruifm/gitlinker.nvim'
" Add git blame information
" Plug 'f-person/git-blame.nvim'

" Peek lines
Plug 'nacro90/numb.nvim'

Plug 'akinsho/nvim-bufferline.lua'

" Git
Plug 'TimUntersberger/neogit'

" Go to project's root automatically
Plug 'airblade/vim-rooter'

match errorMsg /\s\+$/ " highlight trailing whitespaces

" Commenting
Plug 'b3nj5m1n/kommentary'

nnoremap <C-n> :NvimTreeToggle<CR>
highlight NvimTreeFolderIcon guibg=blue

nnoremap <silent> <C-c> <cmd>bd<cr>

" Indention levels
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term=239
let g:indentLine_setConceal = 0

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

" LuaLine configuration
" set background=dark
set termguicolors
lua << EOF
require('plugins')

require'bufferline'.setup {
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "thick",
  }
}
local neogit = require('neogit')
neogit.setup {}

require('gitsigns').setup()
require"gitlinker".setup()

require('numb').setup()

vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>c", "<Plug>kommentary_visual_default", {})
EOF
