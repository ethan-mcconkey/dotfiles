return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    ensure_installed = {
      "lua",
      "python",
    },
    config = function (_, opts)
      local configs = require("nvim-treesitter.configs")
      configs.setup(opts)
    end
  }
}
