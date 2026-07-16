#!/data/data/com.termux/files/usr/bin/bash

termux-notification --id 1 -t "Scanning for ADB port..."
adb_port=$(nmap localhost --open -p30000-50000 | grep -m1 -oP "^\d+")

if [[ -z $adb_port ]]; then
	termux-notification --id 1 -t "No debug port detected" -c "Tap to rescan." --action "$(realpath $0)"
	exit
fi

termux-notification --id 1 -t "ADB port detected: $adb_port. Restarting ADB..."
adb connect localhost:$adb_port
adb tcpip 5555
adb kill-server
adb shell settings put global adb_wifi_enabled 0
termux-notification --id 1 -t "Successfully restarted ADB in port 5555"
