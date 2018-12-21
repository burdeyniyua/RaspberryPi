#!/bin/bash
#sudo passwd root
sudo apt-get update
sudo apt-get install pure-ftpd xrdp nmap mtr console-cyrillic mc htop -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo rpi-update
sudo apt-get autoremove -y
sudo apt-get autoclean -y
