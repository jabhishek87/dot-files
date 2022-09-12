#!/bin/bash

# solce wsl resolv.conf issue
# https://github.com/Microsoft/WSL/issues/1908

sudo apt update -y
sudo apt install -y curl wget git zsh python3-pip

pip install virtualenvwrapper

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

cp .custom_rc ~/workspace



# sudo su -
# echo "username ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/username