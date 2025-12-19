#!/usr/bin/env bash

set -e

pkgs=(
	adb
	aha  # convert terminal output into html
	anacron
	aptitude
	atool  # archive listing integration with `lf`
	axel  # download accelerator
	batcat
	bd
	build-essential  # compile software from source
	catimg
	cmake
	dconf-editor
	default-jdk  # java JDK
	drawing
	fastfetch
	fd-find  # `find` alternative, nvim-telescope dependency
	ffmpeg
	flatpak
	font-manager
	fprintd  # linux fingerprint interface. no driver for my PC so f**k the manufacturer
	fzf
	gh
	gnome-boxes
	gnome-shell-extension-manager
	gnome-software
	gnome-software-plugin-flatpak
	gnome-tweaks  # set dark theme on legacy GTK apps
	gparted
	hexedit
	ibus-mozc  # Japanese input
	input-remapper
	jq
	lazygit
	lf
	lolcat
	lua5.4
	lynx
	mozc-utils-gui  # Mozc dependency
	ncdu
	neovim
	net-tools
	nmap
	openssh-server
	plocate
	postgresql
	python3-pip
	qalc
	rar  # this is trial version btw :)
	ripgrep  # nvim-telescope dependency
	ruby
	samba
	scrcpy
	sl
	speedtest-cli
	stow
	tldr
	tmux
	traceroute
	translate-shell
	tree
	wireshark
	wl-clipboard
	woff2
	x11-apps  # detect Xwayland with xeyes
	xxd  # colorful hexdump
	ydotool  # auto clikcer
	yq
)

sudo apt-get update
sudo apt-get install ${pkgs[@]}
