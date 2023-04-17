#!/bin/bash

# ssh-keygen -t ed25519 -C "code@nbertrand.dev"
# eval "$(ssh-agent -s)"
# ssh-add ~.ssh/....

dnf copr enable varlad/helix &
dnf config-manager --add-repo https://brave-browser-rpm-beta.s3.brave.com/brave-browser-beta.repo 
rpm --import https://brave-browser-rpm-beta.s3.brave.com/brave-core-nightly.asc 
dnf install 'dnf-command(config-manager)' 
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf install gh

dnf -y install gcc cmake llvm clang-tools-extra clingo golang helix rust cargo exa ripgrep gitui fzf zsh texlive foot brave-browser-beta fcitx5-mozc gnome-shell-extension-pop-shell
cargo install bartib felix tokei tealdeer rm-improved ouch git-delta ytop
cargo install --locked starship bat zellij zoxide hyperfine broot

rustup update 
rustup component add clippy 

dnf -y groupinstall 'Development Tools'
dnf -y install procps-ng curl file git

# CREATE DIRECTORIES
mkdir /home/nibe/SHOSAI
mkdir /home/nibe/ASP
mkdir /home/nibe/CODE
mkdir /home/nibe/WORK
mkdir /home/nibe/PROJECTS
mkdir /home/nibe/GIT
mkdir -p /home/nibe/go


git clone https://github.com/rust-lang/rust-analyzer.git /home/nibe/GIT/rust-analyzer && cd /home/nibe/GIT/rust-analyzer 
cargo xtask install --server

cd /home/nibe

# DOWNLOAD GIT REPOS
git clone git@github.com:nikolasbertrand/kaku.git /home/nibe/SHOSAI/kaku
git clone git@github.com:nikolasbertrand/jinsei.git /home/nibe/SHOSAI/jinsei
git clone git@github.com:nikolasbertrand/hiyori.git /home/nibe/SHOSAI/hiyori

git clone git@github.com:nikolasbertrand/XVX-016.git /home/nibe/XVX-016
git clone git@github.com:nikolasbertrand/ZGMF-X20A.git /home/nibe/ZGMF-X20A

git clone git@github.com:nikolasbertrand/machine-overlords.git /home/nibe/PROJECTS/machine-overlords
git clone git@github.com:nikolasbertrand/nbertrandDEV.git /home/nibe/PROJECTS/nbertrandDEV
git clone git@github.com:nikolasbertrand/jkcnCom.git /home/nibe/PROJECTS/jkcnCOM
git clone git@github.com:nikolasbertrand/theArchive.git /home/nibe/CODE/theArchive
git clone git@github.com:nikolasbertrand/riet-jongerden-php.git /home/nibe/PROJECTS/riet-jongerden-php
git clone git@github.com:nikolasbertrand/exercism.git /home/nibe/CODE/exercism
git clone git@github.com:nikolasbertrand/temp_logic-python.git /home/nibe/ASP/temp_logic-python

#git clone ASP -> ASPRILO, TELINGO CLINGUIN etc, 
# ZGMF-X20A symbolic LINKS 

ln -sf /home/nibe/ZGMF-X20A/starship.toml /home/nibe/starship.toml
ln -sf /home/nibe/ZGMF-X20A/.zshrc /home/nibe/.zshrc
ln -sf /home/nibe/ZGMF-X20A/.zshenv /home/nibe/.zshenv
ln -sf /home/nibe/ZGMF-X20A/helix /home/nibe/.config/
ln -sf /home/nibe/ZGMF-X20A/broot /home/nibe/.config/broot
ln -sf /home/nibe/ZGMF-X20A/foot /home/nibe/.config/foot
ln -sf /home/nibe/ZGMF-X20A/gitui /home/nibe/.config/gitui
ln -sf /home/nibe/ZGMF-X20A/nvim /home/nibe/.config/nvim
ln -sf /home/nibe/ZGMF-X20A/wezterm /home/nibe/.config/wezterm
ln -sf /home/nibe/ZGMF-X20A/zellij /home/nibe/.config/zellij
ln -sf /home/nibe/ZGMF-X20A/zsh /home/nibe/.config/zsh
ln -sf /home/nibe/ZGMF-X20A/felix /home/nibe/.config/felix
ln -sf /home/nibe/XVX-016/.zsh_history /home/nibe/.zsh_history
ln -sf /home/nibe/XVX-016/.gitconfig /home/nibe/.gitconfig
ln -sf /home/nibe/XVX-016/exercism /home/nibe/.config/exercism
ln -sf /home/nibe/ZGMF-X20A/fcitx5 /home/nibe/.config/fcitx5
ln -sf /home/nibe/ZGMF-X20A/autostart /home/nibe/.config/autostart

chsh -s $(which zsh)

#INSTALL LINUX BREW
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh && .install.sh
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/nibe/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install -y zig