#!/usr/bin/env bash

set -e

exts=(
	"allowlockedremotedesktop@kamens.us"
	"arcmenu@arcmenu.com"
	"blur-my-shell@aunetx"
	"clipboard-indicator@tudmotu.com"
	"color-picker@tuberry"
	"compiz-windows-effect@hermes83.github.com"
	"custom-command-list@storageb.github.com"
	"custom-command-toggle@storageb.github.com"
	"dash-to-dock@micxgx.gmail.com"
	"disconnect-wifi@kgshank.net"
	"emoji-copy@felipeftn"
	"extension-list@tu.berry"
	"fq@megh"
	"gsconnect@andyholmes.github.io"
	"just-perfection-desktop@just-perfection"
	"just_shows_memory_usage@troizet.github.com"
	"lgbutton@glerro.gnome.gitlab.io"
	"lockkeys@vaina.lt"
	"lockscreen-extension@pratap.fastmail.fm"
	"mediacontrols@cliffniff.github.com"
	"one-thing@github.com"
	"simple-timer@majortomvr.github.com"
	"System_Monitor@bghome.gmail.com"
	"touchpad-gesture-customization@coooolapps.com"
	"unity-like-appswitcher@gonza.com"
)

venv_dir="$HOME/.venv"
activate="$venv_dir/bin/activate"
[[ -f "$activate" ]] || ( echo "Initialize the ~/.venv first." && exit 1 )

cd $venv_dir
source $activate
pip install --upgrade git+https://github.com/essembeh/gnome-extensions-cli

gext install ${exts[@]}
