vim.g.material_style = "palenight"

return {
  'marko-cerovac/material.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme material]])
  end,
  opts = {
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
      "nvim-cmp",
      "nvim-tree",
      "nvim-web-devicons",
      "telescope",
    },
  },
}
