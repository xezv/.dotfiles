#!/usr/bin/env bash
set -euo pipefail

CURRENT_TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S.%3N")
# CURRENT_DIR=$(dirname "${BASH_SOURCE[0]}")
CURRENT_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

# config directory path
SRC_DIR="${HOME}/dotfiles/config"
DST_DIR="${HOME}/.config"
BACKUP_DIR="${DST_DIR}/backup/.config.${CURRENT_TIMESTAMP}"
mkdir -p "${DST_DIR}"

source "${CURRENT_DIR}/scripts/update_version.sh"
exit_if_dotfiles_up_to_date

# Wezterm
mkdir -p "${DST_DIR}/wezterm"
ln -sf "${SRC_DIR}/wezterm/config.lua" "${DST_DIR}/wezterm/config.lua"

# Zellij
mkdir -p "${DST_DIR}/zellij"
ln -sf "${SRC_DIR}/zellij/config.kdl" "${DST_DIR}/zellij/config.kdl"

# Helix
# mkdir -p "${DST_DIR}/helix" -> error, overwrite existing helix
# ${SRC_DIR}/helix ${DST_DIR}/helix -> ${DST_DIR}helix/helix
# so the below is correct
ln -sf "${SRC_DIR}/helix/" "${DST_DIR}/"

# Fish
mkdir -p "${DST_DIR}/fish"
ln -sf "${SRC_DIR}/fish/config.fish" "${DST_DIR}/fish/config.fish"
ln -sf "${SRC_DIR}/fish/global_config.fish" "/etc/fish/config.fish"

# Bash
mkdir -p "${DST_DIR}/bash"
# link all files in bash directory
for FILE in "${SRC_DIR}/bash/"*; do
    # ln -sf "$file" "${CONFIG_DIR}/helix/${file##*/}"
    # `${var}##{pattern}/`
    # `${file##*/}` extracts text after last '/'
    # so the below is equivalent to the above but more readable
    ln -sf "${SRC_DIR}/bash/$(basename "${FILE}")" "${DST_DIR}/bash/$(basename "${FILE}")"
done

