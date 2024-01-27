return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = {
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
			filterd_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_git_ignored = false,
			},
		},
	},
}
