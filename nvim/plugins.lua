---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        mode = "foreground",
        names = false,
      }
    }
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
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePreviouse"
    },
    keys = {
      { "<m-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<m-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<m-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<m-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<m-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }
}

require "custom.plugins.python"

return plugins
