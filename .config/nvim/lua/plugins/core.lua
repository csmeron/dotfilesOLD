-- core files needed for optimal functionality
return {
	-- plenary for utility
	"nvim-lua/plenary.nvim",

	-- conform for formatting
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- comment for no format on save
		opts = require("configs.conform"),
	},

	-- mason for package management + lsp-config for it
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function() 
			return require "configs.mason"
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("configs.lspconfig")
		end,
	},
}
