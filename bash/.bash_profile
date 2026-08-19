# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# environment variables

# git, systemctl
export LESS=FRi
export SYSTEMD_LESS=FRi

# default and sudoedit
export EDITOR=nvim
export SUDO_EDITOR=nvim

# man  # https://github.com/sharkdp/bat/issues/3053#issuecomment-2259573578
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
