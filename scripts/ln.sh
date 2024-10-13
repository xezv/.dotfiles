#!/usr/bin/env bash
set -euo pipefail

# BASH_SOURCE: array of the full path of the script
# `0` is the script itself
# `%/` is pathname expansion, removes the shortest match of the pattern from the end of the string
CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "${CURRENT_DIR}/confirm.sh"
source "${CURRENT_DIR}/print.sh"

ln_confirmed() {
    local SRC="$1"
    local DST="$2"

    local DST_DIR="$(dirname "$DST")"
    local DST_FILE="$(basename "$DST")"

    # if file exists, print warning message and continue to execute
    if [[ -f "$DST" ]]; then
        print_warning "$DST already exists at $DST_DIR. but continue to link"
    fi

    ln -sf "$SRC" "$DST"
}
