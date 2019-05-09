set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " Keep Plugin commands between vundle#begin/end.
Plugin 'gmarik/Vundle.vim'

" PLUGINS
" GENERAL
" Vim-script library
Plugin 'L9'

" Ale (syntax linting)
" Plugin 'w0rp/ale'

" Show git diff in the gutter column
Plugin 'airblade/vim-gitgutter'

" Status/Tabline
Plugin 'vim-airline/vim-airline'
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_highlighting_cache=1
" Display ALE linting information
let g:airline#extensions#ale#enabled = 1

" Tab labels
Plugin 'mkitt/tabline.vim'

" Git
Plugin 'tpope/vim-fugitive'

"vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-l>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-j>'
let g:multi_cursor_quit_key='<Esc>'

" Whitespace
Plugin 'ntpeters/vim-better-whitespace'
autocmd BufWritePre * StripWhitespace " Strip trailing whitespace on save

" Commenting
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDTrimTrailingWhitespace=1

" Tree explorer
Plugin 'scrooloose/nerdtree'
map <silent> <C-n> :NERDTreeFind<CR>
nmap <silent> <F3> :NERDTreeToggle<CR>
let g:NERDTreeMapActivateNode="<C-n>"
let g:NERDTreeMapPreview="<F4>"
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^.DS_Store$[[file]]']
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Git files status in NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Auto complete parenthesis
" Plugin 'jiangmiao/auto-pairs'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'
map <c-o> :CtrlPBuffer<CR>
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Indention levels
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term=239

" Colour scheme
Plugin 'kaicataldo/material.vim'

" LANGUAGE-SPECIFIC
" Javascript
Plugin 'pangloss/vim-javascript'

" JSX
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required=0

" GraphQL
Plugin 'jparise/vim-graphql'

" Scala
Plugin 'derekwyatt/vim-scala'
let g:scala_scaladoc_indent = 1
au BufRead,BufNewFile *.sbt set filetype=scala

" Coc.nvim
Plugin 'neoclide/coc.nvim'
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

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
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
autocmd CursorHold * silent call CocActionAsync('highlight')

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
call vundle#end()
filetype plugin indent on

" Put your non-Plugin stuff after this line
" SETTINGS
if !exists("g:syntax_on")
  syntax enable
endif

" Enable true colours
if (has("termguicolors"))
  set termguicolors
endif

" Colour scheme configuration goes here, for some reason it is not recognised
" when declared from within the vundle statement
let g:material_theme_style = 'palenight'
" let g:material_theme_style = 'dark'
let g:material_terminal_italics = 1
let g:airline_theme = 'material'
set background=dark
set t_Co=256
set colorcolumn=100
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
set showmatch
set matchtime=3

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

" The Silver Searcher https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching=0
endif
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Hit D to delete the current file
" nnoremap D :call delete(expand('%')) \| bdelete!<CR>

" HIGHLIGHT
" Hit F2 to stop get rid of search highlighting
nnoremap <F2> :nohlsearch<CR>
" Hit F8 to highlight all the other occurences of the current word in the file
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" KEY MAPPINGS
let mapleader=","

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

