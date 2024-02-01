return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	config = function()
		require("plugins.configs.lspconfig")
		local config = require("plugins.configs.lspconfig")

		local on_attach = config.on_attach
		local capabilities = config.capabilities

		local lspconfig = require("lspconfig")

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"pyright",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"black",
				"isort",
				"mypy",
				"ruff",
				"debugpy",
				"lua-language-server",
				"stylua",
			},
		})

		vim.api.nvim_command("MasonToolsInstall")

		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "python" },
		})
	end,
}
