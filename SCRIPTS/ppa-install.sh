#!/usr/bin/env bash
set -e

sudo add-apt-repository -y ppa:lakinduakash/lwh
sudo add-apt-repository -y ppa:mozillateam/ppa
sudo add-apt-repository -y ppa:obsproject/obs-studio

# https://packagecloud.io/filips/FirefoxPWA
curl -s https://packagecloud.io/install/repositories/filips/FirefoxPWA/script.deb.sh?any=true | sudo bash

# https://docs.waydro.id/usage/install-on-desktops#ubuntu-debian-and-derivatives
curl -s https://repo.waydro.id | sudo bash

pkgs=(
	firefox
	firefoxpwa
	linux-wifi-hotspot
	obs-studio
	waydroid
)

sudo apt-get update
sudo apt-get install "${pkgs[@]}"
