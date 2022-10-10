#!/usr/bin/env zsh

# Checking the dotfiles repository is in the correct place
if [[ "$PWD" != "$HOME/dotfiles" ]]; then
	echo "dotfiles directory needs to be located as $HOME/dotfiles \nand install script needs to be executed in the dotfile directory" 1>&2
	return 1
fi

# Checking for updates
git pull
# Creating backup directory

timestamp=$(date +%s)
echo "Creating Backup Directory $HOME/dotfiles/.backup/$timestamp" 1>&2
mkdir $HOME/dotfiles/.backup/$timestamp
	
# Zsh Config

if [[ -e $HOME/.zshrc ]]; then
	echo "Backing up current .zshrc" 1>&2
	mv $HOME/.zshrc $HOME/dotfiles/.backup/$timestamp/.zshrc
fi
ln -s $HOME/dotfiles/system/zshrc $HOME/.zshrc

# Neovim

if [[ -e $HOME/.config/nvim ]]; then
	echo "Backing up neovim config" 1>&2
	mv $HOME/.config/nvim $HOME/dotfiles/.backup/$timestamp/nvim
fi
ln -s $HOME/dotfiles/config/nvim $HOME/.config/nvim

# Rofi 

if [[ -e $HOME/.config/rofi ]]; then
	echo "Backing up rofi config" 1>&2
	mv $HOME/.config/rofi $HOME/dotfiles/.backup/$timestamp/rofi
fi
ln -s $HOME/dotfiles/config/rofi $HOME/.config/rofi
