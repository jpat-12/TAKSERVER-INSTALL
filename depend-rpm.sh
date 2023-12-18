#!/bin/bash

echo "____________________________________"
echo "____________________________________"
read -p "Do you want to edit root? (Y/n) " install_root
echo "____________________________________"
echo "____________________________________"

if [[ "$install_root" =~ ^[Yy]$|^$ ]]; then
    sudo passwd root
    echo "____________________________________"
    echo "____________________________________"
    echo "Exit this script and run as root"
    echo "____________________________________"
    echo "____________________________________"
    su
    read -p "Press any key to continue" anykey
fi

# Dependency Install
echo "____________________________________"
echo "____________________________________"
read -p "Do you want to install dependencies? (Y/n) " install_dep
echo "____________________________________"
echo "____________________________________"

if [[ "$install_dep" =~ ^[Yy]$|^$ ]]; then
    sudo yum update
    sudo yum install -y git
    sudo yum install -y curl
    sudo yum install -y nano
    sudo yum install -y vim
    sudo yum install -y wget
    sudo yum install -y net-tools
    sudo yum install -y gdown
    ifconfig
    sleep 2
fi

# Anydesk
echo "____________________________________"
echo "____________________________________"
read -p "Do you want to install Anydesk? (Y/n) " install_anydesk
echo "____________________________________"
echo "____________________________________"

if [[ "$install_anydesk" =~ ^[Yy]$|^$ ]]; then
    sudo rpm --import https://keys.anydesk.com/repos/RPM-GPG-KEY
    sudo sh -c 'echo -e "[AnyDesk]\nname=AnyDesk RPM Repository\nbaseurl=http://rpm.anydesk.com/centos/\$basearch/\nenabled=1\ngpgcheck=1\ngpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY\ngpgcheck=1" > /etc/yum.repos.d/anydesk.repo'
    sudo yum install -y anydesk

    echo "Please launch Anydesk and ensure you change settings to allow for unattended access"
    echo "Anydesk installed."
    sleep 10
fi

# Google Chrome
echo "____________________________________"
echo "____________________________________"
read -p "Do you want to install Google Chrome? (Y/n) " install_chrome
echo "____________________________________"
echo "____________________________________"

if [[ "$install_chrome" =~ ^[Yy]$|^$ ]]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
    sudo yum install -y ./google-chrome-stable_current_x86_64.rpm
    echo "Google Chrome installed."
fi

# SSH Server
echo "____________________________________"
echo "____________________________________"
read -p "Do you want to install the SSH Server? (Y/n) " install_ssh
echo "____________________________________"
echo "____________________________________"

if [[ "$install_ssh" =~ ^[Yy]$|^$ ]]; then
    sudo yum install -y openssh-server
    sudo systemctl enable sshd
    sudo systemctl start sshd
    sudo vi /etc/ssh/sshd_config
    sudo systemctl restart sshd
    echo "SSH Server installed and restarted."
    exit
fi

# ZeroTier
echo "____________________________________"
echo "____________________________________"
read -p "Do you want to install ZeroTier? (Y/n) " install_zerotier
echo "____________________________________"
echo "____________________________________"

if [[ "$install_zerotier" =~ ^[Yy]$|^$ ]]; then
    sudo yum install -y curl
    sudo rpm --import https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg
    curl -s 'https://install.zerotier.com/' | sudo bash
    sudo zerotier-cli join 565799d8f6f670e6
    echo "ZeroTier installed and joined network 565799d8f6f670e6."
fi

echo "-------------------------------------"
echo "-------------------------------------"
echo "-----------Script complete-----------"
echo "-------------------------------------"
echo "-------------------------------------"
