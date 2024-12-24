-- editor utilities
return {

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			return require("configs.telescope")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- linting
	{
		"mfussenegger/nvim-lint",
		enabled = true,
		event = "VeryLazy",
		config = function()
			require("lint").linters_by_ft =
				{
					yaml = { "yamllint" },
					python = { "mypy", "ruff" },
					lua = { "luacheck" },
				}, vim.api.nvim_create_autocmd({ "BufWritePost" }, {
					callback = function()
						require("lint").try_lint()
					end,
				})
		end,
	},
}
