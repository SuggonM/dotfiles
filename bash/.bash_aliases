alias abd="sl"
alias bat="batcat"
alias s3="aws s3 --no-sign-request"
alias python="python3"
alias code="code-insiders"
alias activate="source ~/.venv/bin/activate"
alias glog="git log --all --graph --pretty=format:'%C(auto)%h – %s  %d %C(bold green)(%ar) %C(cyan)<%aN>%Creset'"
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

# grep a pattern in bash history
function hist {
	history | grep "$@" --color=always | grep -n ' '
}
