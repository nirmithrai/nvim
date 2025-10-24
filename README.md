# Lazyvim


## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/nirmithrai/nvim ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

# prerequisites
Neovim >= 0.11.2 (needs to be built with LuaJIT)
Git >= 2.19.0 (for partial clones support)
a Nerd Font(v3.0 or greater) (optional, but needed to display some icons)
lazygit (optional)
tree-sitter-cli and a C compiler for nvim-treesitter. See here
curl for blink.cmp (completion engine)
for fzf-lua (optional)
    fzf: fzf (v0.25.1 or greater)
    live grep: ripgrep
    find files: fd
a terminal that support true color and undercurl:
    kitty (Linux & Macos)
    wezterm (Linux, Macos & Windows)
    alacritty (Linux, Macos & Windows)
    iterm2 (Macos)
    ghostty (Linux, Macos & Windows)
