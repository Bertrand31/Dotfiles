vim.cmd [[highlight IndentBlanklineIndent1 guibg=#292d3e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#262836 gui=nocombine]]

require("indent_blankline").setup {
  char = "",
  char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
}
