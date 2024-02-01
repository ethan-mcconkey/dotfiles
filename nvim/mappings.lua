---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<leader>e"] = "",
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle DAP breakpoint" },
	},
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
			"Run DAP for python",
		},
	},
}

M.ufo = {
	plugin = true,
	n = {
		["zR"] = {
			function()
				require("ufo").openAllFolds()
			end,
			"Open all code folds",
		},
		["zM"] = {
			function()
				require("ufo").closeAllFolds()
			end,
			"Close all code folds",
		},
		["zK"] = {
			function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end,
			"Peek fold",
		},
	},
}

-- M.nerd_commenter = {
--   plugin = true,
--   n = {
--     ["<leader>cc"] = {
--       function()
--         require("nerdcommenter").toggle()
--       end,
--       "Toggle code comments",
--     },
--   },
--   v = {
--     ["<leader>cc"] = { "<cmd> NERDCommenterToggle <CR>", "Toggle code comments" },
--   },
-- }

M.general = {
	n = {
		["<leader>w"] = { "<cmd> w <CR>", "Write current buffer" },
		["<leader>q"] = { "<cmd> q <CR>", "Quit current buffer" },
		["<leader>hc"] = { "<cmd> nohlsearch <CR>", "Remove search highlighting" },
		[";"] = { ":", "Command Mode", opts = { nowait = true } },
		["<leader>gg"] = { "<cmd> LazyGit <CR>", "LazyGit" },
		["<leader>fm"] = {
			function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			"Format current buffer",
		},
	},
}

return M
