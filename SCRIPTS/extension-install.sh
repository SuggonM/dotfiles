#!/usr/bin/env bash
set -e

exts=(
	"allowlockedremotedesktop@kamens.us"
	"appindicatorsupport@rgcjonas.gmail.com"
	"bluetooth-battery-monitor@v8v88v8v88.com"
	"color-picker@tuberry"
	"compiz-windows-effect@hermes83.github.com"
	"copyous@boerdereinar.dev"
	"custom-command-list@storageb.github.com"
	"dash-to-dock@micxgx.gmail.com"
	"dynamic-music-pill@andbal"
	"emoji-copy@felipeftn"
	"extension-list@tu.berry"
	"fq@megh"
	"just-perfection-desktop@just-perfection"
	"just_shows_memory_usage@troizet.github.com"
	"lgbutton@glerro.gnome.gitlab.io"
	"lockscreen-extension@pratap.fastmail.fm"
	"simple-timer@majortomvr.github.com"
	"start-overlay-in-application-view@Hex_cz"
	"System_Monitor@bghome.gmail.com"
	"touchpad-gesture-customization@coooolapps.com"
)

pipx install gnome-extensions-cli --system-site-packages

if ! command -v gext > /dev/null; then
	source $HOME/.profile
fi

gext --dbus install "${exts[@]}"

if zenity --question --text="Import extension configs too?"; then
	dconf load /org/gnome/shell/extensions/ < "$(dirname $0)/extensions.dconf"
fi
