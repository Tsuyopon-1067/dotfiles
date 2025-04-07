#!/bin/bash
mkdir ~/.config/
mkdir ~/.config/nvim/
mkdir ~/.config/alacritty/
mkdir ~/.config/zellij/
mkdir ~/.config/karabiner/

cp ./.zshrc ~/.zshrc
cp -a ./.config/nvim/ ~/.config/nvim/
cp -a ./.config/alacritty/ ~/.config/alacritty/
cp -a ./.config/zellij/ ~/.config/zellij/
cp -a ./.config/karabiner/ ~/.config/karabiner/
cp -a ./.config/starship.toml ~/.config/starship.toml

curl -sS https://starship.rs/install.sh | sh
