#!/bin/env bash

# https://tailscale.com/download/linux
function tailscale {
	curl -fsSL https://tailscale.com/install.sh | sh
}

# https://vencord.dev/download/
function vencord {
	local inject="sed '/  sudo/s/$/ --repair --location \/usr\/share\/discord/'"
	sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh | eval "$inject")"
}

# https://www.google.com/chrome/next-steps.html
function chrome {
	local url="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	wget -q --show-progress -O /tmp/chrome.deb "$url"
	sudo apt-get install /tmp/chrome.deb
}

# https://obsidian.md/download
function obsidian {
	local url="https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest"
	wget -q --show-progress -O /tmp/obsidian.deb $(curl -sS "$url" | grep -o 'https://.*_amd64.deb')
	sudo apt-get install /tmp/obsidian.deb
}

# https://vscodium.com/#install
function vscodium {
	local url="https://api.github.com/repos/VSCodium/vscodium/releases/latest"
	wget -q --show-progress -O /tmp/vscodium.deb $(curl -sS "$url" | grep -o 'https://.*_amd64.deb' | head -n1)
	sudo apt-get install /tmp/vscodium.deb
}

# https://insomnia.rest/download
function insomnia {
	local url="https://updates.insomnia.rest/downloads/ubuntu/latest"
	wget -q --show-progress -O /tmp/insomnia.deb "$url"
	sudo apt-get install /tmp/insomnia.deb
}

# https://www.terabox.com/terabox-cloud-storage-for-pc-free-download
function terabox {
	local url="https://www.terabox.com/api/getsyscfg?clienttype=0&language_type=en&cfg_category_keys=%5B%5D&version=0"
	wget -q --show-progress -O /tmp/terabox.deb $(curl -sS "$url" | jq -r ".fe_linux_download_setting.cfg_list[0].deb_url")
	sudo apt-get install /tmp/terabox.deb
}

# https://software.opensuse.org/download.html?project=home:archcrack&package=clifm
function clifm {
	local url="https://software.opensuse.org/download/package.json?project=home:archcrack&package=clifm"
	wget -q --show-progress -O /tmp/clifm.deb $(curl -sS "$url" | jq | grep -o "https://.*.xUbuntu_.*.deb" | fzf)
	sudo apt-get install /tmp/clifm.deb
}

# invoke update function: either arg 1 or interactive fzf
apps=$(cat $0 | grep '^function .* {' | awk '{print $2}')
selected=$([ -n "$1" ] && echo "$1" || (echo "$apps" | fzf))
$selected
