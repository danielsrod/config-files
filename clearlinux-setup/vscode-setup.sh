sudo echo "'-.-'"
echo ">>> Downloading VSCode <<<"
wget https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-x64 -O ./vscode.tar.gz
echo ">>> Unpacking VSCode <<<"
tar -xvf vscode.tar.gz
echo ">>> Remove tar file downloaded <<<"
rm -rf vscode.tar.gz
echo ">>> Rename the folder to vscode <<<"
mv VSCode-linux-x64 vscode
echo ">>> Moving the folder vscode to /opt/"
sudo mv vscode /opt
echo ">>> Creating a file vscode.desktop <<<"
touch vscode.desktop
echo ">>> Appeding text Desktop Entry in the file vscode.desktop  <<<"
pwd
echo "[Desktop Entry]
Name=Visual Studio Code
Comment=A code editor from microsoft.
Icon=/opt/vscode/resources/app/resources/linux/code.png
Exec=/opt/vscode/code
Terminal=false
Type=Application
Categories=Development;Editor;Vscode;
StartupNotify=true" >> vscode.desktop 
echo ">>> Moving the file vscode.desktop to /usr/share/applications  <<<"
sudo mv vscode.desktop /usr/share/applications
echo ">>> Creating alias [code=/opt/vscode/code]  <<<"
echo "alias code='/opt/vscode/bin/code'" >> ~/.aliases

echo "Please, reboot your terminal to apply changes"
