---@type MappingsTable
local M = {}

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

M.general = {
	n = {
		["<leader>w"] = { "<cmd> w <CR>", "Write current buffer" },
		["<leader>q"] = { "<cmd> q <CR>", "Quit current buffer" },
		["<leader>hc"] = { "<cmd> nohlsearch <CR>", "Remove search highlighting" },
		[";"] = { "<cmd>", "Command Mode" },
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "NvimTree" },
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
