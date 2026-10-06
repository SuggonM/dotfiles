#!/system/bin/sh
# to be run inside an android shell

echo ":: Setting media volume to 100%."
	cmd media_session volume --set 15
echo ":: Disabling virtual keyboard."
	pm disable com.android.inputmethod.latin
echo ":: Enabling Developer options."
	settings put global development_settings_enabled 1
echo ":: Hiding rotation and battery icon from status bar."
	settings put secure icon_blacklist rotate,battery
echo ":: Hiding brightness slider."
	settings --lineage put secure qs_show_brightness_slider 0
echo ":: Increasing cursor size to 150%."
	settings put system pointer_scale 1.5
echo ":: Bypassing LineageOS setup wizard."
	pm disable org.lineageos.setupwizard
	settings put secure user_setup_complete 1
	settings put global device_provisioned 1
echo ":: For better Action key functionality, remap Ctrl -> Action and Alt -> Ctrl in"
echo ":: Settings > System > Keyboard > Physical keyboard > Modifier keys"

# old fixes for a16-qpr; no longer needed
# echo ":: Enabling persistent USB debugging state."
# 	setprop persist.sys.usb.config adb
# echo ":: Changing screenlock from Swipe to None."
# 	cmd lock_settings set-disabled true
# echo ":: Unable to hide battery icon; switching to minimal one instead."
# 	settings --lineage put system status_bar_battery_style 1
