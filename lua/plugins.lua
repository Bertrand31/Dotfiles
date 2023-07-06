vim.cmd [[highlight IndentBlanklineIndent1 guibg=#292d3e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#262836 gui=nocombine]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Scala
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

  -- Completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- Vertical indentation lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function () require("indent_blankline").setup {
      char = "",
      char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
      },
      space_char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
      },
      show_trailing_blankline_indent = false,
    } end
  }
end)
