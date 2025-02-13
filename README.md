# ⚡️ Requirements

- Neovim >= 0.9.0 (needs to be built with LuaJIT)
- [Git](https://git-scm.com/downloads) >= 2.19.0 (for partial clones support)
- [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) (optional, but needed to display some icons)
- [Ripgrep](https://github.com/BurntSushi/ripgrep) is required for grep searching with Telescope (OPTIONAL).
- [lazygit](https://github.com/jesseduffield/lazygit) (optional)
- GCC, Windows users must have [mingw](http://mingw-w64.org/downloads) installed and set on path.
- Make, Windows users must have [GnuWin32](https://sourceforge.net/projects/gnuwin32/) installed and set on path.
- curl for [blink.cmp](https://github.com/Saghen/blink.cmp) (completion engine)
- for [fzf-lua](https://github.com/ibhagwan/fzf-lua) (optional)
  - fzf: [fzf](https://github.com/junegunn/fzf) (v0.25.1 or greater)
  - live grep: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - find fies: [fd](https://github.com/sharkdp/fd)
- a terminal that support true color and undercurl:
  - [kitty](https://github.com/kovidgoyal/kitty) (Linux & Macos)
  - [wezterm](https://github.com/wez/wezterm) (Linux, Macos & Windows)
  - [alacritty](https://github.com/alacritty/alacritty) (Linux, Macos & Windows)
  - [iterm2](https://iterm2.com/) (Macos)
- Delete old neovim folders (check commands below)

# Install

## Linux/Macos

```
git clone https://github.com/Menh1505/custom-neovim.git ~/.config/nvim && nvim
```

## Flatpak

```
git clone https://github.com/Menh1505/custom-neovim.git ~/.var/app/io.neovim.nvim/config/nvim && flatpak run io.neovim.nvim
``

## Windows

- If you're using Command Prompt(CMD)

``
git clone <https://github.com/Menh1505/custom-neovim.git> %USERPROFILE%\AppData\Local\nvim && nvim

```

- If you're using PowerShell(pwsh)

```

git clone <https://github.com/Menh1505/custom-neovim.git> $ENV:USERPROFILE\AppData\Local\nvim && nvim

```

- If the above path doesnt work, try any of these paths :
  - For CMD : %LOCALAPPDATA%\nvim

```

C:\Users\%USERNAME%\AppData\Local\nvim

```

- For PowerShell : $ENV:LocalAppData\nvim

```

C:\Users\$ENV:USERNAME\AppData\Local\nvim

```

## Docker

```

docker run -w /root -it --rm alpine:latest sh -uelic '
apk add git nodejs neovim ripgrep build-base wget --update
git clone <https://github.com/NvChad/starter> ~/.config/nvim
nvim
'

```

- Run :MasonInstallAll command after lazy.nvim finishes downloading plugins.
- Delete the .git folder from nvim folder.
- Learn customization of ui & base46 from :h nvui.

# Update

- Lazy sync command

# Uninstall

```

# Linux / MacOS (unix)

rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Flatpak (linux)

rm -rf ~/.var/app/io.neovim.nvim/config/nvim
rm -rf ~/.var/app/io.neovim.nvim/data/nvim
rm -rf ~/.var/app/io.neovim.nvim/.local/state/nvim

# Windows CMD

rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Windows PowerShell

rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data

```

```

```
