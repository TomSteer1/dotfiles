#!/usr/bin/env bash

# Checking the dotfiles repository is in the correct place
if [[ "$PWD" != "$HOME/dotfiles" ]]; then
	echo "dotfiles directory needs to be located as $HOME/dotfiles and install script needs to be executed in the dotfile directory" 1>&2
	exit 1
fi

# Checking for updates
git pull
# Creating backup directory

timestamp=$(date +%s)
echo "Creating Backup Directory $HOME/dotfiles/.backup/$timestamp" 1>&2
mkdir -p $HOME/dotfiles/.backup/$timestamp


# Installing packages
sudo pacman -Syu --needed --noconfirm 
sudo pacman -S polybar bspwm sxhkd rofi feh kitty neovim zsh autorandr openssh man wget vim lightdm lightdm-gtk-greeter ttf-liberation-mono-nerd xclip ranger zsh python-pip exa bat --noconfirm --needed


# Prechecks
if [[ ! -d "$HOME/.config" ]]; then
	echo "Creating $HOME/.config" 1>&2
	mkdir -p $HOME/.config
fi

if [[ ! -d "$HOME/scripts" ]]; then
	echo "Pulling scripts from github" 1>&2 
	git clone https://github.com/TomSteer1/scripts.git $HOME/scripts
fi

# Installing oh my zsh

if [[ ! -d $HOME/.oh-my-zsh ]]; then
	echo "Installing Oh My Zsh" 1>&2
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
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
	mv $HOME/.zshrc $HOME/dotfiles/.backup/$timestamp/zshrc
fi
ln -s $HOME/dotfiles/system/zshrc $HOME/.zshrc

# Neovim

if [[ -d $HOME/.config/nvim ]]; then
	echo "Backing up neovim config" 1>&2
	mv $HOME/.config/nvim $HOME/dotfiles/.backup/$timestamp/nvim
fi
ln -s $HOME/dotfiles/config/nvim $HOME/.config/nvim

## Dependencies for Neovim:
pip3 install neovim
$HOME/scripts/installNodeViaNvm

# Rofi 

if [[ -d $HOME/.config/rofi ]]; then
	echo "Backing up rofi config" 1>&2
	mv $HOME/.config/rofi $HOME/dotfiles/.backup/$timestamp/rofi
fi
ln -s $HOME/dotfiles/config/rofi $HOME/.config/rofi

# Neofetch

if [[ -d $HOME/.config/neofetch ]]; then
	echo "Backing up neofetch config" 1>&2
	mv $HOME/.config/neofetch $HOME/dotfiles/.backup/$timestamp/neofetch
fi
ln -s $HOME/dotfiles/config/neofetch $HOME/.config/neofetch

# kitty

if [[ -d $HOME/.config/kitty ]]; then
	echo "Backing up kitty config" 1>&2
	mv $HOME/.config/kitty $HOME/dotfiles/.backup/$timestamp/kitty
fi
ln -s $HOME/dotfiles/config/kitty $HOME/.config/kitty

# Ranger

if [[ -d $HOME/.config/ranger ]]; then
	echo "Backing up ranger config" 1>&2
	mv $HOME/.config/ranger $HOME/dotfiles/.backup/$timestamp/ranger
fi
ln -s $HOME/dotfiles/config/ranger $HOME/.config/ranger

# Zathura

if [[ -d $HOME/.config/zathura ]]; then
	echo "Backing up zathura config" 1>&2
	mv $HOME/.config/zathura $HOME/dotfiles/.backup/$timestamp/zathura
fi	
ln -s $HOME/dotfiles/config/zathura $HOME/.config/zathura

# Polybar

if [[ -d $HOME/.config/polybar ]]; then
	echo "Backing up polybar config" 1>&2
	mv $HOME/.config/polybar $HOME/dotfiles/.backup/$timestamp/polybar
fi
ln -s $HOME/dotfiles/desktop/polybar $HOME/.config/polybar

# Bspwm

if [[ -d $HOME/.config/bspwm ]] ; then
	echo "Backing up bspwm config" 1>&2
	mv $HOME/.config/bspwm $HOME/dotfiles/.backup/$timestamp/bspwm
fi
ln -s $HOME/dotfiles/desktop/bspwm $HOME/.config/bspwm

# sxhkd

if [[ -d $HOME/.config/sxhkd ]] ; then
	echo "Backing up sxhkd config" 1>&2
	mv $HOME/.config/sxhkd $HOME/dotfiles/.backup/$timestamp/sxhkd
fi
ln -s $HOME/dotfiles/desktop/sxhkd $HOME/.config/sxhkd

# autorandr

if [[ -d $HOME/.config/autorandr ]] ; then
	echo "Backing up autorandr config" 1>&2
	mv $HOME/.config/autorandr $HOME/dotfiles/.backup/$timestamp/autorandr
fi
ln -s $HOME/dotfiles/desktop/autorandr $HOME/.config/autorandr

# picom

if [[ -d $HOME/.config/picom ]] ; then
	echo "Backing up picom config" 1>&2
	mv $HOME/.config/picom $HOME/dotfiles/.backup/$timestamp/picom
fi
ln -s $HOME/dotfiles/desktop/picom $HOME/.config/picom

# tmux
if [[ -e $HOME/.tmux.conf ]]; then
	echo "Backing up tmux config" 1>&2
	mv $HOME/.tmux.conf $HOME/dotfiles/.backup/$timestamp/tmux.conf
fi
ln -s $HOME/dotfiles/system/tmux.conf $HOME/.tmux.conf
