-- lua/keymaps.lua

-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- Move to the left window
keymap("n", "<C-j>", "<C-w>j", opts) -- Move to the window below
keymap("n", "<C-k>", "<C-w>k", opts) -- Move to the window above
keymap("n", "<C-l>", "<C-w>l", opts) -- Move to the right window

-- Save file
keymap("n", "<C-s>", ":w<CR>", opts) -- Save the current file
keymap("n", "<C-S>", ":wa<CR>", opts) -- save all open buffers / all open files

-- Copy
keymap("n", "<leader>c", '"+y', opts) -- copy to system clipboard in normal mode
keymap("v", "<leader>c", '"+y', opts) -- copy to system clipboard in visual mode
-- Paste
keymap("n", "<leader>v", '"+p', opts) -- Paste from clipboard in normal mode

-- Select all
keymap("n", "<leader>a", "ggVG", opts) -- Select all content in the file

-- Additional useful keymaps
keymap("n", "<leader>q", ":q<CR>", opts) -- Quit
keymap("n", "<leader>x", ":xa<CR>", opts) -- Save and quit
keymap("n", "<leader>sc", ":nohlsearch<CR>", opts) -- clear highlight search
