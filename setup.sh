#!/bin/bash
mkdir -f ~/.config/
mkdir -f ~/.config/nvim/
mkdir -f ~/.config/alacritty/
mkdir -f ~/.config/zellij/
mkdir -f ~/.config/karabiner/

cp ./.zshrc ~/.zshrc
cp -a ./.config/nvim/ ~/.config/nvim/
cp -a ./.config/alacritty/ ~/.config/alacritty/
cp -a ./.config/zellij/ ~/.config/zellij/
cp -a ./.config/karabiner/ ~/.config/karabiner/
cp -a ./.config/starship.toml ~/.config/starship.toml

curl -sS https://starship.rs/install.sh | sh
