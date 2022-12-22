local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

keymap("i", "<C-h>", "<C-w>h", opts)
