#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")
CONFIG_DIR="${HOME}/.config"
CONFIG_GIT_HASH=

cd "$CURRENT_DIR"

exit_if_dotfiles_up_to_date() {
    # get the current git hash
    CURRENT_GIT_HASH=$(git -C "$CURRENT_DIR" rev-parse HEAD)

    # create a version file in the config directory if not exists
    if [ ! -f "${CONFIG_DIR}/.dotfiles_version" ]; then
        echo "${CURRENT_GIT_HASH}" >"${CONFIG_DIR}/.dotfiles_version"
    else
        # get the config git hash
        CONFIG_GIT_HASH=$(git -C "$CONFIG_DIR" rev-parse HEAD)
    fi

    if [ "$CURRENT_GIT_HASH" == "$CONFIG_GIT_HASH" ]; then
        echo "dotfiles already up to date"
        exit 0
    fi

    # update the config git hash
    CONFIG_GIT_HASH=${CURRENT_GIT_HASH}
}
