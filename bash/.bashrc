function testserver {
	while true; do
		local msg="Current time is $(date). Have a good day!"
		printf "HTTP/1.1 200 OK\r\n\r\n$msg" | nc -l 8080
	done
}

if [[ -n $SSH_CONNECTION ]]; then
	fastfetch --logo none
fi

alias updatedb="updatedb -U ~/storage/shared"

function ssh {
	command ssh "$@" || vim +':q'
}
