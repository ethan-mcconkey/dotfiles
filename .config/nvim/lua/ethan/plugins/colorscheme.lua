return {
	"navarasu/onedark.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		local onedark = require("onedark")
		onedark.setup({
			style = "cool",
			transparent = true,
		})
		onedark.load()
	end,
}
