---@type NvPluginSpec[]
local plugins = {
  {
    "github/copilot.vim",
    lazy = false
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim"
    },
    lazy = false
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

return plugins
