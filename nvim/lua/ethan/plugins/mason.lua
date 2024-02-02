return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
			},
			automatic_installation = true,
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"luacheck",
				"black",
				"isort",
				"ruff",
				"mypy",
			},
		})
	end,
}
