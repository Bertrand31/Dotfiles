return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>P", "<cmd>BufferLineTogglePin<cr>" },
	},
	opts = {
		options = {
			diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
		},
	},
}
