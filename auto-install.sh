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

dnf -y install python3-pip python3-wheel gcc cmake llvm clang-tools-extra clingo lldb golang nodejs-npm helix rust cargo exa ripgrep gitui fzf zsh texlive foot brave-browser-beta fcitx5-mozc gnome-shell-extension-pop-shell
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


&& cd /home/nibe/GIT/rust-analyzer 
cargo xtask install --server


#DOWNLOAD GIT REPOS A=REPO B=LOCATION
while read -r a b; do
    git clone git@github.com:"$a".git "$b"
done < gh-repos.txt

#git clone ASP -> ASPRILO, TELINGO CLINGUIN etc, 
# ZGMF-X20A symbolic LINKS 

while read -r a b; do
   ln -sf /home/nibe/"$a" /home/nibe/"$b"
done < symbolic_links.txt
chsh -s $(which zsh)


function brewinstall() {
     #INSTALL LINUX BREW
     curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh && .install.sh
     (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/nibe/.zprofile
     eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

}

function rust-analyzer-install() {
  cd /home/nibe/GIT/rust-analyzer
  cargo xtask install --server
  cd ../
}

pip install -U 'python-lsp-server[all]'
pip install cmake-language-server python-lsp-ruff 
brew install zig texlab yaml-language-server lua-language-server marksman  
cargo install taplo-cli --locked --features lsp
npm install -g typescript-language-server typescript intelephense svelte-language-server
npm i -g vscode-langservers-extracted bash-language-server

go install golang.org/x/tools/gopls@latest github.com/go-delve/delve/cmd/dlv@latest

curl https://nim-lang.org/choosenim/init.sh -sSf | sh
# May require choosenim
nimble install nimlangserver

# git clone https://github.com/zigtools/zls
# cd zls
# zig build -Doptimize=ReleaseSafe

 cargo install --git https://git@github.com/guntherwullaert/asp-language-server