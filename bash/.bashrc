# skip bashrc if not running interactively
[[ $- != *i* ]] && return

# https://github.com/akinomyoga/ble.sh#13-set-up-bashrc
BLESH="$HOME/.local/share/blesh/ble.sh"
[[ -f $BLESH ]] && source -- "$BLESH" --attach=none

source "$HOME/.bashrc_default"

shopt -s globstar
shopt -s autocd
eval $(lesspipe)

if [[ -n $SSH_CONNECTION ]]; then
	# fastfetch --logo none
	neofetch --backend off
fi

function set_dollar {
	[[ ${__vsc_status:-$?} -eq 0 ]] &&
		DOLLAR="\[\033[01;31m\]\$\001\002_" ||
		DOLLAR="\[\033[01;97m\]\[\033[01;41m\]\$\[\033[01;49m\]_"
}
function set_newline {
	NEWLINE="$NEWLINE_"
	NEWLINE_="\n"
}
function set_linebreak {
	LINEBREAK=${LINEBREAK-"\n"}
}

prompt() {
	set_dollar
	set_newline
	set_linebreak
	history -a
	PS1="${NEWLINE}\[\033[01;32m\][\#]\[\033[00m\]: \[\033[01;34m\]../\W/ ${LINEBREAK}${DOLLAR}\[\033[00m\] ${VIRTUAL_ENV_PROMPT}"
}
PROMPT_COMMAND="prompt"

[[ ! ${BLE_VERSION-} ]] || ble-attach

############ auto added ############

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

. "$HOME/.deno/env"
