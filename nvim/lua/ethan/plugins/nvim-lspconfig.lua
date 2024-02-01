return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer",
    },
    config = function()
        local lspconfig = require("lspconfig")

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            }
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua",
            }
        })

        lspconfig.lua_ls.setup({
            filetypes = { "lua" }
        })
    end
}
