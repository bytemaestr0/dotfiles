local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.signcolumn = 'no'
vim.o.undofile = true
vim.api.nvim_set_keymap('n', '<F9>', ':botright split | term python3 %<CR>', { noremap = true, silent = true } )
require("vim-options")
require("lazy").setup("plugins")
