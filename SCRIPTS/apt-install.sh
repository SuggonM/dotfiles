#!/usr/bin/env bash
set -e

if ! command -v fzf > /dev/null; then
	apt-get update
	apt-get install fzf root-repo
fi

pkgs=(
	android-tools
	bat
	bindfs
	fastfetch
	fzf
	gh
	git-delta
	jq
	lazygit
	lf
	mlocate
	ncdu
	neovim
	net-tools
	nmap
	openssh
	qalc
	root-repo
	sl
	speedtest-go
	stow
	tealdeer
	tmux
	traceroute
	translate-shell
	tree
	yq
)

selected=(
	$(printf '%s\n' "${pkgs[@]}" | fzf --multi --cycle --bind ctrl-a:select-all)
)

echo "Selected:"
printf '%s\n' "${selected[@]}" | column

apt-get update
apt-get install "${selected[@]}"
