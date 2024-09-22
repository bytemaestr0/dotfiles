require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local filename = vim.fn.expand('%:r')
map("n", ";", ":", { desc = "CMD enter command mode" })
vim.api.nvim_set_keymap('n', '<F3>', ':botright split | term g++ % -o' .. filename .. '.out && ./' .. filename .. '.out; echo ""; echo "Exit code: $?";<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F4>', ':botright split | term python3 %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':bd!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':d<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<BS>', '<C-W>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'i', 'a', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'a', 'i', { noremap = true, silent = true})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
