# Setup Zsh and OhMyZsh
sudo swupd bundle-add zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# The file ~/.aliases can be used for both zsh and bash
source $HOME/.aliases