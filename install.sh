#!/bin/bash

sudo apt update && sudo apt upgrade
rm ~/.zshrc

cd ~

echo '========== INSTALLING OH-MY-ZSH =========='
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo '========== INSTALLING ZNAP =========='
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git

echo '========== INSTALLING ZSH-SYNTAX-HIGHLIGHTING =========='
sudo apt install zsh-syntax-highlighting

echo '========== INSTALLING ZSH-HISTORY-SUBSTRING-SEARCH =========='
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

echo '========== INSTALLING STARSHIP PROMPT=========='
curl -sS https://starship.rs/install.sh | sh

cp /dotfiles-codespace/.zshrc ~/
cp /dotfiles-codespace/.config/starship.toml ~/.config/

sudo chsh -s /usr/bin/zsh codespace
