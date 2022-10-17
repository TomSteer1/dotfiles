#!/usr/bin/env sh

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
mkdir -p $HOME/dotfiles/.backup/$timestamp


# Installing zsh

if [ ! command -v zsh &> /dev/null ]; then
	echo "Installing zsh" 1>&2
	sudo pacman -S zsh
else
	echo "ZSH already installed" 1>&2
fi


# Installing oh my zsh

if [[ ! -d $HOME/.oh-my-zsh ]]; then
	echo "Installing Oh My Zsh" 1>&2
	RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "Oh My Zsh already installed" 1>&2
fi

if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
	echo "Installing ZSH syntax highlihting" 1>&2
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
	echo "ZSH syntax highlighting already installed" 1>&2
fi

if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
	echo "Installing ZSH auto suggestions" 1>&2
	git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
	echo "ZSH auto suggestions already installed" 1>&2
fi

# Zsh Config

if [[ -e $HOME/.zshrc ]]; then
	echo "Backing up current .zshrc" 1>&2
	mv $HOME/.zshrc $HOME/dotfiles/.backup/$timestamp/.zshrc
fi
ln -s $HOME/dotfiles/system/zshrc $HOME/.zshrc

# Neovim

if [[ -d $HOME/.config/nvim ]]; then
	echo "Backing up neovim config" 1>&2
	mv $HOME/.config/nvim $HOME/dotfiles/.backup/$timestamp/nvim
fi
ln -s $HOME/dotfiles/config/nvim $HOME/.config/nvim

# Rofi 

if [[ -d $HOME/.config/rofi ]]; then
	echo "Backing up rofi config" 1>&2
	mv $HOME/.config/rofi $HOME/dotfiles/.backup/$timestamp/rofi
fi
ln -s $HOME/dotfiles/config/rofi $HOME/.config/rofi


if [ ! command -v kitty  &> /dev/null ]; then
	echo "Installing kitty" 1>&2
	sudo pacman -S kitty
else
	echo "Kitty already installed" 1>&2
fi

if [[ -d $HOME/.config/kitty ]]; then
	echo "Backing up kitty config" 1>&2
	mv $HOME/.config/kitty $HOME/dotfiles/.backup/$timestamp/kitty
fi
ln -s $HOME/dotfiles/config/kitty $HOME/.config/kitty


