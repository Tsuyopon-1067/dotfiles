#!/bin/bash
rm -rf ./.config/nvim
mkdir -p ./.config/nvim/
cp -a ~/.config/nvim/ ./.config/nvim/
rm -f .zshrc
cp ~/.zshrc .zshrc
