-- KEY MAPPINGS
vim.g.mapleader = ","
-- Hit F2 to get rid of search highlighting
vim.api.nvim_set_keymap('n', '<F2>', '<Cmd>:nohlsearch<CR>', { noremap = true, silent = true })
-- Matching braces
vim.api.nvim_set_keymap('n', '%',  'v%', { noremap = true, silent = true }) -- sample "noremap"
-- Buffer
vim.keymap.set('n', '<leader>n', '<Cmd>:bnext<CR>', { remap = true }) -- sample "nmap"
vim.keymap.set('n', '<leader>p', '<Cmd>:bprevious<CR>', { remap = true })
vim.api.nvim_set_keymap('n', '<C-c>',  [[<Cmd>bd<CR>]], { noremap = true, silent = true })
-- Pane navigation
vim.keymap.set('n', '<up>', '<C-w><up>') -- sample "map"
vim.keymap.set('n', '<down>', '<C-w><down>')
vim.keymap.set('n', '<left>', '<C-w><left>')
vim.keymap.set('n', '<right>', '<C-w><right>')

-- disable netrw at the very start of your init.lua
-- Required by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.clipboard = "unnamed,unnamedplus"

-- Disable folding
vim.opt.foldenable = false

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

-- Tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Matching braces
vim.opt.showmatch = true
vim.opt.matchtime = 3

-- Misc interface
vim.opt.cursorline = true
vim.opt.signcolumn = "number"
vim.opt.showcmd = true
vim.opt.number = true -- Show absolute line number of current line
vim.opt.relativenumber = true -- Show relative line numbers in the gutter
vim.opt.colorcolumn = "80,100" -- Display bar at the 80 and 100 char limits

vim.cmd([[
  match errorMsg /\s\+$/ " highlight trailing whitespaces
  " Highlight occurences of word under cursor
  nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
  " Git Wrap Text
  au FileType gitcommit set tw=72
]])

require('plugins')
