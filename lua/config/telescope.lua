require('telescope').setup {
  defaults = {
    layout_config = {
      preview_cutoff = 140,
    }
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<C-o>', builtin.buffers, {})
vim.keymap.set('n', '<C-i>', builtin.help_tags, {})

