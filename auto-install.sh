#!/bin/bash

# ssh-keygen -t ed25519 -C "code@nbertrand.dev"
# eval "$(ssh-agent -s)"
# ssh-add ~.ssh/....
function brewinstall() {
     #INSTALL LINUX BREW
     curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh && .install.sh
     (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/nibe/.zprofile
     eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

}
dnf -y groupinstall 'Development Tools'
dnf install 'dnf-command(config-manager)' 
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
dnf -y install procps-ng curl file git gh python3-pip python3-wheel clang-tools-extra lldb golang cargo zsh texlive fcitx5-mozc

brew tap wez/wezterm-linuxbrew
brew install clingo gcc cmake llvm node rust zig exa ripgrep gitui fzf tokei tealdeer rm-improved ouch git-delta btop bartib starship bat zoxide zellij broot hyperfine wezterm
brew install texlab yaml-language-server lua-language-server marksman  



rustup update 
rustup component add clippy 




#DOWNLOAD GIT REPOS A=REPO B=LOCATION C= name
function zyx() {
 mkdir -p /home/nibe/go  
 while read -r a b c; do
    mkdir -p "$b"
    if [ -z ${c}]; then git clone git@github.com:"$a".git /home/nibe/"$b"; else git clone git@github.com:"$a".git /home/nibe/"$b"/"$c"; fi
  done < gh-repos.txt  
}
#git clone ASP -> ASPRILO, TELINGO CLINGUIN etc, 
# ZGMF-X20A symbolic LINKS 

while read -r a b; do
   ln -sf /home/nibe/"$a" /home/nibe/"$b"
done < symbolic_links.txt

chsh -s $(which zsh)




function rust-analyzer-install() {
  cd /home/nibe/GIT/rust-analyzer
  cargo xtask install --server
  cd ../zls
  zig build -Doptimize=ReleaseSafe
}

pip install -U 'python-lsp-server[all]'
pip install cmake-language-server python-lsp-ruff 

cargo install taplo-cli --locked --features lsp
npm install -g typescript-language-server typescript intelephense svelte-language-server
npm i -g vscode-langservers-extracted bash-language-server

go install golang.org/x/tools/gopls@latest github.com/go-delve/delve/cmd/dlv@latest


cargo install --git https://git@github.com/guntherwullaert/asp-language-server
