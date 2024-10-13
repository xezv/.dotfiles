#!/usr/bin/env bash
set -euo pipefail

CURRENT_TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S.%3N")
CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")

# config directory path
DOTFILES_DIR="${HOME}/.dotfiles"
CONFIG_DIR="${HOME}/.config"
BACKUP_DIR="${CONFIG_DIR}/backup/.config.${CURRENT_TIMESTAMP}"

# Wezterm
mkdir -p "${CONFIG_DIR}/wezterm"
ln -sf "${DOTFILES_DIR}/wezterm/config.lua" "${CONFIG_DIR}/wezterm/config.lua"

# Zellij
mkdir -p "${CONFIG_DIR}/zellij"
ln -sf "${DOTFILES_DIR}/zellij/config.kdl" "${CONFIG_DIR}/zellij/config.kdl"

# Helix
mkdir -p "${CONFIG_DIR}/helix"
ln -sf "${DOTFILES_DIR}/helix" "${CONFIG_DIR}/helix"

# Fish
mkdir -p "${CONFIG_DIR}/fish"
# # link all files in fish directory
for file in "${DOTFILES_DIR}/fish/"*; do
    # ln -sf "$file" "${CONFIG_DIR}/helix/${file##*/}"
    # `${var}##{pattern}/`
    # `${file##*/}` extracts text after last '/'
    # so the below is equivalent to the above but more readable
    ln -sf "$file" "${CONFIG_DIR}/fish/$(basename "$file")"
done
