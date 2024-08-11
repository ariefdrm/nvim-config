
# Neovim  Lazy Config

My first own config for neovim from scratch. 


## Requirments

 - Neovim >= 0.9.0 (needs to be built with LuaJIT)
 - Git >= 2.19.0 (for partial clones support)
 - a Nerd Font(v3.0 or greater) (optional, but needed to display some icons)
 - a C compiler for nvim-treesitter.

## Installation

Install my-project with npm

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
    git clone https://github.com/ariefdrm/neovim-first-own-config.git $env:LOCALAPPDATA\nvim
```

- Start Neovim 
```bash
    nvim
```
    