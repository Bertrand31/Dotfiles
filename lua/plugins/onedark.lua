-- vim.g.material_style = "palenight"

return {
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme onedark]])
  end,
}
