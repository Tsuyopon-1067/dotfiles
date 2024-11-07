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

rm -rf ./.config/karabiner
mkdir -p ./.config/karabiner
cp -a ~/.config/karabiner/ ./.config/karabiner/


has_brew_option=false
for arg in "$@"; do
    if [ "$arg" = "--brew" ]; then
        has_brew_option=true
        break
    fi
done

if $has_brew_option; then
    echo "dump brew packages"
    rm -f .Brewfile
    brew bundle dump -f --global
    cp -a ~/.Brewfile ./.Brewfile
fi
