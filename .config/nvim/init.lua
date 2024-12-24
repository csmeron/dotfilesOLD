vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- enable 24 bit color
vim.opt.termguicolors = true
-- vim.opt.colorcolumn = "80"

require("configs.lazy")
