vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle <CR>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('n', '<leader>tn', ':colorscheme tokyonight-storm <CR>', { noremap = true, silent = true } )
