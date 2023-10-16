return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    {
      "hrsh7th/nvim-cmp",
      config = function(cmp)
        local cmp = require('cmp')
        cmp.setup({
          completion = { completeopt = 'menu,menuone,noinsert' },
          -- if desired, choose another keymap-preset:
          mapping = cmp.mapping.preset.insert(),
          -- optionally, add more completion-sources:
          sources = cmp.config.sources({{ name = 'nvim_lsp' }}),
        })
      end,
      dependencies = {
        "hrsh7th/cmp-emoji",
      },
    },
    'jose-elias-alvarez/typescript.nvim',
  },
  config = function()
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_on_attach = function(client, bufnr)
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      -- following keymap is based on both lspconfig and lsp-zero.nvim:
      -- - https://github.com/neovim/nvim-lspconfig/blob/fd8f18fe819f1049d00de74817523f4823ba259a/README.md?plain=1#L79-L93
      -- - https://github.com/VonHeikemen/lsp-zero.nvim/blob/18a5887631187f3f7c408ce545fd12b8aeceba06/lua/lsp-zero/server.lua#L285-L298
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help                        , bufopts)
      vim.keymap.set('n', 'K'    , vim.lsp.buf.hover                                 , bufopts)
      vim.keymap.set('n', 'gD'   , vim.lsp.buf.declaration                           , bufopts)
      vim.keymap.set('n', 'gd'   , vim.lsp.buf.definition                            , bufopts)
      vim.keymap.set('n', 'gi'   , vim.lsp.buf.implementation                        , bufopts)
      vim.keymap.set('n', 'go'   , vim.lsp.buf.type_definition                       , bufopts)
      vim.keymap.set('n', 'gr'   , vim.lsp.buf.references                            , bufopts)
      vim.keymap.set('n', 'gf'   , function() vim.lsp.buf.format { async = true } end, bufopts)
      vim.keymap.set('n', 'R'    , vim.lsp.buf.rename                                , bufopts)
      vim.keymap.set('n', 'ga'   , vim.lsp.buf.code_action                           , bufopts)
      vim.keymap.set('n', 'gl'   , vim.diagnostic.open_float                         , bufopts)
    end
    local lspconfig = require('lspconfig')
    -- enable both language-servers for both eslint and typescript:
    for _, server in pairs({ 'eslint', 'tsserver', 'rust_analyzer' }) do
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
      })
    end
  end,
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
}
