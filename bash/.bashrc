# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# https://github.com/akinomyoga/ble.sh#13-set-up-bashrc
BLESH="$HOME/.local/share/blesh/ble.sh"
[[ -f $BLESH ]] && source -- "$BLESH" --attach=none

[[ -f "$HOME/.bashrc_default" ]] && source "$HOME/.bashrc_default"

shopt -s globstar
shopt -s autocd

if [[ -n $SSH_CONNECTION ]]; then
	fastfetch --logo none
fi

function set_dollar {
	[[ -n $(jobs -p) ]] && DOLLAR_SIGN=% || DOLLAR_SIGN=$

	[[ $status -eq 0 ]] &&
		DOLLAR="\[\033[01;31m\]$DOLLAR_SIGN\001\002_" ||
		DOLLAR="\[\033[01;97m\]\[\033[01;41m\]$DOLLAR_SIGN\[\033[01;49m\]_"
}
function set_newline {
	NEWLINE="$NEWLINE_"
	NEWLINE_="\n"
}
function set_linebreak {
	LINEBREAK=${LINEBREAK-"\n"}
}
function set_subshell {
	SUBSHELL=${SHLVL/1/}
	SUBSHELL=${SUBSHELL:+(${SHLVL}) }
}

prompt() {
	status=$?
	set_dollar
	set_newline
	set_linebreak
	set_subshell
	history -a
	PS1="${NEWLINE}${SUBSHELL}\[\033[01;32m\][\#]\[\033[00m\]: \[\033[01;34m\]../\W/\[\033[00m\] ${VIRTUAL_ENV_PROMPT}${LINEBREAK}${DOLLAR}\[\033[00m\] "
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
