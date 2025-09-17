# Documentation

## Fish
Fish is my current shell. All current configuration is in ```fish/config.fish```

## Nvim
Nvim is my current text editor. Its config is based on [this repository](https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim)

Keymaps are present where relevant, a complete keymap guide will be here soon

## Wezterm

Wezterm is my current terminal emulator. The config is based on [this repository](https://github.com/dragonlobster/wezterm-config) all current configs are in the lua file and will be moved here if the wezterm directory increases in size

# Tips for myself
First move from .config to dotfiles

```mv ~/.config/folder_name ~/dotfiles/folder_name```

Then make a symlink

```ln -s ~/dotfiles/folder_name ~/.config/folder_name```
