#!/bin/sh

# Variables
BRAVE_KEYRING_PATH="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
BRAVE_KEYRING="https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"

BRAVE_REPOSITORY="https://brave-browser-apt-release.s3.brave.com/"
BRAVE_REPOSITORY_PATH="/etc/apt/sources.list.d/brave-browser-release.list"

SCRIPTS_FOLDER="$HOME/.scripts"


echo -e "\n\n UPDATE AND INSTALL UPDATES"
sudo apt update && sudo apt upgrade -y


echo -e "\n\n CURL AND WGET"
sudo apt install wget curl -y


echo -e "\n\n BRAVE"
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo $BRAVE_KEYRING_PATH $BRAVE_KEYRING
echo "deb [signed-by=$BRAVE_KEYRING_PATH arch=amd64] $BRAVE_REPOSITORY stable main"|sudo tee $BRAVE_REPOSITORY_PATH
sudo apt update -y
sudo apt install brave-browser -y


echo -e "\n\n DEVELOPMENT"
sudo apt install build-essential openssh-client default-jdk default-jre vim git nodejs npm -y


echo -e "\n\n BATTERY MANAGEMENT"
sudo apt install tlp tlp-rdw -y


echo -e "\n\n SECURITY"
sudo apt install ufw -y


echo -e "\n\n BACKUP TOOLS"
sudo apt install timeshift -y


echo -e "\n\n MULTIMEDIA CODECS"
sudo apt install vlc -y


echo -e "\n\n COMPRESSION"
sudo apt install unzip gzip p7zip-full p7zip-rar unrar unrar-free -y


echo -e "\n\n MISC/THEMING"
sudo apt install neofetch papirus-icon-theme software-properties-common -y


echo -e "\n\n ENABLE FIREWALL"
sudo ufw enable
sudo systemctl enable ufw


echo -e "\n\n ENABLE TLP"
sudo tlp start
sudo systemctl enable tlp


echo -e "\n\n CREATING BASH ALIASES"
touch ~/.bash_aliases
echo "
# BASH
alias bashrc=\"nano ${HOME}/.bashrc\"
alias aliases=\"nano ${HOME}/.bash_aliases\"

# MAINTENANCE
alias update=\"${SCRIPTS_FOLDER}/Update.sh\"
alias clean=\"${SCRIPTS_FOLDER}/Clean.sh\"
" >> ~/.bash_aliases


echo -e "\n\n CREATING SCRIPTS FOLDER AND MOVING SCRIPTS"
mkdir $SCRIPTS_FOLDER
mv Update.sh $SCRIPTS_FOLDER
mv Clean.sh $SCRIPTS_FOLDER
mv MonoAudio.sh $SCRIPTS_FOLDER


echo -e "\n\n DONE \n\n"