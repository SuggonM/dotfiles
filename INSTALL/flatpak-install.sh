#!/usr/bin/env bash
set -e

flatpaks=(
	app.devsuite.Ptyxis
	app.zen_browser.zen
	com.github.dynobo.normcap
	com.github.tchx84.Flatseal
	com.spotify.Client
	com.usebottles.bottles
	org.gimp.GIMP
	org.gnome.World.Iotas
	org.mozilla.firefox
)

selected=(
	$(printf '%s\n' "${flatpaks[@]}" | fzf --multi --bind ctrl-a:select-all)
)

echo "Selected:"
printf '%s\n' "${selected[@]}" | column

echo flatpak --user install "${selected[@]}"
