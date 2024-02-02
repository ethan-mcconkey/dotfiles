return {
	"navarasu/onedark.nvim",
	config = function()
		local onedark = require("onedark")
		onedark.setup({
			style = "cool",
			transparent = true,
		})
		onedark.load()
	end,
}