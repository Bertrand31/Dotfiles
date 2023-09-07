require('telescope').setup {
  defaults = {
    layout_config = {
      preview_cutoff = 150,
      width = 0.90,                                                                                               
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      -- disable preview somehow?
    },
    live_grep = {
      theme = "dropdown",
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<C-o>', builtin.buffers, {})
vim.keymap.set('n', '<C-i>', builtin.help_tags, {})
vim.keymap.set('n', '<C-d>', builtin.diagnostics, {})
vim.keymap.set('n', '<C-h>', builtin.git_branches, {})
vim.keymap.set('n', '<C-s>', builtin.lsp_workspace_symbols, {})

