return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local ufo = require("ufo")
		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" }
			end,
		})

		vim.keymap.set("n", "zR", function()
			ufo.openAllFolds()
		end, { desc = "Open all code folds" })
		vim.keymap.set("n", "zM", function()
			ufo.closeAllFolds()
		end, { desc = "Close all code folds" })
		vim.keymap.set("n", "zK", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek current code fold" })
	end,
}
