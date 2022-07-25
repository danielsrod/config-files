# Setup Zsh and OhMyZsh
sudo swupd bundle-add zsh
sudo chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# The file ~/.aliases can be used for both zsh and bash
source $HOME/.aliases