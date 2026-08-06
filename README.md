# Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

```bash
sudo apt install stow    # Debian/Ubuntu
sudo pacman -S stow      # Arch
brew install stow         # macOS
```
## update bashrc
[ -f ~/.custom_rc ] && source ~/.custom_rc

## Usage
```
# stow all at once 
stow -v *
stow -v -t ~ *
# unstow remove all at once 
stow -vD *
stow -vD -t ~ *

# stow each folder
stow -v -t ~ ghostty
stow -v -t ~ shell

# To Stow chosen packages
stow -v ghostty lazyvim shell tmux vim

# To Unstow chosen packages
stow -vD ghostty lazyvim shell tmux vim

```

## Packages
https://starship.rs/
https://github.com/akinomyoga/ble.sh
