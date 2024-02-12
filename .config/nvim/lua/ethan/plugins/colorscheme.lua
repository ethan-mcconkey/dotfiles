return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			transparent_background = true,
			show_end_of_buffer = true,
			term_colors = true,
			integrations = {
				cmp = true,
				treesitter = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
