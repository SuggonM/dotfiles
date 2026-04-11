#!/usr/bin/env sh
set -e

virtual="$HOME/waydroid"
real="$HOME/.local/share/waydroid/data"

mkdir -p "$virtual"
mkdir -p "$virtual/app"
mkdir -p "$virtual/data"
mkdir -p "$virtual/media"
ln -s -fn "$real" "$virtual/all"

pkexec sh -c "
	bindfs -u $USER -g $USER $real/app $virtual/app
	bindfs -u $USER -g $USER $real/data $virtual/data
	bindfs -u $USER -g $USER $real/media/0 $virtual/media
"
