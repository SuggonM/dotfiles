#!/usr/bin/env bash

pkgs=(
	arch-install-scripts
	base-devel
	bash-completion
	btop
	btrfs-progs
	cronie
	cryptsetup
	curl
	dosfstools
	e2fsprogs
	fastfetch
	fuse3
	gptfdisk
	git
	hexedit
	jq
	less
	lsof
	man-db
	mediainfo
	ncdu
	neovim
	net-tools
	nmap
	openssh
	stow
	tmux
	tree
	usbutils
	vim
	wget
	wl-clipboard
	zenity
	zip
)

sudo pacman -Syu --needed --noconfirm "${pkgs[@]}"
