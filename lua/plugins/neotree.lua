return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
	keys = {
		{ "<C-n>", "<cmd>Neotree float reveal toggle<cr>" },
	},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  }
}
