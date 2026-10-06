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
echo ":: Applying fix for taskbar not appearing due to initial null state."
	settings --lineage put system enable_taskbar 1
