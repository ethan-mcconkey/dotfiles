---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>w"] = { ":w<CR>", opts = { nowait = true } },
    ["<leader>q"] = { ":q<CR>", opts = { nowait = true } },
    ["<leader>hc"] = { ":nohlsearch<CR>"},
    [";"] = { ":", opts = { nowait = true } }
  }
}

return M
