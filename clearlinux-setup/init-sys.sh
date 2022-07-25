# Setup .bashrc and .bash_aliases 
echo -e "\n# Create link with file .bash_aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi" >> ~/.bashrc

touch ~/.bash_aliases

echo -e "alias searchpkg='flatpak search'" >> .bash_aliases
echo -e "alias addpkg='flatpak install flathub -y --system'" >> .bash_aliases
echo -e "alias s1='ssh drodrigues@192.168.2.57'" >> .bash_aliases

# Setup ~/.ssh
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""

# Install NVM
sudo swupd bundle-add wget # By default, clear linux don't have wget
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Installing tools
flatpak install flathub -y --system com.anydesk.Anydesk com.axosoft.GitKraken com.brave.Browser com.jetbrains.DataGrip com.visualstudio.code org.flameshot.Flameshot

# Install Docker & Docker Compose
sudo swupd bundle-add containers-basic
sudo systemctl start docker
sudo systemctl enable docker
sudo docker version

sudo mkdir /usr/local/bin # This folder doesn't not exists by default
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
