return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local map = vim.keymap.set

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			map("n", "gd", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			map("n", "gD", "<cmd> Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementations"
			map("n", "gi", "<cmd> Telescope lsp_implementations<CR>", opts)

			opts.desc = "See avaliable code actions"
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_actions, opts)

			opts.desc = "Smart rename"
			map("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Go to previous diagnostic"
			map("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			map("n", "]d", vim.diagnostic.goto_next, opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
			filetypes = { "lua" },
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "python" },
		})
	end,
}
