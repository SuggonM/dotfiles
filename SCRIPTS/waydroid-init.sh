#!/usr/bin/env sh
set -e

if [ $USER = "root" ]; then
	echo "Do not use sudo."
	exit 1
fi

# probably connect to a fast VPN first
# https://github.com/waydroid/waydroid/issues/623#issuecomment-3864873879
sudo pacman -S --needed waydroid
paru -S --needed --noconfirm waydroid-image waydroid-script-git bindfs

# https://github.com/casualsnek/waydroid_script/issues/251#issuecomment-3757952646
# sudo sed -i 's/if result.stderr:/if result.returncode != 0 and result.stderr:/' \
# 	/opt/waydroid-script/tools/helper.py

# sudo waydroid-extras install microg  # also installs playstore??
sudo waydroid-extras install libhoudini
sudo waydroid-extras install magisk
sudo waydroid shell pm disable com.android.inputmethod.latin
sudo waydroid shell cmd media_session volume --set 15
waydroid prop set persist.waydroid.multi_windows true

# https://github.com/waydroid/waydroid/issues/143#issuecomment-1520857943
sudo sed -i'~' -E 's/=.\$\(command -v (nft|ip6?tables-legacy).*/=/g' \
	/usr/lib/waydroid/data/scripts/waydroid-net.sh

# download microG and F-Droid
# https://github.com/microg/GmsCore/releases/latest
# https://f-droid.org/
