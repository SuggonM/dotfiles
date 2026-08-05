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
	breeze  # kde plasma themes
	build-essential  # compile software from source
	catimg
	cmake
	cpulimit
	cryptsetup
	curl
	dconf-editor
	default-jdk  # java JDK
	docker.io
	fastfetch
	fd-find  # `find` alternative, nvim-telescope dependency
	ffmpeg
	file-roller
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
	kwrite
	keyd  # key remap
	lazygit
	lf
	libgtop2-dev  # System Monitor GNOME extension dependency
	libreoffice-calc
	libreoffice-gtk3
	libreoffice-impress
	libreoffice-writer
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
	playerctl
	plocate
	postgresql
	python3-pip
	qalc
	qrencode
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
	transmission-gtk  # torrent client
	tree
	tree-sitter-cli
	vlc
	wl-clipboard
	x11-apps  # detect Xwayland with xeyes
	xxd  # colorful hexdump
	yq
	zoxide
)

filtered=()
for pkg in "${pkgs[@]}"; do
	if ! dpkg -s "$pkg" &> /dev/null; then
		filtered+=("$pkg")
	fi
done

selected=(
	$(printf '%s\n' "${filtered[@]}" | fzf --multi --cycle --bind ctrl-a:select-all)
)

echo "Selected:"
printf '%s\n' "${selected[@]}" | column

sudo apt-get update
sudo apt-get install "${selected[@]}"
