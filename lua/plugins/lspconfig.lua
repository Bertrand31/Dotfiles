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
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          }, {
            { name = 'buffer' },
          }),
          -- if desired, choose another keymap-preset:
          mapping = cmp.mapping.preset.insert(),
          -- optionally, add more completion-sources:
          sources = cmp.config.sources({{ name = 'nvim_lsp' }}),
        })
      end,
      dependencies = {
        "hrsh7th/cmp-emoji",
        {
          "L3MON4D3/LuaSnip",
          version = "v2.*",
          build = "make install_jsregexp"
        },
        "saadparwaiz1/cmp_luasnip",
      },
    },
    'jose-elias-alvarez/typescript.nvim',
  },
  config = function()
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_on_attach = function(client, bufnr)
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      local map = vim.keymap.set
      map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      map('n', 'K'    , vim.lsp.buf.hover, bufopts)
      map('n', 'gD'   , vim.lsp.buf.declaration, bufopts)
      map('n', 'gd'   , vim.lsp.buf.definition, bufopts)
      map('n', 'gi'   , vim.lsp.buf.implementation, bufopts)
      map('n', 'go'   , vim.lsp.buf.type_definition, bufopts)
      map('n', 'gr'   , vim.lsp.buf.references, bufopts)
      map('n', 'gf'   , function() vim.lsp.buf.format { async = true } end, bufopts)
      map('n', 'R'    , vim.lsp.buf.rename, bufopts)
      map('n', 'ga'   , vim.lsp.buf.code_action, bufopts)
      map('n', 'gl'   , vim.diagnostic.open_float, bufopts)
    end
    local lspconfig = require('lspconfig')
    -- Required for TS:  npm install -g typescript typescript-language-server vscode-langservers-extracte
    -- Required for rust_analyzer: https://stackoverflow.com/a/77453276
    for _, server in pairs({ 'eslint', 'ts_ls', 'rust_analyzer', 'hls', 'pyright' }) do
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
        on_attach = lsp_on_attach,
      })
    end
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
    end
  end,
  ft = {
    'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
    'rust', 'toml',
    'haskell', 'lhaskell', 'cabal',
    'python',
  },
}
