require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.api.nvim_set_keymap('n', '<F4>', ':botright split | term python3 %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':bd!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':d<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<BS>', '<C-W>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'i', 'a', { noremap = true, silent = true})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
