#!/usr/bin/env bash
set -euo pipefail

print_warning() {
    local MSG="$1"
    echo -e "\033[33m[warning]: $MSG\033[0m"
}
