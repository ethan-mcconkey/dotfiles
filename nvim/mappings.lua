---@type MappingsTable
local M = {}
local opts = { nowait = true, silent = true }

M.general = {
  n = {
    ["<leader>w"] = { ":w<CR>", opts = opts },
    ["<leader>q"] = { ":q<CR>", opts = opts },
    ["<leader>hc"] = { ":nohlsearch<CR>", opts = opts },
    [";"] = { ":", opts = { nowait = true } },
    ["<leader>e"] = { ":Neotree toggle float<CR>", opts = opts },
    ["<leader><tab>"] = { ":Neotree toggle left<CR>", opts = opts }
  }
}

return M
