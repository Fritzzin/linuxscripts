#!/bin/sh

echo "UPDATE AND INSTALL UPDATES"
sudo apt update && sudo apt upgrade -y
echo ""
echo ""

echo "BRAVE"
sudo apt install apt-transport-https curl -y

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y

sudo apt install brave-browser -y


echo "DEVELOPMENT"
sudo apt install build-essential wget curl openssh-client default-jdk default-jre vim nano git nodejs npm -y
echo ""
echo ""

echo "BATTERY MANAGEMENT"
sudo apt install tlp tlp-rdw -y
echo ""
echo ""

echo "SECURITY"
sudo apt install ufw -y
echo ""
echo ""

echo "BACKUP TOOLS"
sudo apt install timeshift -y
echo ""
echo ""


echo "MULTIMEDIA CODECS"
sudo apt install vlc -y
echo ""
echo ""


echo "COMPRESSION"
sudo apt install unzip gzip p7zip-full p7zip-rar unrar unrar-free -y
echo ""
echo ""


echo "MISC/THEMING"
sudo apt install neofetch papirus-icon-theme software-properties-common -y
echo ""
echo ""


echo "NANO SYNTAX HIGHLIGHT"
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
echo ""
echo ""


echo "ENABLE FIREWALL"
sudo ufw enable
sudo systemctl enable ufw
echo ""
echo ""


echo "ENABLE TLP"
sudo tlp start
sudo systemctl enable tlp
echo ""
echo ""


echo "CREATING BASH ALIASES"
touch ~/.bash_aliases
echo "
# BASH
alias bashrc=\"nano ~/.bashrc\"
alias aliases=\"nano ~/.bash_aliases\"

# MAINTENANCE
alias update=\"~/.scripts/Update.sh\"
alias clean=\"~/.scripts/Clean.sh\"

" >> ~/.bash_aliases
echo ""
echo ""


echo "CREATING SCRIPTS FOLDER AND MOVING SCRIPTS"
mkdir ~/.scripts
mv Update.sh ~/.scripts
mv Clean.sh ~/.scripts
mv MonoAudio.sh ~/.scripts
echo ""
echo ""

echo "DONE"