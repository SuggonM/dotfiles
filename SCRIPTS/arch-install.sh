#!/usr/bin/env bash
set -ex

setfont ter-128b

iwctl station wlan0 scan
iwctl station wlan0 connect "B-Link 5G" --passphrase "Apple8188"

label="/dev/disk/by-label"
partlabel="/dev/disk/by-partlabel"

[ -b "$label/arch" ] && exit 1
[ -b "$partlabel/Arch-partition" ] && exit 1

sgdisk -n 0:0:+60G -c 0:Arch-partition /dev/nvme0n1
mkfs.btrfs $partlabel/Arch-partition
btrfs filesystem label $partlabel/Arch-partition arch
partprobe

mount --mkdir $label/arch /mnt/arch
btrfs subvolume create /mnt/arch/{@,@home,@swap,@snapshots,@var_log}
btrfs filesystem mkswapfile --size 4G /mnt/arch/@swap/swapfile
btrfs property set /mnt/arch/@ compression zstd
btrfs property set /mnt/arch/@home compression zstd
btrfs property set /mnt/arch/@var_log compression zstd

mount --mkdir $label/arch -o subvol=@ /mnt/archroot
mount --mkdir $label/arch -o subvol=@home /mnt/archroot/home
mount --mkdir $label/arch -o subvol=@var_log /mnt/archroot/var/log
mount --mkdir $label/arch -o subvol=@swap /mnt/archroot/swap
mount --mkdir $label/ESP /mnt/archroot/efi
swapon /mnt/archroot/swap/swapfile

reflector --save /etc/pacman.d/mirrorlist \
	--protocol https \
	--country Nepal,India,Singapore \
	--sort rate \
	--verbose

# for an all-AMD PC. (i use AMD btw?)
pacstrap -K /mnt/archroot base linux linux-firmware-{amdgpu,mediatek} amd-ucode btrfs-progs

genfstab -L /mnt/archroot >> /mnt/archroot/etc/fstab

arch-chroot /mnt/archroot bash -ex << EOF
pacman -S --noconfirm networkmanager dosfstools man-db grub efibootmgr os-prober fuse3 neovim ufw base-devel git

ln -sf /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "FONT=ter-128b" > /etc/vconsole.conf
echo "arch" > /etc/hostname

systemctl enable NetworkManager
passwd --stdin <<< 2456

echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

useradd -m suggon
passwd suggon --stdin <<< 2456
usermod -aG wheel suggon
nvim --headless /etc/sudoers \
	+'/%wheel' \
	+'norm gcc' \
	+'wq!'

systemctl enable ufw
ufw enable
ufw allow from 192.168.1.0/24
ufw limit ssh
ufw default allow FORWARD

su - suggon -c "git clone https://aur.archlinux.org/paru-alpm-bin && cd paru-alpm-bin && makepkg -s"
pacman -U --noconfirm ~suggon/paru-alpm-bin/paru-alpm-bin-[0-9]*.pkg.tar.zst
rm -r ~suggon/paru-alpm-bin/

pacman -S --noconfirm pipewire wireplumber pipewire-pulse pipewire-jack
pacman -S --noconfirm noto-fonts ttf-ubuntu-font-family ttf-input-nerd terminus-font
pacman -S --noconfirm baobab gdm gnome-calculator gnome-characters gnome-clocks ptyxis gnome-control-center gnome-disk-utility gnome-logs gnome-remote-desktop gnome-session gnome-settings-daemon gnome-shell resources gst-thumbnailers gvfs gvfs-mtp gvfs-smb gvfs-wsdd loupe nautilus papers sushi xdg-desktop-portal-gnome xdg-user-dirs-gtk

systemctl enable gdm bluetooth

su - suggon -c "git clone https://github.com/SuggonM/dotfiles --branch arch"
EOF
