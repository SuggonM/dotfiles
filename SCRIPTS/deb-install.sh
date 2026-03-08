#!/usr/bin/env bash
set -e

# https://tailscale.com/download/linux
function tailscale {
	curl -fsSL https://tailscale.com/install.sh | sh
}

# https://vencord.dev/download/
function vencord {
	local inject="sed '/  sudo/s/$/ --repair --location \/usr\/share\/discord/'"
	sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh | eval "$inject")"
}

# https://neovim.io/doc/install/#appimage-universal-linux-package
function neovim {
	local url="https://api.github.com/repos/neovim/neovim/releases/latest"
	wget -q -c --show-progress -O /tmp/nvim.appimage $(curl -sS "$url" | grep -o 'https://.*nvim-linux-x86_64.appimage' | head -n1)
	sudo install /tmp/nvim.appimage /usr/bin/nvim
}

# https://yazi-rs.github.io/docs/installation#debian
function yazi {
	local url="https://api.github.com/repos/sxyazi/yazi/releases/latest"
	wget -q -c --show-progress -O /tmp/yazi.deb $(curl -sS "$url" | grep -o 'https://.*x86_64-unknown-linux-gnu.deb')
	sudo apt-get install /tmp/yazi.deb
}

# https://obsidian.md/download
function obsidian {
	local url="https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest"
	wget -q -c --show-progress -O /tmp/obsidian.deb $(curl -sS "$url" | grep -o 'https://.*_amd64.deb')
	sudo apt-get install /tmp/obsidian.deb
}

# https://vscodium.com/#install
function vscodium {
	local url="https://api.github.com/repos/VSCodium/vscodium/releases/latest"
	wget -q -c --show-progress -O /tmp/vscodium.deb $(curl -sS "$url" | grep -o 'https://.*_amd64.deb' | head -n1)
	sudo apt-get install /tmp/vscodium.deb
}

# https://insomnia.rest/download
function insomnia {
	local url="https://updates.insomnia.rest/downloads/ubuntu/latest"
	wget -q -c --show-progress -O /tmp/insomnia.deb "$url"
	sudo apt-get install /tmp/insomnia.deb
}

# https://www.terabox.com/terabox-cloud-storage-for-pc-free-download
function terabox {
	local url="https://www.terabox.com/api/getsyscfg?clienttype=0&language_type=en&cfg_category_keys=%5B%5D&version=0"
	wget -q -c --show-progress -O /tmp/terabox.deb $(curl -sS "$url" | jq -r ".fe_linux_download_setting.cfg_list[0].deb_url")
	sudo apt-get install /tmp/terabox.deb
}

# list all functions and run the one selected by user
apps=$(cat $0 | grep '^function .* {' | awk '{print $2}')
selected=$(echo "$apps" | fzf)
$selected
