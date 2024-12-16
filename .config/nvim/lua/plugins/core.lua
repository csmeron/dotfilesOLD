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
		opts = {
			ensure_installed = {
				"isort",
				"black",
				"mypy",
				"ruff",
				"pyright",
				"prettier",
				"prettierd",
				"stylua",
				"debugpy",
				"markdownlint",
				"vale",
			},
		},
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
