return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      local onedark = require("onedark")
      onedark.setup({
        style = "cool",
        transparent = true,
      })
      onedark.load()
    end,
  },
}
