#!/usr/bin/env bash
set -e

flatpaks=(
	app.devsuite.Ptyxis
	app.zen_browser.zen
	com.github.tchx84.Flatseal
	com.github.tenderowl.frog
	com.spotify.Client
	org.gimp.GIMP
	org.gnome.World.Iotas
	org.localsend.localsend_app
	org.mozilla.firefox
)

selected=(
	$(printf '%s\n' "${flatpaks[@]}" | fzf --multi --bind ctrl-a:select-all)
)

echo "Selected:"
printf '%s\n' "${selected[@]}" | column

echo flatpak --user install "${selected[@]}"
