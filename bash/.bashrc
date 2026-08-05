function testserver {
	while true; do
		local msg="Current time is $(date). Have a good day!"
		printf "HTTP/1.1 200 OK\r\n\r\n$msg" | nc -l 8080
	done
}

function playerctl {
	local host="${1:-ubuntu}"
	termux-notification --type media \
		--media-next "ssh $host playerctl next" \
		--media-pause "ssh $host playerctl play-pause" \
		--media-play "ssh $host playerctl stop" \
		--media-previous "ssh $host playerctl previous"
}

if [[ -n $SSH_CONNECTION ]]; then
	fastfetch --logo none
fi

alias updatedb="updatedb -U ~/storage/shared"

function ssh {
	command ssh "$@" || vim +':q'
}
