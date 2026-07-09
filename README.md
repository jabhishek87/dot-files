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
stow -v -t ~ ghostty
stow -v -t ~ shell

```
