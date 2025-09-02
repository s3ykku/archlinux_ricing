vim.o.number = true
vim.cmd("syntax on")

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.clipboard = "unnamedplus"

require("keymappings")

require("config.lazy")

vim.cmd("colorscheme moonfly")

vim.opt.termguicolors = true

vim.cmd([[
  highlight! link NeoTreeFileIcon MoonflyGreen
  highlight! link NeoTreeDirectoryIcon MoonflyBlue
]])
