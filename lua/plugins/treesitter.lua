return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "scala",
        "bash",
        "html",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "javascript",
        "json",
        "typescript",
        "tsx",
        "ron",
        "rust",
        "toml",
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
