sudo echo "'-.-'"

wget https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-x64 -O ./vscode.tar.gz

tar -xvf vscode.tar.gz

rm -rf vscode.tar.gz

mv VSCode-linux-x64 vscode

sudo mv vscode /opt

sudo touch vscode.desktop

echo "[Desktop Entry]
Name=Visual Studio Code
Comment=A code editor from microsoft.
Icon=/opt/vscode/resources/app/resources/linux/code.png
Exec=/opt/vscode/code
Terminal=false
Type=Application
Categories=Development;Editor;Vscode;
StartupNotify=true" >> vscode.desktop 

sudo mv vscode.desktop /usr/share/applications

echo "alias code='/opt/vscode/code'" >> .aliases

rm -rf vscode-setup.sh

source ~/.zshrc
