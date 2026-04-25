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
	arch-install-scripts  # arch-chroot is too convenient
	bat
	bindfs  # bind-mount with altered ownership
	breeze  # kde app themes
	build-essential  # compile software from source
	catimg
	clifm
	cmake
	curl
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
	git
	git-delta
	gnome-boxes
	gnome-shell-extension-manager
	gnome-software
	gnome-software-plugin-flatpak
	gnome-sushi  # quick file preview from Nautilus
	gnome-tweaks  # change themes, mouse behavior
	gparted
	hexedit
	jq
	kate
	keyd  # key remap
	lazygit
	lf
	lolcat
	lua5.4
	lynx
	mediainfo
	ncdu
	net-tools
	nmap
	npm
	openssh-server
	pipx
	plocate
	postgresql
	python3-pip
	qalc
	radare2  # disassembler
	rar  # this is trial version btw :)
	reptyr  # adopt a disowned/runaway process
	ripgrep  # nvim-telescope dependency
	ruby
	samba
	scrcpy
	sl
	speedtest-cli
	stow
	systemd-zram-generator
	tealdeer
	tmux
	traceroute
	translate-shell
	tree
	tree-sitter-cli
	vlc
	wl-clipboard
	x11-apps  # detect Xwayland with xeyes
	xxd  # colorful hexdump
	yq
)

selected=(
	$(printf '%s\n' "${pkgs[@]}" | fzf --multi --cycle --bind ctrl-a:select-all)
)

echo "Selected:"
printf '%s\n' "${selected[@]}" | column

sudo apt-get update
sudo apt-get install "${selected[@]}"
