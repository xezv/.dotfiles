#!/usr/bin/env bash
set -euo pipefail

set_alias_checked() {
    local CMD="$1"
    local ALIAS="$2"

    if ! command -v "$CMD" &>/dev/null; then
        echo "failed to set alias. command '$CMD' not found"
        return 1
    fi

    alias "$ALIAS"="$CMD"
}

set_alias_checked helix hx

# # source "${DOTFILES_DIR}/scripts/soft_rm.sh"
# alias rm="scripts/soft_rm.sh"
