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
