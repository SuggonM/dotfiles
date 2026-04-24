#!/usr/bin/env bash
set -e

flatpaks=(
	app.zen_browser.zen
	# com.dec05eba.gpu_screen_recorder
	com.github.dynobo.normcap
	com.github.PintaProject.Pinta
	com.github.tchx84.Flatseal
	com.usebottles.bottles
	fr.handbrake.ghb
	io.github.ungoogled_software.ungoogled_chromium
	org.gimp.GIMP
)

selected=(
	$(printf '%s\n' "${flatpaks[@]}" | fzf --multi --bind ctrl-a:select-all)
)

echo "Selected:"
printf '%s\n' "${selected[@]}" | column

flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user install "${selected[@]}"
