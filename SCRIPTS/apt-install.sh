#!/usr/bin/env bash
set -e

if ! command -v fzf > /dev/null; then
	sudo apt-get update
	sudo apt-get install fzf
fi

pkgs=(
	adb
	aha  # convert terminal output into html
	anacron
	ani-cli
	aptitude
	arch-install-scripts  # arch-chroot is too convenient
	atool  # archive listing integration with `lf`
	bat
	bindfs  # bind-mount with altered ownership
	build-essential  # compile software from source
	catimg
	clifm
	cmake
	dconf-editor
	default-jdk  # java JDK
	docker.io
	fastfetch
	fd-find  # `find` alternative, nvim-telescope dependency
	ffmpeg
	flatpak
	font-manager
	fprintd  # linux fingerprint interface
	fzf
	gh
	git-delta
	gnome-boxes
	gnome-shell-extension-manager
	gnome-software
	gnome-software-plugin-flatpak
	gnome-sushi  # quick file preview from Nautilus
	gnome-tweaks  # set dark theme on legacy GTK apps
	gparted
	hexedit
	ibus-mozc  # Japanese input
	jq
	keyd  # key remap
	lazygit
	lf
	lolcat
	lua5.4
	lynx
	mediainfo
	mozc-utils-gui  # Mozc dependency
	ncdu
	neovim
	net-tools
	nmap
	openssh-server
	pipx
	plocate
	postgresql
	python3-pip
	qalc
	radare2  # disassembler
	rar  # this is trial version btw :)
	ripgrep  # nvim-telescope dependency
	ruby
	samba
	scrcpy
	sl
	speedtest-cli
	stow
	tldr-py
	tmux
	traceroute
	translate-shell
	tree
	vlc
	wl-clipboard
	woff2
	x11-apps  # detect Xwayland with xeyes
	xxd  # colorful hexdump
	ydotool  # auto clicker
	yq
)

selected=(
	$(printf '%s\n' "${pkgs[@]}" | fzf --multi --cycle --bind ctrl-a:select-all)
)

echo "Selected:"
printf '%s\n' "${selected[@]}" | column

sudo apt-get update
sudo apt-get install "${selected[@]}"
