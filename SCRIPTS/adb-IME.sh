#!/usr/bin/env bash

# a readline-based IME "shell" for android that i hacked together to circumvent banwords
# after realizing one of my games had switched to substring-based banword matching
# making the chat censorship unbearable

#  input: circumvent
# output: circ.umvent

if [ -n "$ADB_DEV" ]; then
	command adb connect "$ADB_DEV" || exit 1
	adb() { command adb -s "$ADB_DEV" "$@"; }
fi

if ! adb shell :; then
	echo 'Tip: Specify the device to use with $ADB_DEV env'
	exit 1
fi

banwords_path=/sdcard/Android/data/com.kakaogames.gdts/files/media/banwords/kakao_en-US_chat.txt
banwords_txt="${TMPDIR:-/tmp}/banwords.txt"
adb pull "$banwords_path" "$banwords_txt" | { grep error && exit 1; }
sed -i 's/\r$//' "$banwords_txt"
ban_grep() { grep -iF -f "$banwords_txt" "$@"; }

censor() {
	local censored=$1
	echo "$censored" | ban_grep --color=auto > /dev/stderr

	while read -r banword; do
		safeword=${banword/"${banword:0:1}"/&.}
		censored=${censored/"$banword"/$safeword}
	done < <(echo "$censored" | ban_grep -o)

	# call recursively until all banwords have been circu.mvented
	echo "$censored" | ban_grep -q \
		&& censor "$censored" \
		|| echo "$censored"
}

HISTFILE=~/chat_history
history -r

while read -erp'> ' msg; do
	history -s "$msg"
	history -w
	adb shell input text '"$(cat)"' <<< "$(censor "$msg")"
	adb shell input keyevent 66
done
