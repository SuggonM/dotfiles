#!/bin/env bash

sudo add-apt-repository -y ppa:lakinduakash/lwh
sudo add-apt-repository -y ppa:obsproject/obs-studio

# https://blog.javinator9889.com/discord-ppa-keep-it-up-to-date-on-linux-easily/
sudo -E gpg --no-default-keyring --keyring=/usr/share/keyrings/javinator9889-ppa-keyring.gpg --keyserver keyserver.ubuntu.com --recv-keys 08633B4AAAEB49FC
sudo tee /etc/apt/sources.list.d/javinator9889-ppa.list <<< "deb [arch=amd64 signed-by=/usr/share/keyrings/javinator9889-ppa-keyring.gpg] https://ppa.javinator9889.com all main"

# https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
rm -f microsoft.gpg
echo 'Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/microsoft.gpg' | sudo tee /etc/apt/sources.list.d/vscode.sources

sudo apt-get update
sudo apt-get install linux-wifi-hotspot obs-studio discord code-insiders
