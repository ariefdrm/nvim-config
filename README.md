# Neovim Lazy Config

My first own config for neovim from scratch.

## Requirments

- Neovim >= 0.9.0 (needs to be built with LuaJIT)
- Git >= 2.19.0 (for partial clones support)
- a Nerd Font(v3.0 or greater) (optional, but needed to display some icons)
- a C compiler for nvim-treesitter.
- ripgrep for telescope plugins.

## Installation

### Windows

- Make backup for current Neovim file.

```bash
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

- Clone the project

```bash
git clone https://github.com/ariefdrm/nvim-config.git $env:LOCALAPPDATA\nvim
```

### Linux

- create backup for old config

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Git clone github repo

```bash
git clone https://github.com/ariefdrm/nvim-config.git ~/.config/nvim
```

- Start Neovim

```bash
nvim
```
