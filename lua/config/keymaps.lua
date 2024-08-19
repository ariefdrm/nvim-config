
-- lua/keymaps.lua

-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Navigation
keymap('n', '<C-h>', '<C-w>h', opts)  -- Move to the left window
keymap('n', '<C-j>', '<C-w>j', opts)  -- Move to the window below
keymap('n', '<C-k>', '<C-w>k', opts)  -- Move to the window above
keymap('n', '<C-l>', '<C-w>l', opts)  -- Move to the right window

-- Save file
keymap('n', '<C-s>', ':w<CR>', opts)  -- Save the current file
keymap('n', '<C-S>', ':wa<CR>', opts) -- save all open buffers / all open files

-- Copy-paste
keymap('v', '<leader>y', '"+y', opts)  -- Copy to system clipboard
keymap('n', '<leader>p', '"+p', opts)  -- Paste from system clipboard

-- Select all
keymap('n', '<leader>a', 'ggVG', opts)  -- Select all content in the file

-- Additional useful keymaps
keymap('n', '<leader>q', ':q<CR>', opts)  -- Quit
keymap('n', '<leader>x', ':xa<CR>', opts)  -- Save and quit
keymap('n', '<leader>c', ':bd<CR>', opts)  -- Close current buffer





