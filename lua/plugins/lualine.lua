return {
  'hoob3rt/lualine.nvim',
  opts = {
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    options = {
      theme = 'onedark'
    }
  },
}
