#!/usr/bin/env bash

set -e

sudo add-apt-repository -y ppa:lakinduakash/lwh
sudo add-apt-repository -y ppa:obsproject/obs-studio

# https://blog.javinator9889.com/discord-ppa-keep-it-up-to-date-on-linux-easily/
sudo -E gpg --no-default-keyring --keyring=/usr/share/keyrings/javinator9889-ppa-keyring.gpg --keyserver keyserver.ubuntu.com --recv-keys 08633B4AAAEB49FC
sudo tee /etc/apt/sources.list.d/javinator9889-ppa.list <<< "deb [arch=amd64 signed-by=/usr/share/keyrings/javinator9889-ppa-keyring.gpg] https://ppa.javinator9889.com all main"

# https://packagecloud.io/filips/FirefoxPWA
curl -s https://packagecloud.io/install/repositories/filips/FirefoxPWA/script.deb.sh?any=true | sudo bash

pkgs=(
	linux-wifi-hotspot
	obs-studio
	discord
	firefoxpwa
)

sudo apt-get update
sudo apt-get install ${pkgs[@]}
