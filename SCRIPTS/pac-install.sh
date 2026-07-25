#!/usr/bin/env bash
set -e

if ! command -v fzf > /dev/null; then
	sudo pacman -Sy --noconfirm fzf
fi

pkgs=(
	aha  # convert terminal output into html
	android-tools
	arch-install-scripts  # arch-chroot is too convenient
	base-devel # compile software from source
	bat
	bazaar
	breeze  # kde plasma themes
	catimg
	cmake
	cronie
	cryptsetup
	curl
	dconf-editor
	docker
	extension-manager
	fastfetch
	fd  # `find` alternative, nvim-telescope dependency
	ffmpeg
	file-roller
	flatpak
	font-manager
	fprintd  # linux fingerprint interface
	fzf
	gptfdisk
	git
	git-delta
	github-cli
	gnome-boxes
	gnome-tweaks  # change themes, mouse behavior
	gparted
	hexedit
	ibus-anthy  # Japanese input
	jdk-openjdk  # java JDK
	jq
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
	mediainfo
	ncdu
	net-tools
	nmap
	noto-fonts-cjk
	npm
	openssh
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
	stow
	sushi  # quick file preview from Nautilus
	tldr
	tmux
	traceroute
	translate-shell
	transmission-gtk  # torrent client
	tree
	tree-sitter-cli
	unrar
	vim
	vlc
	wl-clipboard
	xorg-xeyes  # detect Xwayland with xeyes
	yq
	zoxide
	zram-generator

	# AUR
	ani-cli
	bindfs  # bind-mount with altered ownership
	limitcpu
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
