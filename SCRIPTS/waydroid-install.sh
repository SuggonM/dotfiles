#!/usr/bin/env sh
set -e

if [ $USER = "root" ]; then
	echo "Do not use sudo."
	exit 1
fi

# if sourceforge is slow, connect to a VPN
# https://github.com/waydroid/waydroid/issues/623#issuecomment-3864873879
sudo pacman -S --needed waydroid
paru -S --needed --noconfirm waydroid-script-git bindfs

sudo waydroid init

# mkdir first to avoid waydroid_script creating missing dirs as root
mkdir -p $HOME/.local/share/waydroid/data/
sudo waydroid-extras install libhoudini
sudo waydroid-extras install magisk

waydroid show-full-ui &
sleep 10

sudo waydroid shell < "$(dirname "$0")/waydroid-configure.sh"

wget -q --show-progress -O /tmp/fdroid.apk "https://f-droid.org/F-Droid.apk"
waydroid app install /tmp/fdroid.apk
echo "Open F-Droid and add microG and IzzyOnDroid repos:"
echo "https://repo.microg.org/fdroid/repo"
echo "https://apt.izzysoft.de/fdroid/repo"

# arch-only issue?
# https://github.com/waydroid/waydroid/issues/143#issuecomment-1520857943
# sudo sed -i'~' -E 's/=.\$\(command -v (nft|ip6?tables-legacy).*/=/g' \
# 	/usr/lib/waydroid/data/scripts/waydroid-net.sh
