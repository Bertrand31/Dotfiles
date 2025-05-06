return {
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  --[[ {
    'scalameta/nvim-metals',
    dependencies = { "nvim-lua/plenary.nvim" },
  }, ]]
  {
    'windwp/nvim-autopairs', -- Automatic brackets pairing
    event = "InsertEnter",
  },
  {
    'lewis6991/gitsigns.nvim', -- Show git diff in the gutter column + git blame (leader + hb)
    event = "bufread",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'ruifm/gitlinker.nvim', -- Copy the Github URL in the clipboard (leader + gy)
    event = "bufread",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup()
    end,
  },
  {
    "nacro90/numb.nvim", -- Peek line
    event = "CmdlineEnter",
    config = function()
      require("numb").setup()
    end,
  },
  'notjedi/nvim-rooter.lua', -- Set workspace to git root
}
