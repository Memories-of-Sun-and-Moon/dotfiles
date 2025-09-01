#!/bin/bash
set -euo pipefail  # エラーで止める

# 環境の更新
echo -e "\e[33;44m環境の更新\e[0m"
sudo apt update
sudo apt install -y build-essential pkg-config libssl-dev curl zip unzip

# zsh のインストール
sudo apt install -y zsh
chsh -s /bin/zsh

# フォントのインストール（別環境のターミナルから表示している際はそこにも別途インストールする必要あり）
echo -e "\e[33;44mフォントのインストール\e[0m"
echo -e "\e[1;33m※別環境のターミナルから表示している際はそこにも別途インストールする必要あり\e[0m"

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip
unzip FiraMono.zip -d FiraMono

sudo mkdir -p /usr/share/fonts/nerd-fonts
sudo cp FiraMono/*.otf /usr/share/fonts/nerd-fonts/

sudo fc-cache -fv

rm -r FiraMono
rm FiraMono.zip

# rust
echo -e "\e[33;44mrust のインストール\e[0m"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# cargo を使えるようにする
. "$HOME/.cargo/env"

# lsd (事前に rust の導入が必要)
echo -e "\e[33;44mlsd のインストール\e[0m"
cargo install lsd

#starship
echo -e "\e[33;44mstarship のインストール\e[0m"
curl -sS https://starship.rs/install.sh | sh -s -- -y
