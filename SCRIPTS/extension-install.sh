#!/usr/bin/env bash
set -e

exts=(
	"allowlockedremotedesktop@kamens.us"
	"appindicatorsupport@rgcjonas.gmail.com"
	"arcmenu@arcmenu.com"
	"clipboard-indicator@tudmotu.com"
	"color-picker@tuberry"
	"compiz-windows-effect@hermes83.github.com"
	"custom-command-list@storageb.github.com"
	"custom-command-toggle@storageb.github.com"
	"dash-to-dock@micxgx.gmail.com"
	"dynamic-music-pill@andbal"
	"emoji-copy@felipeftn"
	"extension-list@tu.berry"
	"fq@megh"
	"just-perfection-desktop@just-perfection"
	"just_shows_memory_usage@troizet.github.com"
	"lgbutton@glerro.gnome.gitlab.io"
	"lockkeys@vaina.lt"
	"lockscreen-extension@pratap.fastmail.fm"
	"simple-timer@majortomvr.github.com"
	"start-overlay-in-application-view@Hex_cz"
	"System_Monitor@bghome.gmail.com"
	"touchpad-gesture-customization@coooolapps.com"
)

pipx install gnome-extensions-cli --system-site-packages
gext --dbus install "${exts[@]}"
