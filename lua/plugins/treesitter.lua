return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "scala",
        "haskell",
        "javascript",
        "json",
        "typescript",
        "prisma",
        "python",
        "tsx",
        "ron",
        "rust",
        "toml",
        "bash",
        "html",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "vim",
        "yaml",
      })
    end
  end,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      -- for syntax-highlight, instead of regular expressions, use tree-sitter:
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
