return {
  "neovim/nvim-lspconfig",
   dependencies = {
    'hrsh7th/cmp-nvim-lsp',
     {
       "hrsh7th/nvim-cmp",
       dependencies = {
         "hrsh7th/cmp-emoji",
       },
     },
    'jose-elias-alvarez/typescript.nvim',
  },
 --[[ opts = {
    servers = {
      -- tsserver = {},
    },
  }, ]]
}
