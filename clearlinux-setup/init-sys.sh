# Setup .bashrc and .aliases 
echo -e "\n# Create link with file .bash_aliases
if [ -f ~/.aliases ]; then
. ~/.aliases
fi" >> ~/.bashrc

touch ~/.aliases

echo -e "alias searchpkg='flatpak search'" >> .aliases
echo -e "alias addpkg='flatpak install flathub -y --system'" >> .aliases
echo -e "alias s1='ssh drodrigues@192.168.2.57'" >> .aliases
echo -e "alias code='flatpak run com.visualstudio.code'" >> .aliases

# Setup ~/.ssh
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""

# Install NVM (Node Version Manager)
sudo swupd bundle-add wget # By default, clear linux don't have wget
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Installing tools
flatpak install flathub -y --system com.anydesk.Anydesk     
flatpak install flathub -y --system com.axosoft.GitKraken
flatpak install flathub -y --system com.brave.Browser
flatpak install flathub -y --system com.jetbrains.DataGrip
flatpak install flathub -y --system com.visualstudio.code
flatpak install flathub -y --system org.flameshot.Flameshot
flatpak install flathub -y --system rest.insomnia.Insomnia

# Install Docker & Docker Compose
sudo swupd bundle-add containers-basic
sudo systemctl start docker
sudo systemctl enable docker
sudo docker version

sudo mkdir /usr/local/bin # This folder doesn't not exists by default
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
