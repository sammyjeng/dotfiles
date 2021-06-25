#!/bin/bash

echo "Updating repositories..."
sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
	echo "Installing: ${1}..."
	apt install -y $1
  else
	echo "Already installed: ${1}"
  fi
}

install stow
install nvim
install rofi
install fonts-powerline
install ranger
install kitty
install tilda
install tmux
install bless
install fonts-firacode
install htop
install dbeaver
install wireshark
install smbclinet
install gimp
install inkscape
install qbittorrent
install telegram-desktop
install mpv
install shotwell
install audacity
install nmap
# install steghide
install exiftool
install zeal #offline docs

# manual installs list
# github "owasp zap"
# github "exploitdb"
# wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O /opt/SecList.zip && unzip SecList.zip && rm -f SecList.zip

# brave-browser
# install apt-transport-https curl
# curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
# echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# sudo apt install brave-browser
# ghidra-sre
# radare from git-master
