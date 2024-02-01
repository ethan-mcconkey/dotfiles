return {
	"preservim/nerdcommenter",
	enabled = false,
	lazy = false,
	config = function()
		vim.g.NERDSpaceDelims = 1
		vim.g.NERDCompactSexyComs = 1
		vim.g.NERDDefaultAlign = "left"
		vim.g.NERDCommentEmptyLines = 1
		vim.g.NERDTrimTrailingWhitespace = 1
		vim.g.NERDToggleCheckAllLines = 1

		require("core.utils").load_mappings("nerd_commenter")
	end,
}
