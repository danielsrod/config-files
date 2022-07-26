# Change hostname
hostnamectl set-hostname clearlinux

# Setup .bashrc and .aliases 
echo -e "\n# Create link with file ~/.aliases
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

# Install NVM (Node Version Manager) and Node 14.x.x
sudo swupd bundle-add --assume=yes wget # By default, clear linux don't have wget
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 14 # If you want, just change 14 for whatever verison you want

# First of all, set flathub as a repository
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Installing tools
flatpak install flathub -y --system com.anydesk.Anydesk     

flatpak install flathub -y --system com.axosoft.GitKraken
### Other softwares like Gitkraken
# flatpak install flathub -y --system com.github.Murmele.Gittyup
# flatpak install flathub -y --system io.github.shiftey.Desktop
flatpak install flathub -y --system com.brave.Browser
### If you prefer Google Chrome
#flatpak install flathub -y --system com.google.Chrome
flatpak install flathub -y --system com.jetbrains.DataGrip
flatpak install flathub -y --system com.visualstudio.code
flatpak install flathub -y --system org.flameshot.Flameshot
flatpak install flathub -y --system rest.insomnia.Insomnia
### If you prefer Postman
# flatpak install flathub -y --system com.getpostman.Postman
flatpak install flathub -y --system com.spotify.Client

# Install Docker & Docker Compose
sudo swupd bundle-add --assume=yes containers-basic
sudo systemctl start docker
sudo systemctl enable docker
sudo docker version

sudo mkdir /usr/local/bin # This folder doesn't not exists by default
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo "Your SSH key was generated"
echo ~./.ssh/id_rsa.pub
echo "Please, reboot your system to apply all changes"

read -p "Reboot system? [Y/y for yes | N/n for no] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[YySs]$ ]]
then
	reboot
fi
