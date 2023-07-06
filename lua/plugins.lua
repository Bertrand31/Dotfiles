return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Scala
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  require('config/scala')

  -------- MISC --------
  -- Tree-style file explorer panel
  use 'nvim-tree/nvim-tree.lua'
  require('config/nvim-tree')
  -- Git files explorer popin
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  require('config/telescope')
  -- Vertical indentation lines
  use 'lukas-reineke/indent-blankline.nvim'
  require('config/indent_blankline')
  -- Automatic brackets pairing
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- Cool bar at the bottom
  use 'hoob3rt/lualine.nvim'
  require('config/lualine')
end)
