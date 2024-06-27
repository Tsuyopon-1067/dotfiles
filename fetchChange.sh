#!/bin/bash
rm -rf ./.config/nvim
mkdir -p ./.config/nvim/
cp -a ~/.config/nvim/ ./.config/nvim/
rm -f .zshrc
cp ~/.zshrc .zshrc
rm -rf .config/alacritty
cp -a ~/.config/alacritty/ ./.config/alacritty/
rm -rf .config/zellij/
cp -a ~/.config/zellij/ ./.config/zellij/
