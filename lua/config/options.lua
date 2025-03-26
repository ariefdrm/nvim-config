-- lua/config/options.lua

-- to use clip.exe as clipboard engine for wsl windows
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe", -- Copy to system clipboard
		["*"] = "clip.exe", -- Copy to selection clipboard (same for WSL)
	},
	paste = {
		["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}

-- Basic options
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.hlsearch = true -- Highlight search results
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search pattern contains uppercase letters
vim.opt.incsearch = true -- Show search results as you type
vim.opt.wrap = true -- Enable word wrap
vim.opt.linebreak = true -- Break lines at word boundaries
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor when scrolling
vim.opt.sidescrolloff = 8 -- Keep 8 columns to the left/right of cursor when scrolling
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 2 -- Number of spaces for a tab
vim.opt.shiftwidth = 2 -- Number of spaces for auto indentation
vim.opt.softtabstop = 2 -- Number of spaces for tab in insert mode
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Automatically insert indents in some cases
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.cursorline = true -- Highlight the current line
vim.opt.splitright = true -- Vertical splits will be to the right
vim.opt.splitbelow = true -- Horizontal splits will be below
vim.opt.clipboard = "unnamedplus" --- Use system clipboard
vim.opt.showmatch = true --  Highlight bracket pairs
vim.opt.wildmenu = true -- Show menu when autocomplete

-- Enable mouse support
vim.opt.mouse = "a"

-- Disable swapfile
vim.opt.swapfile = false

-- Set undo directory
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true

-- Disable backup
vim.opt.backup = false

-- Disable write backup
vim.opt.writebackup = false

-- Faster completion
vim.opt.updatetime = 300

-- Always show sign column
vim.opt.signcolumn = "yes"

-- Set completeopt for better completion experience
vim.opt.completeopt = "menuone,noselect"

-- File encoding
vim.opt.fileencoding = "utf-8"

-- Disable mode display since statusline plugins can show it
vim.opt.showmode = false

-- Set the colorscheme
vim.cmd([[colorscheme catppuccin]])
