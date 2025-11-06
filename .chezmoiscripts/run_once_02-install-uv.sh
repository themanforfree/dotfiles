#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/../common/utils.sh"

set -Eeuo pipefail

if [ "${DOTFILES_DEBUG:-}" ]; then
    set -x
fi

function install_uv() {
    assert_installed "uv"
    # https://docs.astral.sh/uv/getting-started/installation/#standalone-installer
    curl -LsSf https://astral.sh/uv/install.sh | sh
}

function uninstall_uv() {
    # https://docs.astral.sh/uv/getting-started/installation/#uninstallation
    uv cache clean
    rm -rf "$(uv python dir)"
    rm -rf "$(uv tool dir)"
    rm -f "${HOME}/.cargo/bin/uv" "${HOME}/.cargo/bin/uvx"
}

function main() {
    install_uv
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
