#!/usr/bin/env bash

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

flatpak --user install ${flatpaks[@]}
