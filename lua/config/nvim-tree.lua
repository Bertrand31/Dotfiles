-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
end

require('nvim-tree').setup {
  on_attach = my_on_attach,
  update_focused_file = {
    enable = true
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  view = {
    width = 35
  }
}

vim.keymap.set('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true, nowait = true })

