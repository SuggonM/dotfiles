#!/usr/bin/env sh
sudo modprobe zram
sudo zramctl /dev/zram0 --algorithm lz4 --size 5G
sudo mkswap /dev/zram0
sudo swapon --priority 1 /dev/zram0
swapon
