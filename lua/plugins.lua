return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Completion && LSP
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  require('config/treesitter')
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

  use 'nvim-tree/nvim-web-devicons'
  require'nvim-web-devicons'.setup()

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
  use "lukas-reineke/indent-blankline.nvim"
  require('config/indent-blankline')

  -- Automatic brackets pairing
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Cool bar at the bottom
  use 'hoob3rt/lualine.nvim'
  require('config/lualine')

  -- Buffers tabs
  use 'akinsho/nvim-bufferline.lua'
  require('config/bufferline')

  -- Show git diff in the gutter column + git blame (leader + hb)
  use 'lewis6991/gitsigns.nvim'
  require('gitsigns').setup()

  -- Copy the Github URL in the clipboard (leader + gy)
  use 'ruifm/gitlinker.nvim'
  require"gitlinker".setup()

  -- Peek lines
  use 'nacro90/numb.nvim'
  require('numb').setup()

  -- Commenting
  use 'b3nj5m1n/kommentary'
  require('config/kommentary')
 
  -- Colourscheme
  vim.g.material_style = "palenight"
  use 'marko-cerovac/material.nvim'
  require('material').setup({
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

  -- Set workspace to git root
  use 'notjedi/nvim-rooter.lua'
  require("nvim-tree").setup({
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true
    },
  })
end)
