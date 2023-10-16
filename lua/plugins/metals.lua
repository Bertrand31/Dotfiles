local api = vim.api
return {
	"scalameta/nvim-metals",
	as = "metals",
	ft = { "scala", "sbt", "java" },
	dependencies = {
		{
			"mfussenegger/nvim-dap",
			config = function()
				local dap = require("dap")
				dap.configurations.scala = {
					{
						type = "metals",
						request = "launch",
						name = "runortest",
						metals = {
							runttype = "runortestfile",
						},
					},
					{
						type = "scala",
						request = "launch",
						name = "test target",
						metals = {
							runttype = "testtarget",
						},
					},
				}
			end,
		},
		{
			"nvim-lua/plenary.nvim",
		},
	},
	config = function(_, _)
		local metals = require("metals")
		local metals_config = metals.bare_config()
		metals_config.settings = {
			showImplicitArguments = true,
		}
		metals_config.init_options.statusBarProvider = "on"
		metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
		local dap = require("dap")
		dap.configurations.scala = {
			{
				type = "scala",
				request = "launch",
				name = "RunOrTest",
				metals = {
					runtType = "runOrTestFile",
				},
			},
			{
				type = "scala",
				request = "launch",
				name = "Test Target",
				metals = {
					runtType = "testTarget",
				},
			},
		}

		metals_config.on_attach = function(client, bufnr)
			metals.setup_dap()
		end

		vim.keymap.set("n", "<leader>lmc", function()
			require("telescope").extensions.metals.commands()
		end)

		local nvim_metals_group = api.nvim_create_augroup("metals", { clear = true })
		api.nvim_create_autocmd("FileType", {
			pattern = { "scala", "sbt", "java" },
			callback = function()
				metals.initialize_or_attach(metals_config)
			end,
			group = nvim_metals_group,
		})
	end,
}
