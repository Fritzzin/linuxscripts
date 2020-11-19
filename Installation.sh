#!/bin/sh

echo "UPDATE"
sudo apt update && sudo apt upgrade -y
echo ""
echo ""

sudo apt install software-properties-common -y


echo "DEVELOPMENT"
sudo apt install openssh-client openjdk-8-jdk vim nano git nodejs npm -y
echo ""
echo ""


echo "BROWSER"
sudo apt install firefox -y
echo ""
echo ""


echo "SYSTEM"
sudo apt install timeshift ufw tlp tlp-rdw -y
echo ""
echo ""


echo "MULTIMEDIA"
sudo apt install vlc ubuntu-restricted-extras -y
echo ""
echo ""


echo "COMPRESSION"
sudo apt install unzip gzip p7zip-full p7zip-rar unrar unrar-free -y
echo ""
echo ""


echo "MISC/THEMING"
sudo apt install wget neofetch curl build-essential papirus-icon-theme -y
echo ""
echo ""


echo "NANO SYNTAX HIGHLIGHT"
wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
echo ""
echo ""


echo"ENABLE FIREWALL"
sudo ufw enable && sudo ufw allow ssh && sudo systemctl enable ufw
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow postgresql
echo ""
echo ""


echo"ENABLE TLP"
sudo tlp start && sudo systemctl enable tlp
echo ""
echo ""


echo "BASHRC PS1"
echo 'export PS1="\[\e[34m\]\w\[\e[m\]\\$ "' >> ~/.bashrc


echo "CREATING ALIASES"
touch ~/.bash_aliases
echo "
# BASH
alias bashrc=\"nano ~/.bashrc\"
alias aliases=\"nano ~/.bash_aliases\"

# MAINTENANCE
alias update=\"~/.scripts/Update.sh\"
alias clean=\"~/.scripts/Clean.sh\"

# MISC
alias weather=\"curl http://wttr.in/Brazil:Lajeado\"

" >> ~/.bash_aliases
echo ""
echo ""


echo "GIT CONFIGURATION"
git config --global user.name "Augusto Fritz"
git config --global user.email "augusto.fritz@universo.univates.br"

# Create scripts folder
mkdir ~/.scripts
mv Update.sh ~/.scripts
mv Clean.sh ~/.scripts
mv MonoAudio.sh ~/.scripts
