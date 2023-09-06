-- KEY MAPPINGS
vim.g.mapleader = ","

-- disable netrw at the very start of your init.lua
-- Required by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Display bar at the 100 char limit
vim.opt.colorcolumn = "80,100"

vim.opt.signcolumn = "number"
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"
vim.opt.backspace = "indent,eol,start"
vim.opt.history = 200
vim.opt.undolevels = 200
vim.opt.shell = "/bin/fish"

-- Files
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true

vim.cmd([[
  set nocompatible
  filetype off
  set nofoldenable

  call plug#begin(stdpath('data') . '/plugged')

  match errorMsg /\s\+$/ " highlight trailing whitespaces

  highlight NvimTreeFolderIcon guibg=blue

  nnoremap <silent> <C-c> <cmd>bd<cr>

  " LANGUAGE-SPECIFIC
  " Scala
  Plug 'derekwyatt/vim-scala'
  let g:scala_scaladoc_indent = 1
  au BufRead,BufNewFile *.sbt set filetype=scala

  Plug 'scalameta/nvim-metals'

  " All of your Plugins must be added before the following line
  call plug#end()

  filetype plugin indent on

  " Put your non-Plugin stuff after this line
  " SETTINGS
  if !exists("g:syntax_on")
  syntax enable
  endif

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

  " Matching braces
  " set showmatch
  " set matchtime=3

  " Miscellaneous
  " Relatve and absolute line numbers
  set number relativenumber
  set clipboard^=unnamed,unnamedplus
  set showcmd
  set number

  " Git Wrap Text
  au FileType gitcommit set tw=72

  " HIGHLIGHT
  " Hit F2 to stop get rid of search highlighting
  nnoremap <F2> :nohlsearch<CR>
  " Hit F8 to highlight all the other occurences of the current word in the file
  nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

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
