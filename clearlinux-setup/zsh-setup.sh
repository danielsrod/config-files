# Setup Zsh and OhMyZsh
sudo swupd bundle-add zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# The file ~/.aliases can be used for both zsh and bash
echo -e "\n# Load .aliases file\nsource $HOME/.aliases" >> ~/.zshrc

# Change the theme
sed -i 's/robbyrussell/zhann/' ~/.zshrc

# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/zsh-syntax-highlighting
echo -e "\n#Enable Syntax Highlighting\nsource ${(q-)ZSH}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto Suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc