vim.g.material_style = "palenight"

require('material').setup({
  contrast = {
    terminal = true,
    sidebars = true,
    cursor_line = true,
    floating_windows = false,
    non_current_windows = false,
    filetypes = {}
  },
  plugins = {
    "gitsigns",
    "indent-blankline",
    "neogit",
    "nvim-cmp",
    "nvim-tree",
    "nvim-web-devicons",
    "telescope",
  }
})

vim.cmd 'colorscheme material'
