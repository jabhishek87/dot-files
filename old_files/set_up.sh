#!/bin/bash

# solce wsl resolv.conf issue
# https://github.com/Microsoft/WSL/issues/1908
# ln -s /mnt/c/data-drive/workspace workspace

sudo apt update -y
sudo apt install -y curl wget git zsh python3-pip  git-review sshpass

pip install virtualenvwrapper

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install go 1.29 chage url to update
go_dn_url=https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
wget --quiet --continue --show-progress "${go_dn_url}"

rm -rf /usr/local/go
tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

#cp .custom_rc ~/workspace



# sudo su -
# echo "username ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/username
