alias abd="sl"
alias bat="batcat"
alias s3="aws s3 --no-sign-request"
alias python="python3"
alias diff="git diff --no-index"
alias smbd="sudo /usr/sbin/smbd --foreground --no-process-group"
alias vim="nvim"
alias rebash="source ~/.bashrc"
alias fuck-it="sudo reboot" # use this trump card whenever a program says "your device needs a restart"
alias gssh="gh cs ssh"
alias ssh-vps='gh cs ssh --repo SuggonM/ghcs-vps "cd /workspaces/* && ./start.sh"'
alias vps="tmux new -A -dt vps && tmux send-keys -t vps 'ssh-vps' C-m"
alias wlocate="locate --database /var/lib/plocate/plocate-windows.db"
alias wupdatedb="updatedb --database-root /media/suggon/c -o /var/lib/plocate/plocate-windows.db"
alias sudo="sudo " # https://askubuntu.com/a/22043/1873035
alias archroot="sudo arch-chroot /mnt/arch su - suggon"
alias cp="cp --preserve=timestamps"

# when using adb pull, auto add -a (preserve timestamp) flag
function adb {
	if [[ "$1" == "pull" ]]; then
		command adb pull -a "${@:2}"
	else
		command adb "$@"
	fi
}

# set the minimum envs required inside chroot to share host's wayland
function wl-extend {
	export WAYLAND_DISPLAY=wayland-0
	export XDG_RUNTIME_DIR=/run/user/1000
	echo Run in host shell:
	echo sudo mount --bind /run/user/1000/ /mnt/$(cat /etc/hostname)/run/user/1000/
}

# grep a pattern in bash history
function hist {
	history | grep "$@" --color=always | grep -n ' '
}

# highlight command's --help text with bat
function help {
	"$@" --help | bat --plain --color=always -l help
}

function termux-set {
	ssh redmi termux-clipboard-set "$@"
}
function termux-get {
	local clipboard=$(ssh redmi termux-clipboard-get)
	# if Termux cannot access clipboard while running in bg,
	# retry by opening a temporary floating window
	if [ -z "$clipboard" ]; then
		ssh redmi am startservice com.termux.window/.TermuxFloatService &> /dev/null
		clipboard=$(ssh redmi termux-clipboard-get)
		(ssh redmi am stopservice com.termux.window/.TermuxFloatService &> /dev/null &)
	fi
	echo "$clipboard"
}

function printargs {
	echo "Total args: $#"
	i=1
	for arg in "$@"; do
		echo "arg $i: '$arg'"
		((i++))
	done
}
# make it available inside subshells
export -f printargs
