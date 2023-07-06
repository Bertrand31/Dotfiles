-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require('nvim-tree').setup {
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
