#!/usr/bin/env sh

set -e

theme_url="https://github.com/AdisonCavani/distro-grub-themes/raw/master/themes/ubuntu.tar"
font_path="/usr/share/fonts/truetype/noto/NotoSansMono-Regular.ttf"

cd /boot/efi/EFI/grub
sudo mkdir -p theme fonts

curl -fsSL "$theme_url" | sudo tar --no-same-owner -xvf - -C ./theme
sudo grub-mkfont --verbose "$font_path" -s 24 -c 20 -d 4 -o ./fonts/noto_24.pf2
