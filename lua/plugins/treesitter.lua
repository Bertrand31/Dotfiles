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
}
