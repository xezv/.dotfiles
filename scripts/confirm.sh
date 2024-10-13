#!/usr/bin/env bash
set -euo pipefail

confirm() {
    local MSG="$1"
    local REPLY

    while true; do
        # `read` -rp: read with prompt and no newline, -n 1: read one character
        # `read` saves the result in the variable `REPLY`(default variable)
        # but to be more explicit, used `_reply`
        read -rp "$MSG [y/N]: " -n 1 REPLY
        echo
        case "$REPLY" in
        [Yy]) return 0 ;;
        [Nn]) return 1 ;;
        *) echo "invalid input. press [y] or [n]" ;;
        esac
    done
}
