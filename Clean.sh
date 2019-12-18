#!/bin/sh
echo "CLEANING TMP"
sudo rm -rf /var/tmp/*
echo ""
echo ""


echo "CLEANING CACHE"
sudo apt clean -y
echo ""
echo ""


echo "DELETE UNUSED PACKAGES"
sudo apt autoremove -y
echo ""
echo ""


echo "REMOVE DUPLICATED FILES"
sudo apt autoclean -y
echo ""
echo ""


echo "REPAIR BROKEN PACKAGES"
sudo dpkg --configure -a
