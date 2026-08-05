#!/usr/bin/env bash
set -e

if ! command -v fzf > /dev/null; then
	sudo pacman -Sy --noconfirm fzf
fi

pkgs=(
	act
	aha  # convert terminal output into html
	android-tools
	bat
	bazaar
	breeze  # kde plasma themes
	catimg
	cmake
	dconf-editor
	discord
	docker
	extension-manager
	fd  # `find` alternative, nvim-telescope dependency
	ffmpeg
	file-roller
	firefoxpwa
	flatpak
	font-manager
	fprintd  # linux fingerprint interface
	fzf
	gimp
	git-delta
	github-cli
	gnome-boxes
	gnome-tweaks  # change themes, mouse behavior
	gparted
	gpu-screen-recorder-ui
	ibus-anthy  # Japanese input
	inotify-tools
	jdk-openjdk  # java JDK
	keyd  # key remap
	kwrite
	lazygit
	lesspipe
	lf
	libqalculate
	libreoffice-fresh
	lolcat
	lua
	lynx
	noto-fonts-cjk
	npm
	obsidian
	playerctl
	plocate
	postgresql
	ptyxis
	python-pip
	python-pipx
	qrencode
	radare2  # disassembler
	reptyr  # adopt a disowned/runaway process
	ripgrep  # nvim-telescope dependency
	ruby
	samba
	scrcpy
	sl
	speedtest-cli
	sushi  # quick file preview from Nautilus
	tailscale
	tldr
	traceroute
	translate-shell
	transmission-gtk  # torrent client
	tree-sitter-cli
	unrar
	vlc
	waydroid
	xorg-xeyes  # detect Xwayland with xeyes
	yazi
	yq
	zoxide
	zram-generator

	# AUR
	ani-cli
	bindfs  # bind-mount with altered ownership
	blesh-git
	bottles
	helium-browser-bin
	insomnia-bin
	limitcpu
	normcap
	osu-lazer-bin
	pinta
	snapcast
	vencord-hook
	vscodium-bin
	zen-browser-bin
)

filtered=()
for pkg in "${pkgs[@]}"; do
	if ! pacman -Q "$pkg" &> /dev/null; then
		filtered+=("$pkg")
	fi
done

selected=(
	$(printf '%s\n' "${filtered[@]}" | fzf --multi --cycle --bind ctrl-a:select-all)
)

echo "Selected:"
printf '%s\n' "${selected[@]}" | column

paru -Syu "${selected[@]}"
