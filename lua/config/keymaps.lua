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
keymap("n", "<C-S>", ":wa<CR>", opts) -- save all open buffers / all open files

-- Select all
keymap("n", "<leader>a", "ggVG", opts) -- Select all content in the file

-- Additional useful keymaps
keymap("n", "<leader>q", ":q<CR>", opts) -- Quit
keymap("n", "<leader>x", ":xa<CR>", opts) -- Save and quit
keymap("n", "<leader>sc", ":nohlsearch<cr>", opts) -- clear highlight search

-- Nvim tree
keymap("n", "<leader>e", ":Neotree reveal<CR>", opts)

-- Mapping/Keybindings for bufferline
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts) -- Move next buffer
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts) -- Move prev buffer
keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", opts) -- Close current buffer
keymap("n", "<leader>cb", ":bd<CR>", opts) -- Close current buffer

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- Find files
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts) -- Live grep
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- Buffers
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts) -- Help
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts) -- Colorscheme
keymap("n", "<leader>fe", ":Telescope file_browser<CR>", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>", opts) -- Increment
keymap("n", "-", "<C-x>", opts) -- Decrement

-- Inc-Rename
keymap("n", "<leader>rn", ":IncRename ", opts)

-- ToggleTerm
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm <CR>", opts) -- Open terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><cmd>ToggleTerm<CR>", opts) -- Keybinding to close terminal with Esc
