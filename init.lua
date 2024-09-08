require("config.lazy") -- load lazy.nvim form lua/config/lazy.lua
require("config.options") -- load options from lua/config/options.lua
require("config.keymaps") -- load keymaps from lua/config/kaymaps.lua

-- to use clip.exe as clipboard engine in wsl windows
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe", -- Copy to system clipboard
		["*"] = "clip.exe", -- Copy to selection clipboard (same for WSL)
	},
	paste = {
		["+"] = "powershell.exe -noprofile -command Get-Clipboard", -- Paste from system clipboard
		["*"] = "powershell.exe -noprofile -command Get-Clipboard", -- Paste from selection clipboard
	},
	cache_enabled = 0,
}

