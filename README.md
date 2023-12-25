# dot-files

Personal collection of all dot files in a single place

1. Tmux [terminal Multiplexer](https://github.com/tmux/tmux/wiki)
2. nvim

## Install dependency
```sh
# install dependency
sudo apt update -y
sudo apt install -y git curl tmux ripgrep glibc-source stow

# install latest nvim
curl -LO https://github.com/neovim/neovim-releases/releases/download/nightly/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb

# install lazygit
# get tag name from here
# https://api.github.com/repos/jesseduffield/lazygit/releases/latest
#LAZY_GIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
LAZY_GIT_VERSION="0.40.2"
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZY_GIT_VERSION}/lazygit_${LAZY_GIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz -C /usr/local/bin lazygit
#lazygit --version
rm -rf lazygit.tar.gz
```

## clone this repo and symlink files
```sh 

# clone tmux plugin and dot-files
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
clone https://github.com/jabhishek87/dot-files.git ~/dot-files

cd ~/dot-files

# symlink 
stow zsh
#
```


