local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set

---------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- LSP mappings
map("n", "gD",  vim.lsp.buf.definition)
map("n", "K",  vim.lsp.buf.hover)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gds", vim.lsp.buf.document_symbol)
map("n", "gws", vim.lsp.buf.workspace_symbol)
map("n", "<leader>cl", vim.lsp.codelens.run)
map("n", "<leader>sh", vim.lsp.buf.signature_help)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<leader>ca", vim.lsp.buf.code_action)

-- all workspace diagnostics
map("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
map("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>d", vim.diagnostic.setloclist)

map("n", "[c", function()
  vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]c", function()
  vim.diagnostic.goto_next({ wrap = false })
end)

-- Completion-related settings

--[[ local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- None of this made sense to me when first looking into this since there
    -- is no vim docs, but you can't have select = true here _unless_ you are
    -- also using the snippet stuff. So keep in mind that if you remove
    -- snippets you need to remove this select
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- I use tabs... some say you should stick to ins-completion but this is just here as an example
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['metals'].setup {
  capabilities = capabilities
}

-- AUTOPAIRS x CMP
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- nvim-metals setup

local metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = {
    "akka.actor.typed.javadsl",
    "com.github.swagger.akka.javadsl"
  }
}

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach({})
  end,
  group = nvim_metals_group,
}) ]]--
