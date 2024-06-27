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
rm -f .p10k.zsh
cp -a ~/.p10k.zsh ./.p10k.zsh
