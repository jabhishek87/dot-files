FROM ubuntu

WORKDIR $HOME

# install golang
COPY --from=golang:latest /usr/local/go/ /usr/local/go/
 
ENV PATH="/usr/local/go/bin:${PATH}"

# install dependency
RUN apt update -y
RUN apt install -y git curl tmux 
RUN apt install -y ripgrep glibc-source
RUN apt install -y stow

# install nvim latest , ubuntu default gives very old version 
RUN curl -LO https://github.com/neovim/neovim-releases/releases/download/nightly/nvim-linux64.deb
RUN apt install ./nvim-linux64.deb

# install lazygit
# get tag name from here
# https://api.github.com/repos/jesseduffield/lazygit/releases/latest
# ENV LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
ENV LAZY_GIT_VERSION="0.40.2"
RUN curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZY_GIT_VERSION}/lazygit_${LAZY_GIT_VERSION}_Linux_x86_64.tar.gz"
RUN tar xf lazygit.tar.gz -C /usr/local/bin lazygit
#lazygit --version
RUN rm -rf lazygit.tar.gz

# clone tmux plugin and dot-files
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

RUN git clone https://github.com/jabhishek87/dot-files.git ~/dot-files

RUN cd ~/dot-files
#RUN stow nvim 
#RUN stow tmux

