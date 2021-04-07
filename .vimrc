set nocompatible
filetype off

call plug#begin(stdpath('data') . '/plugged')

" PLUGINS

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Colorscheme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Show git diff in the gutter column
Plug 'airblade/vim-gitgutter'

Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'

" Git
Plug 'TimUntersberger/neogit'

" Go to project's root automatically
Plug 'airblade/vim-rooter'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
nnoremap <silent> <C-p> <cmd>Telescope git_files<cr>
nnoremap <silent> <C-o> <cmd>Telescope buffers<cr>
nnoremap <silent> <C-g> <cmd>Telescope live_grep<cr>
nnoremap <silent> <C-i> <cmd>Telescope file_browser<cr>

" Whitespace
Plug 'ntpeters/vim-better-whitespace'
autocmd BufWritePre * StripWhitespace " Strip trailing whitespace on save

" Commenting
Plug 'b3nj5m1n/kommentary'

" Tree explorer
Plug 'kyazdani42/nvim-tree.lua'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 2
" let g:nvim_tree_auto_open = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_group_empty = 1
" let g:nvim_tree_quit_on_open = 1
nnoremap <C-n> :NvimTreeToggle<CR>

nnoremap <silent> <C-c> <cmd>bd<cr>

" Indention levels
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term=239

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

" Coc.nvim
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Use K for show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
if &filetype == 'vim'
  execute 'h '.expand('<cword>')
else
  call CocAction('doHover')
endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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
require('lualine').setup{
  options = {
    theme = 'palenight'
  }
}
require'bufferline'.setup{
options = {
  show_buffer_close_icons = false,
  show_close_icon = false,
  separator_style = "thick",
  always_show_bufferline = false,
}
}
local neogit = require('neogit')
neogit.setup {}

vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>c", "<Plug>kommentary_visual_default", {})
EOF
