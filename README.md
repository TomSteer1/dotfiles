# My Dotfiles
- [Entire Desktop Install](#installation)
- [Dotfile Installation](#dotfile-installation)
- [Config file](#config)

![preview](https://user-images.githubusercontent.com/29020119/216138281-7e126363-e571-4c10-8311-213a57a7bc09.png)

# Installation
1. Install arch fresh with the xorg profile and a hostname of either (zenbook,pc,virtual)
- You can modify the polybar config file to your own hostname if you wish 
2. Run `curl https://raw.githubusercontent.com/TomSteer1/scripts/main/completeInstall | sh`
3. The script will prompt for sudo to install packages and enable services
- The script can be inspected here : https://github.com/TomSteer1/scripts/blob/main/completeInstall
- This install script is automatically run : https://github.com/TomSteer1/dotfiles/blob/main/install.sh
4. LightDM will start and you will be prompted for your credentials

# Dotfile Installation
To install just the dotfiles (not recommended)
1. Clone repo `git clone https://github.com/TomSteer1/dotfiles` in the home directory
2. Run `./install.sh` in the dotfile directory

# Config
You can create a config file called `.config` in the `$HOME/dotfiles` directory to change the parameters of some scripts

The possible values are:
```
# Monitor Hot Swapping (set to the IDs of your monitors)
# Save a configuration with autorandr --save <name>
# To reload manually use autorandr --change
# But the scripts should automatically do this
INTERNAL_MONITOR=""
EXTERNAL_MONITOR=""
```
