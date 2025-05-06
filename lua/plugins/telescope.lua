return {
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
	keys = {
		{ "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
		{ "<C-g>", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
		{ "<C-o>", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
		{ "<C-i>", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
		{ "<C-d>", "<cmd>lua require('telescope.builtin').diagnostics()<cr>" },
		{ "<C-h>", "<cmd>lua require('telescope.builtin').git_branches()<cr>" },
		{ "<C-s>", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>" },
  },
  opts = {
    defaults = {
      layout_config = {
        preview_cutoff = 150,
        width = 0.90,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
    pickers = {
      find_files = {
        theme = "ivy",
        -- hidden = true,
        -- disable preview somehow?
      },
      live_grep = {
        theme = "dropdown",
      },
    },
  },
}
