#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"
source "$CURRENT_DIR/variables.sh"

is_tmux_automatic_start_enabled() {
	local auto_start_value="$(get_tmux_option "$auto_start_option" "$auto_start_default")"
	[ "$auto_start_value" == "on" ]
}

is_osx() {
	[ $(uname) == "Darwin" ]
}

main() {
	if is_tmux_automatic_start_enabled; then
		if is_osx; then
			$CURRENT_DIR/handle_tmux_automatic_start/osx_enable.sh
		fi
	else
		if is_osx; then
			$CURRENT_DIR/handle_tmux_automatic_start/osx_disable.sh
		fi
	fi
}
main
